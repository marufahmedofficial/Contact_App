import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/pages/contact_details.dart';
import 'package:flutter/material.dart';


class ContactItem extends StatelessWidget {
  final ContactModel contact;
  final Function(int) onUpdate;

  const ContactItem({Key? key, required this.contact, required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, ContactDetails.routeName,
          arguments: contact),
      title: Text(contact.name),
      trailing: IconButton(
        onPressed: () {
          onUpdate(contact.id);
        },
        icon: Icon(contact.favorite ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
