import 'package:appdua/models/transaction_model.dart';
import 'package:appdua/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//REGISTER KE FIRESTORE
class TransactionService {
  //REGISTER KE FIRESTORE DENGAN NAMA FIELD 'users'
  final CollectionReference _transactionReference = FirebaseFirestore.instance.collection('transactions');


  //METHODE
  //MELAKUKAN SET KE DALAM users
  //PARAMETERNYA ADALAH user
  Future<void> createTransaction(TransactionModel transaction)async{

    try {
      _transactionReference.add({
        //DATA
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  //METHODE MENGAMBIL DATA DARI FIREBASE
  Future<List<TransactionModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}