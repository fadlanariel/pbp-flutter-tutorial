import 'package:tutorial_flutter/model/to_do.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Todo>> fetchTodo() async {
  var url = Uri.parse(
      "https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // Melakukan decode response menjadi json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // Melakukan konversi data json menjadi objek Todo
  List<Todo> listTodo = [];
  for (var d in data) {
    if (d != null) {
      listTodo.add(Todo.fromJson(d));
    }
  }

  return listTodo;
}