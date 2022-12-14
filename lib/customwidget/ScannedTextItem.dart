import 'package:flutter/material.dart';

class ScannedTextItem extends StatefulWidget {
  final String? line;
  const ScannedTextItem({Key? key, required this.line}) : super(key: key);

  @override
  State<ScannedTextItem> createState() => _ScannedTextItemState();
}

class _ScannedTextItemState extends State<ScannedTextItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.line ?? 'Undefined'),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
