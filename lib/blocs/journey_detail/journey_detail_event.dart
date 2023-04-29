part of 'journey_detail_bloc.dart';

@immutable
abstract class JourneyDetailEvent extends Equatable {}

class JourneyDetailFetchEvent extends JourneyDetailEvent {
  @override
  List<Object?> get props => [];
}
