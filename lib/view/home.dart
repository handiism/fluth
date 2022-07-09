import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluth/model/indonesian_hero.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<IndonesianHero> heroes = [];
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future _getData() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://indonesia-public-static-api.vercel.app/api/heroes",
        ),
      );
      List data = jsonDecode(response.body);
      for (var element in data) {
        heroes.add(IndonesianHero.fromJson(element));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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

          return false;
        } catch (e) {
          log(e.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Gagal Mengeluarkan Akun"),
            ),
          );
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Daftar Pahlawan"),
          actions: [
            PopupMenuButton<int>(
              onSelected: (item) async {
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
                  log(e.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal Mengeluarkan Akun"),
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Keluar"),
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: heroes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      title: Text(heroes[index].name),
                      subtitle: Text(
                        heroes[index].description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onTap: () {
                      AlertDialog dialog = AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                "Nama",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(heroes[index].name),
                              const Divider(),
                              const Text(
                                "Tahun Kelahiran",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(heroes[index].birthYear.toString()),
                              const Divider(),
                              const Text(
                                "Tahun Kematian",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(heroes[index].deathYear.toString()),
                              const Divider(),
                              const Text(
                                "Deskripsi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                heroes[index].description,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                              const Text(
                                "Tahun Pengukuhan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(heroes[index].ascensionYear.toString())
                            ],
                          ),
                        ),
                      );
                      dialog.build(context);
                      showDialog(
                          context: context, builder: (context) => dialog);
                    },
                  );
                },
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Icon(
                    Icons.signal_cellular_connected_no_internet_0_bar,
                  ),
                ),
                Center(child: Text("Tidak Ada Koneksi Internet"))
              ],
            );
          },
        ),
      ),
    );
  }
}
