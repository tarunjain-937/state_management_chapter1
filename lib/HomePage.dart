import 'package:flutter/material.dart';

class Contact{
  final String name;
  Contact({required this.name});
}

class ContactBook{

  /// ContactBook will manage the STATE of the contact class
  /// ContactBook is a Singleton class
  /// Only one instance(object) can be formed in whole program
  /// Advantage - Memory efficiently use..
  ContactBook._sharedInstace();
  static final ContactBook _shared = ContactBook._sharedInstace();
  /// Factory constructor of contact book class
  /// Factory constructor helps to ensure that only one instance of class can be formed in the whole program.
  factory ContactBook() => _shared;

  /// Storage for all the contact with abstraction
  final List<Contact> _contacts =[
    Contact(name: "Tarun jain")
  ];

  /// we have to provide the length of the contacts we have to the item count of ListView we are using to display the contacts
  int get length => _contacts.length;

  void add({required Contact contact}){
    _contacts.add(contact);
  }

  void remove({required Contact contact}){
    _contacts.remove(contact);
  }

  /// Function return contacts using there index with null safety
  Contact? contact({required int atIndex})=> _contacts.length > atIndex ? _contacts[atIndex] : null;
}

//=========================================================================================================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook(); /// Instance(object) of ContactBook Singleton class
    return Scaffold(
      appBar: AppBar(title: const Text("State Management Ch:1"),),
      body: ListView.builder(
        itemCount: contactBook.length,
        itemBuilder: (context, index) {
          final contact = contactBook.contact(atIndex: index)!;
          return   ListTile(
            title: Text(contact.name),
          );
        },),

      floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            await Navigator.of(context).pushNamed("/new-contact");
          },
          child: const Icon(Icons.add)),
    );
  }
}

