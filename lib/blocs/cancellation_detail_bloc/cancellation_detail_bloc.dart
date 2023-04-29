import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_scapia/data/models/cancellation_window_details.dart';
import 'package:ui_scapia/data/repositories/repository.dart';

part 'cancellation_detail_event.dart';
part 'cancellation_detail_state.dart';

class CancellationDetailBloc
    extends Bloc<CancellationDetailEvent, CancellationDetailState> {
  final Repository repository;
  CancellationDetailBloc({required this.repository})
      : super(CancellationDetailInitial()) {
    on<CancellationDetailEvent>((event, emit) async {
      if (event is CancellationDetailFetchEvent) {
        await _mapCancellationDetailFetchEventToState(emit: emit);
      }
    });
  }

  FutureOr<void> _mapCancellationDetailFetchEventToState(
      {required Emitter<CancellationDetailState> emit}) async {
    try {
      emit(CancellationDetailLoading());
      final cancellationWindowDetails =
          await repository.getCancellationWindowDetails();
      emit(CancellationDetailLoaded(
          cancellationDetails: cancellationWindowDetails));
    } catch (e) {
      emit(CancellationDetailError(message: e.toString()));
    }
  }
}
