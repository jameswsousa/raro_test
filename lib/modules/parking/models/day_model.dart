import 'package:raro_test/core/entities/day_entity.dart';
import 'package:raro_test/core/entities/movimentation_entity.dart';
import 'package:raro_test/modules/parking/models/movimentation_model.dart';

class DayModel extends DayEntity {
  DayModel({required super.start, required super.movimentations, super.end});
  Map<String, dynamic> toMap() {
    Map<String, dynamic> temp = {};
    movimentations.forEach((element) {
      temp.addAll(MovimentationModel.fromEntity(element).toMap());
    });
    return <String, dynamic>{
      'start': start.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'movimentations': temp,
    };
  }

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      start: DateTime.fromMillisecondsSinceEpoch(map['start'] as int),
      end: map['end'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['end'] as int)
          : null,
      movimentations: map['movimentations'] == null
          ? []
          : List<MovimentationModel>.from(
              (map['movimentations'] as Map).values.map<MovimentationEntity>(
                    (x) => MovimentationModel.fromMap(
                        Map<String, dynamic>.from(x)),
                  ),
            ),
    );
  }
}
