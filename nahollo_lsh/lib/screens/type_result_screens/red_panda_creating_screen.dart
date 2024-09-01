import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nahollo/colors.dart';
import 'package:nahollo/screens/main_screen.dart';

class RedPandaCreatingScreen extends StatefulWidget {
  const RedPandaCreatingScreen({super.key});

  @override
  State<RedPandaCreatingScreen> createState() => _RedPandaCreatingScreenState();
}

class _RedPandaCreatingScreenState extends State<RedPandaCreatingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(); // 애니메이션 반전
        } else if (status == AnimationStatus.dismissed) {
          // reverse 애니메이션이 끝난 후 다음 화면으로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        }
      },
    );

  late final Animation<double> _animation =
      Tween<double>(begin: 0.0, end: 0.8).animate(_curve);

  late final CurvedAnimation _curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// 화면의 너비와 높이를 가져옵니다.
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkpurpleColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
            ),
            const Text(
              '혼자 노는 것도 잘하고 \n같이 노는 것도 좋아',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text(
              "래서판다",
              style: TextStyle(
                color: Color(0xFFf6841b),
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.yellow.withOpacity(0.6), // 중심부
                        Colors.yellow.withOpacity(0.3),
                        Colors.yellow.withOpacity(0.1), // 바깥쪽은 거의 투명
                        Colors.yellow.withOpacity(0.05),
                        Colors.transparent, // 완전히 투명 (빛의 끝부분)
                      ], //처음에 무슨 색을 가질지 설정, 먼저 나온 색이 중심색 나중에 나온 색이 끝부분 색,
                      stops: [
                        _animation.value * 0.2, // 중심부는 고정
                        _animation.value * 0.5, // 중간 부분
                        _animation.value * 0.7, // 바깥쪽 부분
                        _animation.value * 0.9,
                        _animation.value * 1.0, // 완전히 투명해지는 부분
                      ], //색이 어디서 변할지 위치 선정 0.0이 중심 1.0이 끝부분
                      center: Alignment.center,
                      radius: _animation.value,
                    ),
                  ),
                  child: Image.asset('assets/images/red_panda.png'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
