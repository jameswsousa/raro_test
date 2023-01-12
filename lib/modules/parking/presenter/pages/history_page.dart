import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_test/core/theme/typography.dart';
import 'package:raro_test/modules/parking/presenter/components/history_component.dart';
import 'package:raro_test/modules/parking/presenter/components/loading_component.dart';
import 'package:raro_test/modules/parking/presenter/controllers/parking_controller.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final _controller = Modular.get<ParkingController>();

  @override
  void initState() {
    _controller.days = null;
    Future.delayed(Duration(seconds: 3), () {
      _controller.getDays();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Histórico', style: h1),
          centerTitle: true,
          backgroundColor: Colors.teal),
      body: Observer(builder: (context) {
        return _controller.days == null
            ? Center(child: LoadingWidget())
            : _controller.days!.isEmpty
                ? Center(child: Text('Registro vazio', style: h3))
                : ListView.builder(
                    itemCount: _controller.days!.length,
                    itemBuilder: (context, index) {
                      return HistoryComponent(day: _controller.days![index]);
                    });
      }),
    );
  }
}
