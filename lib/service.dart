import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class ApiService {
  fetchUsers() async {
    final response = await http.get(Uri.parse(
        'https://app-naa.herokuapp.com/api/https://app-naa.herokuapp.com/api/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Users.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users');
    }
  }
}
