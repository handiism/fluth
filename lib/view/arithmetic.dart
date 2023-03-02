import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluth/view/datadiri.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class Aritmatika extends StatefulWidget {
  const Aritmatika({super.key});

  @override
  State<Aritmatika> createState() => _AritmatikaState();
}

class _AritmatikaState extends State<Aritmatika> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  int result = 0;
  String angka1 = "";
  String angka2 = "";
  String operasi = "   ";
  String massage = " - ";

  add() {
    int num1 = int.parse(controller1.text);
    int num2 = int.parse(controller2.text);

    result = num1 + num2;
  }

  sub() {
    int num1 = int.parse(controller1.text);
    int num2 = int.parse(controller2.text);

    result = num1 - num2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjumlahan dan Pengurangan'),
        backgroundColor: const Color.fromARGB(255, 255, 18, 18),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) async {
              if (item == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataDiri(),
                  ),
                );
              } else {
                try {
                  await _firebaseAuth.signOut().then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil Mengeluarkan Akun"),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal Mengeluarkan Akun"),
                    ),
                  );
                }
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Data Diri'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Keluar"),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller1,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Angka 1',
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                  controller: controller2,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Angka 2',
                  )),
              const SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text(
                  "Hasil : ${result.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Center(child: Text("Operasi : $operasi")),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (int.tryParse(controller1.text) is! int ||
                        double.tryParse(controller1.text) is! double ||
                        int.tryParse(controller2.text) is! int ||
                        double.tryParse(controller2.text) is! double ||
                        controller1.text.isEmpty ||
                        controller2.text.isEmpty) {
                      //masukan angka
                      setState(() {
                        massage = "Silakan masukan Angka!!!";
                        angka1 = " ";
                        angka2 = " ";
                        result = 0;
                        operasi = "";
                      });
                    } else {
                      angka1 = controller1.text.toString();
                      angka2 = controller2.text.toString();
                      setState(() {
                        operasi = "$angka1 + $angka2";
                        massage = "-";
                        add();
                      });
                      Timer(const Duration(seconds: 1), () {
                        controller1.clear();
                        controller2.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 18, 18),
                  ),
                  child: const Text("Penjumlahan")),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (int.tryParse(controller1.text) is! int ||
                      double.tryParse(controller1.text) is! double ||
                      int.tryParse(controller2.text) is! int ||
                      double.tryParse(controller2.text) is! double ||
                      controller1.text.isEmpty ||
                      controller2.text.isEmpty) {
                    //masukan angka
                    setState(() {
                      massage = "Silakan masukan Angka!!!";
                      angka1 = " ";
                      angka2 = " ";
                      result = 0;
                      operasi = "";
                    });
                  } else {
                    angka1 = controller1.text.toString();
                    angka2 = controller2.text.toString();
                    setState(() {
                      operasi = "$angka1 - $angka2";
                      massage = "-";
                      add();
                    });
                    Timer(const Duration(seconds: 1), () {
                      controller1.clear();
                      controller2.clear();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 18, 18),
                ),
                child: const Text("Pengurangan"),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Massage",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        massage,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 250, 17, 0),
                            fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
