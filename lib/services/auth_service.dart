import 'package:appdua/models/user_model.dart';
import 'package:appdua/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

//METHOD signUp
//MENGEMBALIKAN NILAI DARI USERMODEL
  Future<UserModel> signUp({
    required String email, //PARAMETER
    required String password, //PARAMETER
    required String name, //PARAMETER REQUIRED WAJIB DIISI
    String hobby = '', //NILAI DEFAULT KOSONG
  }) async {
    try {
      //REGISTER/MEMASUKAN KE AUTHENTICATION FIREBASE
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //OBJEK user
      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);

      await UserService().setUser(user);
      //JIKA SET USER SUDAH SELESAI MAKA LAKUKAN RETURN user
      return user;
    } catch (e) {
      throw e;
    }
  }

  //METHOD SIGN OUT
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
