import 'dart:io';

import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';


class ContactProvider extends ChangeNotifier {
  List<String?> textLines = [];
  List<ContactModel> contactList = [
    ContactModel(id: 1, name: 'ABC', mobile: '01711000001', email: 'abc@gmail.com', streetAddress: 'Kawranbazar, Dhaka', website: 'www.google.com', image: 'images/person.png'),
    ContactModel(id: 2, name: 'DEF', mobile: '01711000002', email: 'def@gmail.com', streetAddress: 'Dhanmondi, Dhaka', website: 'flutter.dev', favorite: true ,image: 'images/person.png'),
    ContactModel(id: 3, name: 'GHI', mobile: '01711000003', email: 'ghi@gmail.com', streetAddress: 'Mirpur, Dhaka', website: 'flutter.dev', image: 'images/person.png'),
  ];

  void updateFavorite(int id) {
    final contact = contactList.firstWhere((element) => element.id == id);
    final index = contactList.indexOf(contact);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }

  Future<void> processCardImage(String imagePath) async {
    textLines.clear();
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(File(imagePath));
    final TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);
    for(var block in visionText.blocks) {
      for(var line in block.lines) {
        textLines.add(line.text);
      }
    }
  }
}