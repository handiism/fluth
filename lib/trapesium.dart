import 'package:flutter/material.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({super.key});

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();

  String _message = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Luas'),
              Tab(text: 'Keliling'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _trapesium(),
                    _field("Panjang t", c1),
                    _field("Panjang a", c2),
                    _field("Panjang b", c3),
                    ElevatedButton(
                      onPressed: _luas,
                      child: const Text("Hitung"),
                    ),
                    _hasil()
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _trapesium(),
                    _field("Panjang a", c1),
                    _field("Panjang b", c2),
                    _field("Panjang c", c3),
                    _field("Panjang d", c4),
                    ElevatedButton(
                      onPressed: _keliling,
                      child: const Text("Hitung"),
                    ),
                    _hasil()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _trapesium() {
    return Image.asset(
      "assets/icons/trapesium.jpg.webp",
      width: MediaQuery.of(context).size.width / 2,
    );
  }

  _luas() {
    if (c1.text.isEmpty || c2.text.isEmpty || c3.text.isEmpty) {
      setState(() {
        _message = "Pastikan setiap input terisi dengan benar";
      });
    }

    final double t = double.parse(c1.text.toString());
    final double a = double.parse(c2.text.toString());
    final double b = double.parse(c3.text.toString());

    final luas = 1 / 2 * (a + b) * t;

    setState(() {
      _message = "Hasil: ${luas.toStringAsFixed(1)}";
    });
  }

  _hasil() {
    return Text(
      _message,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  _keliling() {
    if (c1.text.isEmpty ||
        c2.text.isEmpty ||
        c3.text.isEmpty ||
        c4.text.isEmpty) {
      setState(() {
        _message = "Pastikan setiap input terisi dengan benar";
      });
    }

    final double a = double.parse(c1.text.toString());
    final double b = double.parse(c2.text.toString());
    final double c = double.parse(c3.text.toString());
    final double d = double.parse(c4.text.toString());

    final keliling = a + b + c + d;

    setState(() {
      _message = "Hasil: ${keliling.toStringAsFixed(1)}";
    });
  }

  _field(String label, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: c,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Masukkan ${label.toLowerCase()}',
          // errorText: 'Error message',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
