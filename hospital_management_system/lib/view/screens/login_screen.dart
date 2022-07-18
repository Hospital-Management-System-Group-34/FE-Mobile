import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/view/screens/home_screen.dart';
import 'package:hospital_management_system/viewmodels/provider/auth_provider.dart';
import 'package:hospital_management_system/widgets/dialog_auth.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controllerId = TextEditingController();
  var controllerPassword = TextEditingController();
  late SharedPreferences sp;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    controllerId.dispose();
    controllerPassword.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LoginProvider>(context, listen: false)
          .changeState(LoginState.standby);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset('assets/svg1.svg'),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.white(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 328,
                  height: 385,
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Consumer<LoginProvider>(
                        builder: (context, provider, _) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PoppinsText.blueBold('LOGIN', 40),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText.blackBold('ID', 16),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'ID required';
                                        }
                                        return null;
                                      },
                                      controller: controllerId,
                                      enabled:
                                          provider.state != LoginState.standby
                                              ? false
                                              : true,
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: MyColors.neutral6(),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'Masukkan ID kamu',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyColors.neutral7(),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyColors.neutral6(),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    PoppinsText.blackBold('Password', 16),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password required';
                                        }
                                        return null;
                                      },
                                      controller: controllerPassword,
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      enabled:
                                          provider.state != LoginState.standby
                                              ? false
                                              : true,
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: MyColors.neutral6(),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText: 'Masukkan password kamu',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyColors.neutral7(),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: MyColors.neutral6(),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: provider.state != LoginState.standby
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        await Provider.of<LoginProvider>(
                                                context,
                                                listen: false)
                                            .login(controllerId.text.trim(),
                                                controllerPassword.text.trim());

                                        if (provider.state ==
                                            LoginState.error) {
                                          if (provider.loginModel?.code ==
                                              400) {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => dialogAuth(
                                                  context,
                                                  'Password Salah',
                                                  'Password yang anda masukkan salah. Silahkan coba kembali.'),
                                            );
                                          } else if (provider
                                                  .loginModel?.code ==
                                              404) {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => dialogAuth(
                                                  context,
                                                  'Tidak Bisa Menemukan Akun',
                                                  'Tidak dapat menemukan akun. Silahkan periksa kembali id yang anda masukkan dan coba lagi.'),
                                            );
                                          } else {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => dialogAuth(
                                                  context,
                                                  'Unknown Error',
                                                  'Terdapat masalah, tolong hubungi teknisi'),
                                            );
                                          }
                                        } else if (provider.state ==
                                            LoginState.success) {
                                          sp = await SharedPreferences
                                              .getInstance();
                                          sp.setBool('loginStatus', true);
                                          sp.setString('user',
                                              '${provider.loginModel?.data?.userName}');
                                          sp.setString('accessToken',
                                              '${provider.loginModel?.data?.accessToken}');
                                          sp.setString('refreshToken',
                                              '${provider.loginModel?.data?.refreshToken}');
                                          if (!mounted) return;
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            transition(type: PageTransitionType.fade, page: HomeScreen(userName: "${provider.loginModel?.data?.userName}"),),
                                            (route) => false,
                                          );
                                        }
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(280, 60),
                                  elevation: 0,
                                  primary: MyColors.blue()),
                              child: provider.state == LoginState.processing
                                  ? const CircularProgressIndicator()
                                  : PoppinsText.whiteBold('LOGIN', 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
