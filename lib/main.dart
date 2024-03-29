import 'package:contact_app/contact_provider.dart';
import 'package:contact_app/pages/homepage.dart';
import 'package:contact_app/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'pages/contact_details.dart';
import 'pages/image_processing_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      builder: EasyLoading.init(),
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        ContactDetails.routeName : (context) => const ContactDetails(),
        ScanPage.routeName : (context) => const ScanPage(),
        ImageProcessingPage.routeName : (context) => const ImageProcessingPage(),
      },
    );
  }
}


