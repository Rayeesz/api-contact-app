// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/provider.dart';

class editpage extends StatefulWidget {
  var name;
  var email;
  var address;
  int? phone;

  editpage({this.name, this.address, this.email, this.phone});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController(text: widget.name);
    emailcontroller = TextEditingController(text: widget.email);
    addresscontroller = TextEditingController(text: widget.address);
    phonecontroller = TextEditingController(text: widget.phone?.toString());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: namecontroller,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
        ),
        TextField(
          controller: phonecontroller,
          decoration: const InputDecoration(
            labelText: 'Phone',
          ),
        ),
        TextField(
          controller: addresscontroller,
          decoration: const InputDecoration(
            labelText: 'Address',
          ),
        ),
        TextField(
          controller: emailcontroller,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        ),
      ],
    )));
  }
}
