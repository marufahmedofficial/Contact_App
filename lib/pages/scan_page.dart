import 'dart:io';
import 'package:contact_app/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'image_processing_page.dart';

class ScanPage extends StatefulWidget {
  static const String routeName='/scan';
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Visiting Card'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 5,
              child: imagePath == null ?
              Image.asset('images/person.png', width: 300, height: 200,) :
              Image.file(File(imagePath!), width: 300, height: 200,),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Capture'),
                ),
                TextButton.icon(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo),
                  label: const Text('Gallery'),
                ),
              ],
            ),
            if(imagePath != null) TextButton(
              onPressed: () => Navigator.pushNamed(context, ImageProcessingPage.routeName),
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if(file != null) {
      EasyLoading.show(status: 'Processing your image. Please wait', dismissOnTap: false);
      Provider
          .of<ContactProvider>(context, listen: false)
          .processCardImage(file.path)
          .then((value) {
        EasyLoading.dismiss();
        setState(() {
          imagePath = file.path;
        });

      }).catchError((error) {
        EasyLoading.dismiss();
      });
    }
  }
}
