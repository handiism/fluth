import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluth/navbar.dart';
import 'package:fluth/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masuk',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Divider(
              height: 10.0,
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: TextField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Colors.transparent,
            ),
            ElevatedButton(
              onPressed: _onPressed,
              child: const Text("Login"),
            ),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Belum punya akun? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Daftar",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
                            ),
                          );
                        },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onPressed() async {
    try {
      RegExp regex = RegExp(r"^\d{9}$");

      if (!regex.hasMatch(_usernameController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gagal Memasukkan Akun"),
          ),
        );

        return;
      }

      if (_passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Gagal Memasukkan Akun"),
          ),
        );

        return;
      }

      final email = "${_usernameController.text}@gmail.com";
      final password = "${_passwordController.text}password";

      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Berhasil Memasukkan Akun"),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Navbar(),
          ),
        );
      });
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gagal Memasukkan Akun"),
        ),
      );
    }
  }
}
