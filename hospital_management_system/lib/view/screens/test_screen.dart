import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/widgets/custom_textfield.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final dropValue = ValueNotifier('');
  final dropItem = ['Ada', 'Tidak Ada'];

  final listValue = ValueNotifier('');
  final listItem = ['sapi', 'bebek', 'kuda', 'kijang'];
  bool isOpen = false;

  var kontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: MyColors.neutral9(),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: const Icon(Icons.expand_more),
                        value: (value.isEmpty) ? null : value,
                        hint: Text(
                          'Apakah pasien ada alergi obat?',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: MyColors.neutral6(),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onChanged: (inputan) =>
                            dropValue.value = inputan.toString(),
                        items: dropItem
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: MyColors.black(),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              myTextField(
                controller: kontrol,
                textInputType: TextInputType.text,
                maxLines: 3,
                minLines: 1,
                hintText: 'hintText',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
