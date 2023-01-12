class MovimentationEntity {
  final int spot_id;
  final String truck_id;
  final DateTime time;
  final bool isEntering;

  MovimentationEntity({
    required this.spot_id,
    required this.truck_id,
    required this.isEntering,
    required this.time,
  });
}
