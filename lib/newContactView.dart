import 'package:flutter/material.dart';
import 'package:state_management_chapter1/HomePage.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({Key? key}) : super(key: key);

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Contacts"),),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Enter new Contact",
            ),
          ),
          TextButton(
              onPressed: (){
                final contact = Contact(name: _controller.text);
                ContactBook().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: Text("Add Contact"))
        ],
      ),
    );
  }
}
