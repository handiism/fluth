import 'package:flutter/material.dart';

class DataDiri extends StatefulWidget {
  const DataDiri({super.key});

  @override
  State<DataDiri> createState() => _DataDiriState();
}

class _DataDiriState extends State<DataDiri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Data Kelompok"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                      child: Column(children: const [
                    Text(
                      'Muhamad Handi Rachmawan',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text("123200125")
                  ])),
                ),
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                      child: Column(children: const [
                    Text(
                      'Mochammad Farhan Fansuri',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text("123200127")
                  ])),
                ),
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                      child: Column(children: const [
                    Text(
                      'Melanio Daris Ramadhan',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text("123200136")
                  ])),
                ),
              ),
            ],
          )),
        ));
  }
}
