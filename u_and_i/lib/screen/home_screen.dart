import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now(); // 현재 날짜를 가져옴

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _DDay(onHeartPressed: onHeartPressed, firstDay: firstDay),
            ), // _DDay 위젯을 Expanded로 감쌈
            Expanded(child: _CoupleImage()), // _CoupleImage 위젯을 Expanded로 감쌈
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              initialDateTime: firstDay,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date; // 첫 만남 날짜를 선택한 날짜로 변경
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed; // Heart 버튼 클릭 시 호출되는 콜백
  final DateTime firstDay; // 첫 만남 날짜
  const _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  }); // 생성자에서 콜백을 받음

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    final DateTime now = DateTime.now(); // 현재 날짜
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text('U&I', style: TextTheme.displayLarge),
        const SizedBox(height: 16.0),
        Text('우리 처음 만난 날', style: TextTheme.bodyLarge),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: TextTheme.bodyMedium,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(Icons.favorite, color: Colors.red),
        ),
        const SizedBox(height: 16.0),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: TextTheme.displayMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('asset/img/middle_image.png');
  }
}
