enum JourneyType {
  flight,
  layover;

  static JourneyType fromString(String type) {
    switch (type) {
      case 'flight':
        return JourneyType.flight;
      case 'layover':
        return JourneyType.layover;
      default:
        throw Exception('Unknown JourneyType: $type');
    }
  }

  @override
  String toString() {
    switch (this) {
      case JourneyType.flight:
        return 'Flight';
      case JourneyType.layover:
        return 'Layover';
      default:
        throw Exception('Unknown JourneyType: $this');
    }
  }
}
