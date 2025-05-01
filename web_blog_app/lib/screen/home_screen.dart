import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 웹뷰 컨트롤러 생성 및 초기화
    final WebViewController controller =
        WebViewController()
          // JavaScript 실행 허용
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          // 웹 페이지 로드
          ..loadRequest(Uri.parse('https://blog.codefactory.ai'));

    return Scaffold(
      // 앱바 위젯 추가
      appBar: AppBar(
        // 앱바 배경색을 오렌지색으로 설정
        backgroundColor: Colors.orange,
        // 앱바 타이틀 설정
        title: const Center(
          // 'Code Factory' 텍스트를 가운데 정렬
          child: Text('Code Factory'),
        ),
        // 홈 아이콘 액션 버튼 추가
        actions: [
          IconButton(
            onPressed: () {
              // 홈 버튼 클릭 시 블로그 메인 페이지로 이동
              controller.loadRequest(Uri.parse('https://blog.codefactory.ai'));
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      // 웹뷰 위젯 추가
      body: WebViewWidget(controller: controller),
    );
  }
}
