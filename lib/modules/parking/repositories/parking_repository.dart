import 'package:dartz/dartz.dart';
import 'package:raro_test/core/entities/day_entity.dart';
import 'package:raro_test/core/entities/movimentation_entity.dart';
import 'package:raro_test/core/entities/spot_entity.dart';
import 'package:raro_test/modules/parking/errors/parking_error.dart';
import 'package:raro_test/modules/parking/models/day_model.dart';
import 'package:raro_test/modules/parking/models/movimentation_model.dart';
import 'package:raro_test/modules/parking/models/spot_model.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../core/errors/failures.dart';

abstract class IParkingRepository {
  Future<Either<Failure, List<SpotEntity>>> getSpots();
  Future<Either<Failure, List<DayEntity>>> getDays();
  Future<Either<Failure, Unit>> saveDay();
  Future<Either<Failure, Unit>> registerMovimentation(
      MovimentationEntity movimentation);
}

class ParkingRepository implements IParkingRepository {
  final FirebaseDatabase _database;

  ParkingRepository(this._database);
  @override
  Future<Either<Failure, List<SpotEntity>>> getSpots() async {
    final ref = _database.ref();
    try {
      final result = await ref.child('spots').get();

      final temp = await (result.value as Map)
          .values
          .map((e) => SpotModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();

      return Right(temp);
    } catch (e) {
      return Left(ParkingFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível obter as vagas'));
    }
  }

  @override
  Future<Either<Failure, Unit>> registerMovimentation(
      MovimentationEntity movimentation) async {
    final ref = _database.ref();
    try {
      await ref
          .child('current')
          .child('movimentations')
          .update(MovimentationModel.fromEntity(movimentation).toMap());
      await ref.child('spots').child('id${movimentation.spot_id}').update({
        "truck_id": movimentation.isEntering ? movimentation.truck_id : null
      });

      return Right(unit);
    } catch (e) {
      return Left(ParkingFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível registrar a movimentação'));
    }
  }

  @override
  Future<Either<Failure, List<DayEntity>>> getDays() async {
    final ref = _database.ref();
    try {
      final result = await ref.child('days').get();
      if (result.value == null) {
        return Right([]);
      }

      final temp = await (result.value as Map)
          .values
          .map((e) => DayModel.fromMap(Map<String, dynamic>.from(e)))
          .toList();

      return Right(temp);
    } catch (e) {
      return Left(ParkingFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível obter os registros'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveDay() async {
    final ref = _database.ref();
    try {
      final result = await ref.child('current').get();

      final temp =
          DayModel.fromMap(Map<String, dynamic>.from(result.value as Map));
      final data = temp.toMap();
      data['end'] = DateTime.now().millisecondsSinceEpoch;
      ref
          .child('days')
          .child(temp.start.millisecondsSinceEpoch.toString())
          .set(data);
      ref
          .child('current')
          .set({"start": DateTime.now().millisecondsSinceEpoch});

      return Right(unit);
    } catch (e) {
      return Left(ParkingFailure(
          title: 'Ocorreu um erro',
          message: 'Não foi possível obter os registros'));
    }
  }
}
