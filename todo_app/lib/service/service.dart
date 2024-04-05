// ignore_for_file: prefer_const_declarations, empty_catches, unused_element
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:todo_app/models/usermodel.dart';

class TodoService {
  Dio dio = Dio();
  Future<List<ContactModel>> fetchData() async {
    final url = 'https://contacts-management-server.onrender.com/api/contacts';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => ContactModel.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }

  static Future<bool> updateContact(String id, String name, String phone,
      String email, String address) async {
    final Dio dio = Dio();
    final response = await dio.put(
        'https://contacts-management-server.onrender.com/api/contacts/$id',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "address": address
        },
        options: Options(headers: {'Content-Type': 'application/json'}));
    return response.statusCode == 200;
  }

  Future<void> addTodo(ContactModel value) async {
    try {
      final urll =
          "https://contacts-management-server.onrender.com/api/contacts";
      await dio.post(urll, data: value.toJson());
    } catch (error) {
      throw Exception("error on adding todo:$error");
    }
  }

  deleteTodo(String id) async {
    try {
      await dio.delete(
          "https://contacts-management-server.onrender.com/api/contacts/$id");
    } catch (error) {
      throw Exception("error");
    }
  }
}
