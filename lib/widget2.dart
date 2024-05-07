import 'package:flutter/material.dart';

class Widget2 extends StatefulWidget {
  const Widget2({super.key});
  static const String routeName = '/widget2';

  @override
  State<Widget2> createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
  String npm = '';
  String nama = '';
  String mk = '';
  double nilaitugas = 0.0;
  double nilaiuts = 0.0;
  double nilaiuas = 0.0;
  double totalnilai = 0.0;
  String grade = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (data != null) {
      npm = data['npm'] ?? '';
      nama = data['nama'] ?? '';
      mk = data['mk'] ?? '';
      nilaitugas = double.tryParse(data['nilaitugas'] ?? '0') ?? 0.0;
      nilaiuts = double.tryParse(data['nilaiuts'] ?? '0') ?? 0.0;
      nilaiuas = double.tryParse(data['nilaiuas'] ?? '0') ?? 0.0;

      // Calculate total score
      totalnilai = (nilaitugas + nilaiuts + nilaiuas) / 3;

      // Determine the grade based on total score
      if (totalnilai >= 80 && totalnilai <= 100) {
        grade = 'A';
      } else if (totalnilai >= 70 && totalnilai < 80) {
        grade = 'B';
      } else if (totalnilai >= 60 && totalnilai < 70) {
        grade = 'C';
      } else if (totalnilai >= 50 && totalnilai < 60) {
        grade = 'D';
      } else {
        grade = 'E';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('img/Erin.jpg'),
                  ),
                ),
                SizedBox(height: 50),
                Text('Npm: $npm', style: TextStyle(fontSize: 20)),
                Text('Nama: $nama', style: TextStyle(fontSize: 20)),
                Text('Matakuliah: $mk', style: TextStyle(fontSize: 20)),
                Text('Nilai Tugas: $nilaitugas',
                    style: TextStyle(fontSize: 20)),
                Text('Nilai UTS: $nilaiuts', style: TextStyle(fontSize: 20)),
                Text('Nilai UAS: $nilaiuas', style: TextStyle(fontSize: 20)),
                Text('Total Nilai: $totalnilai',
                    style: TextStyle(fontSize: 20)),
                Text('Grade: $grade', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}