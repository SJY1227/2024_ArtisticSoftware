import 'package:flutter/material.dart';
import 'package:nahollo/screens/login_screen.dart';

class StartLogoScreen extends StatefulWidget {
  const StartLogoScreen({super.key});

  @override
  State<StartLogoScreen> createState() => _StartLogoScreenState();
}

class _StartLogoScreenState extends State<StartLogoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 2초 후에 다음 화면으로 이동
    Future.delayed(const Duration(seconds: 2), () {
      // 홈 화면으로 이동 (여기서 HomeScreen은 다음에 보여줄 화면을 의미)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF2E235C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nahollo_logo.png',
            )
          ],
        ),
      ),
    );
  }
}
