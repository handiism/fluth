import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 190.0,
                height: 190.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/small/avatar/dos:2d1964e11562f8f7873bc48a3a1b3a6320230225114141.png"),
                  ),
                ),
              ),
            ),
            const Text(
              "Muhammad Handi Rachmawan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              "Teknologi Pemrograman Mobile IF-C",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              "123200125",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              "Lahir pada 20 Agustus 2001",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              "Hobi Rebahan",
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
