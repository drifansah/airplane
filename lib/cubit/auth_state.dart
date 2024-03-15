part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String error;

  const AuthFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
