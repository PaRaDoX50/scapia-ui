import 'package:ui_scapia/data/api/api_methods.dart';
import 'package:ui_scapia/data/models/cancellation_window_details.dart';
import 'package:ui_scapia/data/models/journey_details.dart';
import 'package:ui_scapia/data/repositories/repository.dart';

class JourneyRepository extends Repository {
  final ApiMethods apiMethods;

  JourneyRepository({required this.apiMethods});

  @override
  Future<JourneyDetails> getJourneyDetails() async {
    final journeyDetailsEntity = await apiMethods.getJourneyDetails();
    return JourneyDetails.fromEntity(journeyDetailsEntity);
  }

  @override
  Future<CancellationWindowDetails> getCancellationWindowDetails() async {
    final cancellationWindowDetailsEntity =
        await apiMethods.getCancellationWindowDetails();
    return CancellationWindowDetails.fromEntity(
        cancellationWindowDetailsEntity);
  }
}
