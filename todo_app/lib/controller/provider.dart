// ignore_for_file: prefer_const_declarations, non_constant_identifier_names, avoid_print, empty_catches

import 'package:flutter/material.dart';
import 'package:todo_app/models/usermodel.dart';
import 'package:todo_app/service/service.dart';

class ContactProvoder extends ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  List<ContactModel> datas = [];
  TodoService ts = TodoService();
  Future<void> fetchData() async {
    datas = await ts.fetchData();
    notifyListeners();
  }

  void saveData(ContactModel va) async {
    try {
      await ts.addTodo(ContactModel(
      
          name: namecontroller.text,
          address: addresscontroller.text,
          email: emailcontroller.text,
          phone: int.tryParse(phonecontroller.text)));
      notifyListeners();
      namecontroller.clear();
      addresscontroller.clear();
      emailcontroller.clear();
      phonecontroller.clear();
    } catch (error) {}
  }

  Future<void> deleteContacts(String contactId) async {
    final dlt=await ts.deleteTodo(contactId);
    if(dlt){
      datas.removeWhere((contact) => contact.id == contactId);
    notifyListeners();
    }
    else{throw Exception("ok");}
  }

  
  Future<bool> updateContact(String id, String name, String phone,String address,String email) async {
    try {
      await TodoService.updateContact(id, name, phone,address,email);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
