import 'package:raro_test/core/entities/spot_entity.dart';

class SpotModel extends SpotEntity {
  SpotModel({required super.id, required super.truck_id});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'truck_id': truck_id};
  }

  factory SpotModel.fromMap(Map<String, dynamic> map) {
    return SpotModel(id: map['id'], truck_id: map['truck_id']);
  }
}
