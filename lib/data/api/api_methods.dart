import 'package:ui_scapia/data/models/cancellation_window_details.dart';
import 'package:ui_scapia/data/models/journey_details.dart';

abstract class ApiMethods {
  Future<JourneyDetailsEntity> getJourneyDetails();

  Future<CancellationWindowDetailsEntity> getCancellationWindowDetails();
}
