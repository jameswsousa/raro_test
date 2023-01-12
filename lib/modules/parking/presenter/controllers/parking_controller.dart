import 'package:mobx/mobx.dart';
import 'package:raro_test/core/entities/day_entity.dart';
import 'package:raro_test/core/entities/movimentation_entity.dart';
import 'package:raro_test/core/entities/spot_entity.dart';
import 'package:raro_test/core/enums/app_states.dart';
import 'package:raro_test/core/errors/failures.dart';
import 'package:raro_test/modules/parking/repositories/parking_repository.dart';

part 'parking_controller.g.dart';

class ParkingController = _ParkingControllerBase with _$ParkingController;

abstract class _ParkingControllerBase with Store {
  final IParkingRepository _repository;

  _ParkingControllerBase(this._repository);

  @observable
  String? truck_id;

  @observable
  List<SpotEntity>? spots;

  @observable
  List<DayEntity>? days;

  @observable
  Failure? failure;

  @observable
  AppStatesEnum parkState = AppStatesEnum.noState;

  @action
  Future<void> getSpots() async {
    spots = null;
    final result = await _repository.getSpots();
    result.fold((l) {
      failure = l;
      parkState = AppStatesEnum.error;
    }, (r) {
      r.sort((a, b) {
        return a.id.compareTo(b.id);
      });
      spots = r;
      parkState = AppStatesEnum.loaded;
    });
  }

  @action
  Future<void> registerMovimentation(MovimentationEntity movimentation) async {
    final result = await _repository.registerMovimentation(movimentation);
    result.fold((l) {
      failure = l;
      parkState = AppStatesEnum.error;
    }, (r) {
      parkState = AppStatesEnum.loaded;
      getSpots();
    });
  }

  @action
  Future<void> saveDay() async {
    final result = await _repository.saveDay();
    result.fold((l) {
      failure = l;
      parkState = AppStatesEnum.error;
    }, (r) {
      parkState = AppStatesEnum.loaded;
    });
  }

  @action
  Future<void> getDays() async {
    days = null;
    final result = await _repository.getDays();
    result.fold((l) {
      failure = l;
      parkState = AppStatesEnum.error;
    }, (r) {
      r.sort((a, b) {
        return a.start.compareTo(b.start);
      });
      days = r;
      parkState = AppStatesEnum.loaded;
    });
  }
}
