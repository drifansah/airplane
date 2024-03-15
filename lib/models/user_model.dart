import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  //variabel yang ada di firebase
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;
//konstruktor. jika memanggil class UserModel
//maka yang dipanggil adalah konstruktor ini dan isinya sesusai dengan yang di bawah
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.hobby='',
    this.balance=0,
  });


  @override
  // TODO: implement props
  //class ini akan mereturn nilai-nilai yang ada di bawah ini
  List<Object?> get props => [id, email, name, hobby, balance];



  
}