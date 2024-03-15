part of 'destinations_cubit.dart';

sealed class DestinationsState extends Equatable {
  const DestinationsState();

  @override
  List<Object> get props => [];
}

final class DestinationsInitial extends DestinationsState {}

final class DestinationsLoading extends DestinationsState {}

final class DestinationsSucces extends DestinationsState {
  final List<DestinationModel>destinations;
  //KONSTRUKTOR
  DestinationsSucces(this.destinations);

  //METHOD
  @override
  // TODO: implement props
  List<Object> get props => [destinations];

}

final class DestinationsFailed extends DestinationsState{
  final String error;

  //KONSTRUKTOR
  DestinationsFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
