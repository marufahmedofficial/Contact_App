import 'package:contact_app/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customwidgets/contact_item.dart';

class HomePage extends StatelessWidget {
  static const String routeName='/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Contacts'),),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = provider.contactList[index];
            return ContactItem(contact: contact, onUpdate: (id) {
              provider.updateFavorite(id);
            },);
          },
        ),
      ),
    );
  }
}
