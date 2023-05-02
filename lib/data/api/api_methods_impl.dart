import 'dart:convert';

import 'package:ui_scapia/data/api/api_methods.dart';
import 'package:ui_scapia/data/models/cancellation_window_details.dart';
import 'package:ui_scapia/data/models/journey_details.dart';

class ApiMethodsImpl extends ApiMethods {
  @override
  Future<JourneyDetailsEntity> getJourneyDetails() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final jsonData = getMockJourneyJsonData();
    return JourneyDetailsEntity.fromJson(jsonDecode(jsonData));
  }

  @override
  Future<CancellationWindowDetailsEntity> getCancellationWindowDetails() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final jsonData = getMockCancellationJsonData();
    return CancellationWindowDetailsEntity.fromJson(jsonDecode(jsonData));
  }
}

String getMockJourneyJsonData() {
  return '{"journey":[{"type":"flight","origin":{"city":"Bangalore (BLR)","terminal":"Terminal 1"},"destination":{"city":"Delhi (DEL)","terminal":"Terminal 1c"},"destination_arrival_time":"2023-05-01T12:00:00Z","origin_time":"2023-05-01T10:00:00Z","duration":7200,"flight":{"icon_url":"https://play-lh.googleusercontent.com/GpBflSe4aTVUKcoM7xVVk0gVMEETdYF3Y_r5cNuwKDFRjnbCdpxW9m-GtyzFueCR2ODK","service_provider":"SpiceJet","model":"SG 198"}},{"type":"layover","duration":7200,"origin":{"city":"Delhi (DEL)","terminal":"Terminal 1c"},"destination":{"city":"Delhi (DEL)","terminal":"Terminal 1b"},"destination_arrival_time":"2023-05-01T14:00:00Z","origin_time":"2023-05-01T12:00:00Z"},{"type":"flight","destination":{"city":"Pune (PNQ)","terminal":"Terminal 1"},"origin":{"city":"Delhi (DEL)","terminal":"Terminal 1c"},"destination_arrival_time":"2023-05-01T16:00:00Z","origin_time":"2023-05-01T14:00:00Z","duration":7200,"flight":{"icon_url":"https://play-lh.googleusercontent.com/GpBflSe4aTVUKcoM7xVVk0gVMEETdYF3Y_r5cNuwKDFRjnbCdpxW9m-GtyzFueCR2ODK","service_provider":"SpiceJet","model":"SG 198"}}]}';
}

String getMockCancellationJsonData() {
  return '{"time_to_charge":[{"time":"Till 5th June\'23, 02:00 PM","charge":"₹0"},{"time":"From 5th June\'23, 02:00 PM till 7th June\'23, 02:00 PM","charge":"₹1000"},{"time":"From 7th June\'23, 02:00 PM till 8th June\'23, 02:00 PM","charge":"100% of the booking amount will be charged"}]}';
}
