import 'package:raro_test/core/entities/movimentation_entity.dart';

class MovimentationModel extends MovimentationEntity {
  MovimentationModel({
    required super.spot_id,
    required super.truck_id,
    required super.time,
    required super.isEntering,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      time.millisecondsSinceEpoch.toString(): {
        'spot_id': spot_id,
        'isEntering': isEntering,
        'truck_id': truck_id,
        'time': time.millisecondsSinceEpoch,
      }
    };
  }

  factory MovimentationModel.fromEntity(MovimentationEntity entity) {
    return MovimentationModel(
      spot_id: entity.spot_id,
      isEntering: entity.isEntering,
      truck_id: entity.truck_id,
      time: entity.time,
    );
  }

  factory MovimentationModel.fromMap(Map<String, dynamic> map) {
    return MovimentationModel(
      spot_id: map['spot_id'] as int,
      isEntering: map['isEntering'],
      truck_id: map['truck_id'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }
}
