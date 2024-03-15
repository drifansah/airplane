import 'dart:ffi';

import 'package:appdua/models/user_model.dart';
import 'package:appdua/services/auth_service.dart';
import 'package:appdua/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
  //METHOD signUp tipe void
  void signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      //state loading
      //karna setelah klik tombol get started di page sign-up akan loading
      emit(AuthLoading());

      //OBJEK
      UserModel user = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);

      //jika user berhasil maka lakukan authsuccess
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut()async{
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

   void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

}
