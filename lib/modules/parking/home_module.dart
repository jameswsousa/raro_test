import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/modules/parking/presenter/controllers/parking_controller.dart';
import 'package:raro_test/modules/parking/presenter/pages/history_page.dart';
import 'package:raro_test/modules/parking/presenter/pages/home_page.dart';
import 'package:raro_test/modules/parking/repositories/parking_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ParkingController(i())),
        Bind<IParkingRepository>((i) => ParkingRepository(i())),
        Bind((i) => FirebaseDatabase.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage()),
        ChildRoute('/history', child: (_, args) => HistoricPage()),
      ];
}
