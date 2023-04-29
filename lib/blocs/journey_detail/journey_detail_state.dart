part of 'journey_detail_bloc.dart';

@immutable
abstract class JourneyDetailState extends Equatable {}

class JourneyDetailInitial extends JourneyDetailState {
  @override
  List<Object?> get props => [];
}

class JourneyDetailLoading extends JourneyDetailState {
  @override
  List<Object?> get props => [];
}

class JourneyDetailLoaded extends JourneyDetailState {
  final JourneyDetails journeyDetails;

  JourneyDetailLoaded({
    required this.journeyDetails,
  });

  @override
  List<Object?> get props => [journeyDetails];
}

class JourneyDetailError extends JourneyDetailState {
  final String message;

  JourneyDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
