import 'dart:io';

import 'package:belajar_bloc2/core/exceptions/exceptions.dart';
import 'package:belajar_bloc2/core/failures/failures.dart';
import 'package:belajar_bloc2/features/user/data_source/user_remote_data_source.dart';
import 'package:belajar_bloc2/features/user/models/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failures, User>> getUser(int id);
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<Failures, User>> getUser(int id) async {
    try {
      final result = await _userRemoteDataSource.getUser(id);
      return Right(result);
    } on RequestErrorException catch (e) {
      return Left(RequestFailure(e.message));
    } on SocketException {
      return Left(RequestFailure('Internet Anda Jelek'));
    }
  }
}
