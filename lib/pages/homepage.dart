import 'package:contact_app/contact_provider.dart';
import 'package:contact_app/customwidget/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  static const String routeName='/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Contacts'),),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = provider.contactList[index];
            return Card(
              elevation: 5,
              child: ContactItem(contact: contact, onUpdate: (id) {
                provider.updateFavorite(id);
              },),
            );
          },
        ),
      ),
    );
  }
}
