import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9EEFA),
      body: Center(
        child: Text(
          'News',
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w800,
            color: Color(0xff2D5BD0),
          ),
        ),
      ),
    );
  }
}
