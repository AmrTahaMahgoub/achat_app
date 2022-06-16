import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  static String id = 'test';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      //upperBound: 100.0,

      //value: 2.0,
    );
    animation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller!);

    controller?.forward();
    controller?.addListener(() {
      setState(() {});
      animation?.value;

      print(animation?.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: animation?.value,
        child: Center(
            child: Text(
          'hello',
          style: TextStyle(fontSize: 60),
        )),
      ),
    );
  }
}
