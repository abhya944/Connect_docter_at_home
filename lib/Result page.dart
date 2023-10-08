import 'dart:io';

import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  Map<String, dynamic> detection;
   ResultPage({Key? key,required this.detection}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detection["title"]!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.detection["title"]!,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.detection["description"]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.file(
              File(widget.detection["image"]!),
              height: 200,
              width: 200,
            ),
          ],
        ),
      )
    );
  }
}
