import 'package:appdua/models/transaction_model.dart';
import 'package:appdua/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  //MTHOD UNTUK MENGIRIMKAN DATA TRANSAKSI
  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions() async {
    try {
      emit(TransactionLoading());

      List<TransactionModel>transactions = await TransactionService().fetchDestinations();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      
    }
  }
}
