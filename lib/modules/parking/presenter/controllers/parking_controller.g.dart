// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ParkingController on _ParkingControllerBase, Store {
  late final _$truck_idAtom =
      Atom(name: '_ParkingControllerBase.truck_id', context: context);

  @override
  String? get truck_id {
    _$truck_idAtom.reportRead();
    return super.truck_id;
  }

  @override
  set truck_id(String? value) {
    _$truck_idAtom.reportWrite(value, super.truck_id, () {
      super.truck_id = value;
    });
  }

  late final _$spotsAtom =
      Atom(name: '_ParkingControllerBase.spots', context: context);

  @override
  List<SpotEntity>? get spots {
    _$spotsAtom.reportRead();
    return super.spots;
  }

  @override
  set spots(List<SpotEntity>? value) {
    _$spotsAtom.reportWrite(value, super.spots, () {
      super.spots = value;
    });
  }

  late final _$daysAtom =
      Atom(name: '_ParkingControllerBase.days', context: context);

  @override
  List<DayEntity>? get days {
    _$daysAtom.reportRead();
    return super.days;
  }

  @override
  set days(List<DayEntity>? value) {
    _$daysAtom.reportWrite(value, super.days, () {
      super.days = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_ParkingControllerBase.failure', context: context);

  @override
  Failure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  late final _$parkStateAtom =
      Atom(name: '_ParkingControllerBase.parkState', context: context);

  @override
  AppStatesEnum get parkState {
    _$parkStateAtom.reportRead();
    return super.parkState;
  }

  @override
  set parkState(AppStatesEnum value) {
    _$parkStateAtom.reportWrite(value, super.parkState, () {
      super.parkState = value;
    });
  }

  late final _$getSpotsAsyncAction =
      AsyncAction('_ParkingControllerBase.getSpots', context: context);

  @override
  Future<void> getSpots() {
    return _$getSpotsAsyncAction.run(() => super.getSpots());
  }

  late final _$registerMovimentationAsyncAction = AsyncAction(
      '_ParkingControllerBase.registerMovimentation',
      context: context);

  @override
  Future<void> registerMovimentation(MovimentationEntity movimentation) {
    return _$registerMovimentationAsyncAction
        .run(() => super.registerMovimentation(movimentation));
  }

  late final _$saveDayAsyncAction =
      AsyncAction('_ParkingControllerBase.saveDay', context: context);

  @override
  Future<void> saveDay() {
    return _$saveDayAsyncAction.run(() => super.saveDay());
  }

  late final _$getDaysAsyncAction =
      AsyncAction('_ParkingControllerBase.getDays', context: context);

  @override
  Future<void> getDays() {
    return _$getDaysAsyncAction.run(() => super.getDays());
  }

  @override
  String toString() {
    return '''
truck_id: ${truck_id},
spots: ${spots},
days: ${days},
failure: ${failure},
parkState: ${parkState}
    ''';
  }
}
