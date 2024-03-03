part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final User user;

  const UserSuccess(this.user);
}

class UserError extends UserState {
  final String messsage;

  const UserError(this.messsage);
}
