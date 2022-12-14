import 'dart:io';
import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactDetails extends StatelessWidget {
  static const String routeName = '/details';

  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: ListView(
        children: [
          Image.asset(
            contact.image!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(contact.mobile),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    callContact(contact.mobile);
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sms),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(contact.email!),
            trailing: IconButton(
              onPressed: () {
                sendEmail(contact.email!);
              },
              icon: Icon(Icons.email),
            ),
          ),
          ListTile(
            title: Text(contact.streetAddress!),
            trailing: IconButton(
              onPressed: () {
                showMap(contact.streetAddress!);
              },
              icon: Icon(Icons.location_on),
            ),
          ),
          ListTile(
            title: Text(contact.website!),
            trailing: IconButton(
              onPressed: () {
                showWeb(contact.website!);
              },
              icon: Icon(Icons.web),
            ),
          ),
        ],
      ),
    );
  }

  void callContact(String mobile) async {
    final urlString = 'tel:$mobile';
    if(await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }

  void showMap(String streetAddress) async {
    String urlString = '';
    if(Platform.isAndroid) {
      urlString = 'geo:0,0?q=$streetAddress';
    } else if (Platform.isIOS) {
      urlString = 'http://maps.apple.com/?q=$streetAddress';
    }
    if(await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }

  void sendEmail(String email) async {
    final urlString = 'mailto:$email';
    if(await canLaunchUrlString(urlString)) {
    await launchUrlString(urlString);
    } else {
    throw 'cannot perform this operation';
    }
  }

  void showWeb(String s) async {
    final urlString = 'https://$s';
    if(await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }
}
