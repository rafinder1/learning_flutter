import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  // var response = await http.get(Uri.parse("http://127.0.0.1:8000/core/"));
  var response = await http.post(Uri.parse("http://127.0.0.1:8000/core/"),
  
  body: {
    "username": "janek",
    "email": "janek@janek.pl",
    "password": "janek"
  }
  );
  print(jsonDecode(response.body));
}
