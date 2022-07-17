import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/view/screens/login_screen.dart';
import 'package:hospital_management_system/viewmodels/provider/auth_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/image_provider.dart';
import 'package:hospital_management_system/widgets/dialog_auth.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  const ProfileScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future pickImage() async {
    try {
      var sp = await SharedPreferences.getInstance();
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final i = File(image.path);
      sp.setString('image', image.path);
      if (!mounted) return;
      Provider.of<MyImageProvider>(context, listen: false).changeImage(i);
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  void checkImage() async {
    var sp = await SharedPreferences.getInstance();
    var i = sp.getString('image');
    if (i != null) {
      if (!mounted) return;
      Provider.of<MyImageProvider>(context, listen: false).changeImage(File(i));
    }
  }

  @override
  void initState() {
    super.initState();
    checkImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Profile', 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: MyColors.blue()),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Consumer<MyImageProvider>(
                        builder: (context, provider, _) => CircleAvatar(
                          radius: 60,
                          backgroundColor: MyColors.neutral4(),
                          backgroundImage: provider.image != null
                              ? FileImage(provider.image!)
                              : null,
                          child: provider.image != null
                              ? null
                              : Icon(
                                  Icons.person,
                                  size: 80,
                                  color: MyColors.neutral5(),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        right: -12,
                        child: ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 9, 194, 222),
                            elevation: 0,
                            shape: const CircleBorder(),
                          ),
                          child: SvgPicture.asset('assets/camera.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(666),
                          color: const Color.fromARGB(255, 9, 194, 222),
                        ),
                        child: Center(
                            child: PoppinsText.whiteBold('Spesialis', 14)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  PoppinsText.blueBold(widget.userName, 16),
                  const SizedBox(height: 5),
                  PoppinsText.neutral5Bold('Dokter Umum', 12),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              height: 50,
              color: MyColors.neutral3(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/profile.svg'),
                      label: PoppinsText.secondary7SemiBold(
                          '    Informasi data dokter', 14)),
                  const SizedBox(height: 5),
                  Consumer<LogoutProvider>(
                    builder: (context, provider, _) => TextButton.icon(
                        onPressed: () async {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => const SimpleDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              children: [
                                Center(
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 8,
                                      )),
                                ),
                              ],
                            ),
                          );

                          await Provider.of<LogoutProvider>(context,
                                  listen: false)
                              .logout();

                          if (provider.state == LogoutState.error) {
                            if (!mounted) return;
                            Navigator.pop(context);
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => dialogAuth(
                                  context,
                                  'Logout Error',
                                  'Terdapat masalah, tolong hubungi teknisi'),
                            );
                            provider.changeState(LogoutState.standby);
                          } else if (provider.state == LogoutState.success) {
                            var sp = await SharedPreferences.getInstance();
                            await sp.setBool('loginStatus', false);
                            await sp.remove('user');
                            await sp.remove('accessToken');
                            await sp.remove('refreshToken');
                            if (!mounted) return;
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false);
                            provider.changeState(LogoutState.standby);
                          }
                        },
                        icon: SvgPicture.asset('assets/logout.svg'),
                        label:
                            PoppinsText.secondary7SemiBold('    Logout', 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
