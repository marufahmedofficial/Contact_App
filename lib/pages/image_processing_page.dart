import 'package:contact_app/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customwidgets/ScannedTextItem.dart';

class ImageProcessingPage extends StatefulWidget {
  static const String routeName='/image_processing';
  const ImageProcessingPage({Key? key}) : super(key: key);

  @override
  State<ImageProcessingPage> createState() => _ImageProcessingPageState();
}

class _ImageProcessingPageState extends State<ImageProcessingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Information'),),
      body: Consumer<ContactProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Name: '),
                          Text(''),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Mobile: '),
                          Text(''),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Email: '),
                          Text(''),
                        ],
                      ),
                      Wrap(

                        children: [
                          const Text('Address: '),
                          Text(''),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Website: '),
                          Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: value.textLines.length,
                        itemBuilder: (context, index) => ScannedTextItem(line: value.textLines[index]),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Set Name'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Set Mobile'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Set Email'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Set Address'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Set Website'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
