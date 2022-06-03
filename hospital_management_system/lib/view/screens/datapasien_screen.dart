import 'package:flutter/material.dart';

import '../../widgets/poppins_text.dart';

class DataPasien extends StatefulWidget {
  const DataPasien({Key? key}) : super(key: key);

  @override
  State<DataPasien> createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Data Pasien', 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Column(
          children : [
            // SizedBox(
            //           child: TextFormField(
            //             key: Key('search'),
            //             style: const TextStyle(
            //               fontSize: 16,
            //             ),
            //             decoration: InputDecoration(
            //               contentPadding:
            //                   const EdgeInsets.symmetric(vertical: 4.0),
            //               prefixIcon: const Icon(Icons.search_rounded),
            //               hintStyle: PoppinsText.blackBold().styleText(16),
            //               hintText: "Search",
            //               filled: true,
            //               isDense: true,
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //           ),
            //         ),

          ]
        )
      ),
    );
    
  }
}