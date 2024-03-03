import 'package:belajar_bloc2/features/user/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;
  UserBloc(this._repository) : super(UserInitial()) {
    on<GetUserById>(
      (event, emit) async {
        emit(UserLoading());
        final result = await _repository.getUser(event.id);
        result.fold(
          (l) => emit(UserError(l.message)),
          (r) => emit(UserSuccess(r)),
        );
      },
    );
  }
}
