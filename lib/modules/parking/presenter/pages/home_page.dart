import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/core/theme/typography.dart';
import 'package:raro_test/modules/parking/presenter/components/loading_component.dart';
import 'package:raro_test/modules/parking/presenter/components/spot_component.dart';
import 'package:raro_test/modules/parking/presenter/controllers/parking_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final _controller = Modular.get<ParkingController>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      _controller.getSpots();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: InkWell(
                onTap: () {
                  Modular.to.pushNamed('history');
                },
                child: Text('Histórico', style: h1)),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            _controller.saveDay();
                          },
                          child: Text('Fechar dia', style: h3))))
            ]),
        body: Observer(builder: (context) {
          return Container(
              child: _controller.spots == null
                  ? Center(child: LoadingWidget())
                  : _controller.spots!.isEmpty
                      ? Text('Não há vagas.')
                      : GridView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: _controller.spots!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemBuilder: (BuildContext context, int index) {
                            return SpotComponent(
                              spot: _controller.spots![index],
                            );
                          }));
        }));
  }
}
