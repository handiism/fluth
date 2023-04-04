import 'package:flutter/material.dart';
import 'package:fluth/tabung.dart';
import 'package:fluth/trapesium.dart';
import 'package:fluth/profil.dart';
import 'package:fluth/jam.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Trapesium(),
    Tabung(),
    Jam(),
    Profil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTS TPM'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/trapeziom.svg"),
            label: 'Trapesium',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/cylinder.svg"),
            label: 'Tabung',
            backgroundColor: Colors.blue,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Jam',
            backgroundColor: Colors.blue,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
