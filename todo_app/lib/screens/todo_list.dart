// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_declarations, must_call_super, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/add_page.dart';
import 'package:todo_app/controller/provider.dart';
import 'package:todo_app/screens/editpage.dart';

class todoList extends StatelessWidget {
  todoList({super.key});

  // List items = [];

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<ContactProvoder>(context,);
    p.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text("contact  List"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 12, 212, 105),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            final dat = p.datas[index];
            return ListTile(
              title: Center(child: Text(dat.name.toString())),
              subtitle: Column(children: [
                Text(dat.phone.toString()),
                Text(dat.email.toString()),
                Text(dat.address.toString()),
               
                
                ],),
            
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => editpage(
                                  name: dat.name ,
                                  email: dat.email,
                                  address: dat.address,
                                  phone: dat.phone
                                )));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        final provider=Provider.of<ContactProvoder>(context,listen: false);
                        provider.deleteContacts(dat.id.toString());
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: p.datas.length),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => addTodo()));
          },
          label: Text("add Todo")),
    );
  }
}
