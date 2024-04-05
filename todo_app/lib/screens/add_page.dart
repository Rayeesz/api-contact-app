// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, non_constant_identifier_names, avoid_print, unused_local_variable, camel_case_types


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/provider.dart';
import 'package:todo_app/models/usermodel.dart';
class addTodo extends StatefulWidget {
  const addTodo({super.key});
  @override
  State<addTodo> createState() => _addTodoState();
}

class _addTodoState extends State<addTodo> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ContactProvoder>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("add todo"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: pro.namecontroller,
            decoration: InputDecoration(hintText: "name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: pro.emailcontroller,
            decoration: InputDecoration(hintText: "email"),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: pro.addresscontroller,
            decoration: InputDecoration(hintText: "address"),
            minLines: 5,
            maxLines: 8,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: pro.phonecontroller,
            decoration: InputDecoration(hintText: "phone"),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                pro.saveData(ContactModel());
              },
              child: Text("submit")),
        )
      ]),
    );
  }
}
