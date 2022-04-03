import 'package:flutter/material.dart';

class APage extends StatelessWidget {
  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Page'),
      ),
      body: Center(
        child: Text("hello, i am a page"),
      ),
    );
  }
}
