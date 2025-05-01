import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  int counter = 0;

  void onClicked() {
    setState(() {
      counter = counter + 1;
      addNumberToList();
    });
  }

  void setZero() {
    setState(() {
      counter = 0;
      reSetList();
    });
  }

  List<int> numbers = [];

  void addNumberToList() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void reSetList() {
    setState(() {
      numbers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTtitle() : Text('nothing'),
              IconButton(
                iconSize: 40,
                onPressed: toggleTitle,
                icon: Icon(Icons.remove_red_eye),
              ),
              Text('$counter', style: TextStyle(fontSize: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    onPressed: onClicked,
                    icon: Icon(Icons.add_box_rounded),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: setZero,
                    icon: Icon(Icons.exposure_zero_rounded),
                  ),
                ],
              ),
              for (var n in numbers) Text('$n'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTtitle extends StatefulWidget {
  const MyLargeTtitle({super.key});

  @override
  State<MyLargeTtitle> createState() => _MyLargeTtitleState();
}

class _MyLargeTtitleState extends State<MyLargeTtitle> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
