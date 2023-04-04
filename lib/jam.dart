import 'package:flutter/material.dart';
import 'dart:async';

class Jam extends StatefulWidget {
  const Jam({super.key});

  @override
  State<Jam> createState() => _JamState();
}

class _JamState extends State<Jam> {
  var hours = DateTime.now();

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        hours = DateTime.now().toUtc();
      });
    });

    if (mounted) {
      setState(() {
        hours = DateTime.now().toUtc();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'WIB'),
              Tab(text: 'WITA'),
              Tab(text: 'WIT'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // WIB
            _time(7),
            _time(8),
            _time(9),
          ],
        ),
      ),
    );
  }

  _time(int number) {
    var time = hours.add(Duration(hours: number));

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${time.hour}:${time.minute}",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
