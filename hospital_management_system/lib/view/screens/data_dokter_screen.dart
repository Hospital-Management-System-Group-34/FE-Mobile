import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewmodels/provider/doctor_provider.dart';
import 'package:hospital_management_system/widgets/custom_disabled_textfield.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

class DataDokterScreen extends StatefulWidget {
  const DataDokterScreen({Key? key}) : super(key: key);

  @override
  State<DataDokterScreen> createState() => _DataDokterScreenState();
}

class _DataDokterScreenState extends State<DataDokterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Informasi Data Dokter', 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: MyColors.blue()),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Consumer<DoctorProvider>(
          builder: (context, provider, _) {
            var dok = provider.doctorModel?.data?.user;
            if (provider.state != DoctorState.loaded) {
              return hasilSesi(
                  nama: '-',
                  poli: '-',
                  role: '-',
                  handphone: '-',
                  alamat: '-',
                  tanggalLahir: '-');
            } else {
              return hasilSesi(
                  nama: dok!.name!,
                  poli: dok.speciality!,
                  role: dok.role!,
                  handphone: dok.phone!,
                  alamat: dok.address!,
                  tanggalLahir: dok.birthDate!);
            }
          },
        ),
      ),
    );
  }

  Widget hasilSesi({
    required String nama,
    required String poli,
    required String role,
    required String handphone,
    required String alamat,
    required String tanggalLahir,
  }) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsText.neutral9Medium('Nama Lengkap', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(nama),
          const SizedBox(
            height: 10,
          ),
          PoppinsText.neutral9Medium('Poli', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(poli),
          const SizedBox(
            height: 10,
          ),
          PoppinsText.neutral9Medium('Role', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(role),
          const SizedBox(
            height: 10,
          ),
          PoppinsText.neutral9Medium('No. Handphone', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(handphone),
          const SizedBox(
            height: 10,
          ),
          PoppinsText.neutral9Medium('Alamat', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(alamat),
          const SizedBox(
            height: 10,
          ),
          PoppinsText.neutral9Medium('Tanggal Lahir', 16),
          const SizedBox(
            height: 10,
          ),
          myDisabledTextField(tanggalLahir),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
