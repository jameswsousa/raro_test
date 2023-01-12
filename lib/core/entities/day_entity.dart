import 'package:raro_test/core/entities/movimentation_entity.dart';

class DayEntity {
  final DateTime start;
  final DateTime? end;
  final List<MovimentationEntity> movimentations;

  DayEntity({required this.start, this.end, required this.movimentations});
}
