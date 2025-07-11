import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_application/core/constants/server_constant.dart';
import 'package:spotify_application/core/failure/failure.dart';
import 'package:spotify_application/features/auth/model/user_model.dart';

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );


      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 201) {
        return Left(AppFailure(resBodyMap['detail']));
      }
      
      return Right(UserModel.fromMap(resBodyMap));
    } catch (e) {
      return Left(AppFailure('Error during signup: $e'));
    }
  }


 Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ServerConstant.serverURL}/auth/login',),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(
        UserModel.fromMap(resBodyMap),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
