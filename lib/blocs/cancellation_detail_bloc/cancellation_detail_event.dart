part of 'cancellation_detail_bloc.dart';

@immutable
abstract class CancellationDetailEvent extends Equatable {}

class CancellationDetailFetchEvent extends CancellationDetailEvent {
  @override
  List<Object?> get props => [];
}
