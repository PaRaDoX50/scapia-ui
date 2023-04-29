import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_scapia/data/models/journey_details.dart';
import 'package:ui_scapia/data/repositories/repository.dart';

part 'journey_detail_event.dart';
part 'journey_detail_state.dart';

class JourneyDetailBloc extends Bloc<JourneyDetailEvent, JourneyDetailState> {
  final Repository repository;

  JourneyDetailBloc({required this.repository})
      : super(JourneyDetailInitial()) {
    on<JourneyDetailEvent>((event, emit) async {
      if (event is JourneyDetailFetchEvent) {
        await _mapJourneyDetailFetchEventToState(emit: emit);
      }
    });
  }

  FutureOr<void> _mapJourneyDetailFetchEventToState(
      {required Emitter<JourneyDetailState> emit}) async {
    try {
      emit(JourneyDetailLoading());
      final journeyDetails = await repository.getJourneyDetails();
      emit(JourneyDetailLoaded(journeyDetails: journeyDetails));
    } catch (e) {
      emit(JourneyDetailError(message: e.toString()));
    }
  }
}
