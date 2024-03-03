import 'dart:convert';

import 'package:belajar_bloc2/core/exceptions/exceptions.dart';
import 'package:belajar_bloc2/features/user/models/user.dart';
import 'package:http/http.dart';

abstract class UserRemoteDataSource {
  Future<User> getUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Client client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<User> getUser(int id) async {
    final response = await client.get(
      Uri.parse('https://reqres.in/api/users/$id'),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print(data);
      return User.fromJson(data['data']);
    } else {
      final data = jsonDecode(response.body);
      throw RequestErrorException(data['message']);
    }
  }
}
