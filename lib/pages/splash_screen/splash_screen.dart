import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/route_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (tick) {
      Navigator.pushReplacementNamed(context, MyRoute.homepage);
      tick.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage("lib/assets/gif/Printing invoices.gif"),
            ),
          ],
        ),
        // child: RefreshProgressIndicator(),
      ),
    );
  }
}
