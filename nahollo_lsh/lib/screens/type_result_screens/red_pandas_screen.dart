import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nahollo/colors.dart';
import 'package:nahollo/screens/type_result_screens/red_panda_creating_screen.dart';
import 'package:o3d/o3d.dart';

class RedPandasScreen extends StatefulWidget {
  const RedPandasScreen({super.key});

  @override
  State<RedPandasScreen> createState() => _RedPandasScreenState();
}

class _RedPandasScreenState extends State<RedPandasScreen> {
  final O3DController controller = O3DController(); // 3D 모델 컨트롤러

  @override
  Widget build(BuildContext context) {
    // 화면의 너비와 높이를 가져옵니다.
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: lightpurpleColor, // 배경색 설정
      body: SingleChildScrollView(
        // 화면이 길어질 때 스크롤 가능하게 설정
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30), // 위아래 패딩 설정
                child: Container(
                  width: 350,
                  height: 1090, // 컨테이너 높이 설정
                  decoration: BoxDecoration(
                    color: Colors.white, // 컨테이너 배경색
                    borderRadius: BorderRadius.circular(15), // 둥근 모서리 설정
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // 내부 패딩 설정
                    child: Column(
                      children: [
                        const Text(
                          "혼자 노는 것도 잘하고\n같이 노는 것도 좋아", // 상단 텍스트
                          style: TextStyle(
                            color: darkpurpleColor, // 텍스트 색상
                            fontSize: 20, // 텍스트 크기
                            fontWeight: FontWeight.w600, // 텍스트 두께
                          ),
                        ),
                        const Text(
                          '래서판다', // 캐릭터 이름
                          style: TextStyle(
                            color: Color(0xFFf6841b), // 캐릭터 이름 색상
                            fontSize: 40, // 캐릭터 이름 크기
                            fontWeight: FontWeight.w600, // 캐릭터 이름 두께
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4), // 3D 모델 주변 패딩 설정
                          width: 300,
                          height: 300,
                          child: Card(
                            color: Colors.transparent, // 카드 배경 투명
                            elevation: 0, // 그림자 효과 제거
                            child: O3D(
                              disableTap: true, // 탭 동작 비활성화
                              disableZoom: true, // 줌 동작 비활성화
                              //cameraOrbit: CameraOrbit(1.2, 1, 4), 하면 커짐
                              // cameraTarget: CameraTarget(20, 20, 5), 하면 작아짐
                              controller: controller, // 3D 모델 컨트롤러 사용
                              autoPlay: true, // 자동 재생 설정
                              src: 'assets/glbs/test_1.glb', // 3D 모델 파일 경로
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "특징", // 특징 섹션 제목
                            style: TextStyle(
                                color: darkpurpleColor, // 텍스트 색상
                                fontSize: 25, // 텍스트 크기
                                fontWeight: FontWeight.w600), // 텍스트 두께
                          ),
                        ),
                        const Text(
                          '오징어는 위협을 받을 때 먹물을 뿜어내어 자신을 보호하는 행동 특성을 보여요. 이러한 특성은 주변 사람들을 돌보고 보호하는 데 열심인 성격이라고 할 수 있어요.',
                          style: TextStyle(
                            color: darkpurpleColor, // 텍스트 색상
                            fontSize: 18, // 텍스트 크기
                            fontWeight: FontWeight.w600, // 텍스트 두께
                          ),
                        ),
                        const SizedBox(
                          height: 30, // 텍스트와 버튼 사이의 여백
                        ),
                        const Text(
                          '오징어는 위협을 받을 때 먹물을 뿜어내어 자신을 보호하는 행동 특성을 보여요. 이러한 특성은 주변 사람들을 돌보고 보호하는 데 열심인 성격이라고 할 수 있어요.',
                          style: TextStyle(
                            color: darkpurpleColor, // 텍스트 색상
                            fontSize: 18, // 텍스트 크기
                            fontWeight: FontWeight.w600, // 텍스트 두께
                          ),
                        ),
                        const SizedBox(
                          height: 30, // 텍스트와 버튼 사이의 여백
                        ),
                        const Text(
                          '오징어는 위협을 받을 때 먹물을 뿜어내어 자신을 보호하는 행동 특성을 보여요. 이러한 특성은 주변 사람들을 돌보고 보호하는 데 열심인 성격이라고 할 수 있어요.',
                          style: TextStyle(
                            color: darkpurpleColor, // 텍스트 색상
                            fontSize: 18, // 텍스트 크기
                            fontWeight: FontWeight.w600, // 텍스트 두께
                          ),
                        ),
                        const SizedBox(
                          height: 30, // 텍스트와 버튼 사이의 여백
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RedPandaCreatingScreen(),
                                ));
                          }, //버튼 클릭시 래서판다 생성중 화면으로 이동
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkpurpleColor, // 버튼 배경색
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.5,
                            height: 50,
                            child: const Center(
                              child: Text(
                                "캐릭터로 지정하기", // 버튼 텍스트
                                style: TextStyle(
                                    color: lightpurpleColor,
                                    fontSize: 18), // 텍스트 색상과 크기
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.03, // 버튼 사이의 여백
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFf1f1f1), // 버튼 배경색
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.5,
                            height: 50,
                            child: const Center(
                              child: Text(
                                "테스트 공유하기", // 버튼 텍스트
                                style: TextStyle(
                                    color: darkpurpleColor,
                                    fontSize: 18), // 텍스트 색상과 크기
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
