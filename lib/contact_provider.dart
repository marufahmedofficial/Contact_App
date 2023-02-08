import 'dart:io';

import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';

class ContactProvider extends ChangeNotifier {
  List<String?> textLines = [];
  List<ContactModel> contactList = [
    ContactModel(
        id: 1,
        name: 'ABC',
        mobile: '01711000001',
        email: 'abc@gmail.com',
        streetAddress: 'Kawranbazar, Dhaka',
        website: 'www.google.com',
        image: 'images/person.png'),
    ContactModel(
        id: 2,
        name: 'DEF',
        mobile: '01711000002',
        email: 'def@gmail.com',
        streetAddress: 'Dhanmondi, Dhaka',
        website: 'flutter.dev',
        favorite: true,
        image: 'images/person.png'),
    ContactModel(
        id: 3,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 4,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 5,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 6,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 7,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 8,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 9,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 10,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 11,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 12,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 13,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 14,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 15,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 16,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 17,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 18,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 19,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 20,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
    ContactModel(
        id: 21,
        name: 'GHI',
        mobile: '01711000003',
        email: 'ghi@gmail.com',
        streetAddress: 'Mirpur, Dhaka',
        website: 'flutter.dev',
        image: 'images/person.png'),
  ];

  void updateFavorite(int id) {
    final contact = contactList.firstWhere((element) => element.id == id);
    final index = contactList.indexOf(contact);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }

  Future<void> processCardImage(String imagePath) async {
    textLines.clear();
    final GoogleVisionImage visionImage =
        GoogleVisionImage.fromFile(File(imagePath));
    final TextRecognizer textRecognizer =
        GoogleVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    for (var block in visionText.blocks) {
      for (var line in block.lines) {
        textLines.add(line.text);
      }
    }
  }
}
