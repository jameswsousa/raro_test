import 'package:raro_test/core/errors/failures.dart';

class ParkingFailure extends Failure {
  final String title;
  final String message;
  ParkingFailure({
    required this.title,
    required this.message,
  });
}
