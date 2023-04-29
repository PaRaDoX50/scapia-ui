part of 'cancellation_detail_bloc.dart';

@immutable
abstract class CancellationDetailState extends Equatable {}

class CancellationDetailInitial extends CancellationDetailState {
  @override
  List<Object?> get props => [];
}

class CancellationDetailLoading extends CancellationDetailState {
  @override
  List<Object?> get props => [];
}

class CancellationDetailLoaded extends CancellationDetailState {
  final CancellationWindowDetails cancellationDetails;

  CancellationDetailLoaded({
    required this.cancellationDetails,
  });

  @override
  List<Object?> get props => [cancellationDetails];
}

class CancellationDetailError extends CancellationDetailState {
  final String message;

  CancellationDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
