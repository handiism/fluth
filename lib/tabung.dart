import 'package:flutter/material.dart';

class Tabung extends StatefulWidget {
  const Tabung({super.key});

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  final TextEditingController jari = TextEditingController();
  final TextEditingController tinggi = TextEditingController();
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Luas & Volume",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: jari,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Jari-Jari',
                hintText: 'Masukkan jari-jari tabung',
                // errorText: 'Error message',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: tinggi,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi',
                hintText: 'Masukkan tinggi tabung',
                // errorText: 'Error message',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (jari.text.isEmpty || jari.text.isEmpty) {
                setState(() {
                  _message = "Pastikan setiap input terisi dengan benar";
                });
              }

              final double r = double.parse(jari.text.toString());
              final double t = double.parse(tinggi.text.toString());

              final phi = r % 10 == 0 ? 3.14 : 22 / 7;

              final luas = 2 * phi * r * (t + r);
              final volume = phi * r * r * t;

              setState(() {
                _message =
                    "Luas: ${luas.toStringAsFixed(1)}; Volume: ${volume.toStringAsFixed(1)}";
              });
            },
            child: const Text("Hitung"),
          ),
          Text(
            _message,
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
