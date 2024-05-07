import 'package:flutter/material.dart';
import 'package:uts/widget2.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  static String routeName = '/widget1';

  @override
  State<MyWidget> createState() => _MyWidget();
}

class _MyWidget extends State<MyWidget> {
  TextEditingController txtNpm = TextEditingController();
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtMk = TextEditingController();
  TextEditingController txtNilaitugas = TextEditingController();
  TextEditingController txtNilaiuts = TextEditingController();
  TextEditingController txtNilaiuas = TextEditingController();
  TextEditingController txtTotalNilai = TextEditingController();
  TextEditingController txtGrade = TextEditingController();

  String grade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Input Nilai Mahasiswa'),
        ),
        backgroundColor: Color.fromARGB(255, 212, 246, 255),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: txtNpm,
                  decoration: InputDecoration(hintText: 'Masukan NPM: '),
                ),
                TextField(
                  controller: txtNama,
                  decoration: InputDecoration(hintText: 'Masukan Nama: '),
                ),
                TextField(
                  controller: txtMk,
                  decoration: InputDecoration(hintText: 'Masukan Matakuliah: '),
                ),
                TextField(
                  controller: txtNilaitugas,
                  decoration: InputDecoration(hintText: 'Masukan Nilai Tugas: '),
                ),
                TextField(
                  controller: txtNilaiuts,
                  decoration: InputDecoration(hintText: 'Masukan Nilai UTS: '),
                ),
                TextField(
                  controller: txtNilaiuas,
                  decoration: InputDecoration(hintText: 'Masukan Nilai UAS: '),
                ),
                SizedBox(
                  height: 25,
                ),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Widget2.routeName,
                          arguments: {
                            "npm": txtNpm.text,
                            "nama": txtNama.text,
                            "mk": txtMk.text,
                            "nilaitugas": txtNilaitugas.text,
                            "nilaiuts": txtNilaiuts.text,
                            "nilaiuas": txtNilaiuas.text,
                            "totalnilai": txtTotalNilai.text,
                            "grade" : txtGrade.text
                          });
                    },
                    child: const Text('Submit')),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
