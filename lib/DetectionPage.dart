import 'dart:io';

import 'Result page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetectionPage extends StatefulWidget {
  Map<String, String> detection;

  DetectionPage({Key? key, required this.detection}) : super(key: key);

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  late  XFile? image=null;
  Future<XFile?> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image;

    // Get image from camera or gallery
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera, // or ImageSource.gallery
    );
    if (pickedFile != null) {
      image = XFile(pickedFile.path);
    }

    return image;
  }
  bool _isImageLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.detection["title"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 300,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                        image: AssetImage(widget.detection["image"]!), height: 200),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Select Image from Gallery and then click predict to predict data",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                     image = await _getImage();
                      if (image != null) {
                     print("pickedImage");
                      }
                    },
                    child: Text("Select Image from Gallery")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            detection: {
                              "title": "Predicted Data",
                              "image": image!.path,
                              "description": " Data will be shown here",
                            },
                          ),
                        ),
                      );

                    },
                    child: Text("Predict")),
                Text(
                  widget.detection["text"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                _isImageLoaded
                    ? Container(
                        height: 300,
                        width: 280,
                        child: Image.file(
                          File(image!.path),
                          height: 200,
                        )
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RaisedButton {}
