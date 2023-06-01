import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _navigateToHome();
  // }

  // _navigateToHome() async {
  //   await Future.delayed(const Duration(milliseconds: 1500), () {});
  //   // ignore: use_build_context_synchronously
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Image.asset('assets/images/logo.png'),
    );
  }
}
