import 'dart:math';

import 'package:appdua/models/destination_model.dart';
import 'package:appdua/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fetchDestinations()async{
    try {
      emit(DestinationsLoading());

      List<DestinationModel>destinations = await DestinationService().fetchDestinations();

      emit(DestinationsSucces(destinations));
    } catch (e) {
      emit(DestinationsFailed(e.toString()));
    }
  }
}
