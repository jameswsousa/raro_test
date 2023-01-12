import 'package:flutter/material.dart';
import 'package:raro_test/core/entities/day_entity.dart';
import 'package:raro_test/modules/parking/presenter/components/default_button.dart';
import 'package:raro_test/modules/parking/presenter/components/default_dialog.dart';
import '../../../../core/data_parser.dart';
import '../../../../core/theme/typography.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryComponent extends StatelessWidget {
  const HistoryComponent({required this.day});

  final DayEntity day;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return DefaultDialog(widgets: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: day.movimentations.isEmpty
                          ? [Text('Sem movimentações', style: h2)]
                          : [
                              Container(
                                  constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              .75),
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: day.movimentations.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            margin: EdgeInsets.all(4),
                                            width: 200,
                                            child: Text(
                                              'O veículo ${day.movimentations[index].truck_id} '
                                              '${day.movimentations[index].isEntering ? 'entrou na' : 'saiu da'} '
                                              '\nvaga ${day.movimentations[index].spot_id} em'
                                              ' ${DateParser.getDateWithTimeString(day.movimentations[index].time)}',
                                              style: h3,
                                              textAlign: TextAlign.center,
                                            ));
                                      }))
                            ]),
                  SizedBox(height: 15),
                  Text(
                      'Encerrado em ${DateParser.getDateWithTimeString(day.end)}'),
                  SizedBox(height: 15),
                  DefaultButton(
                      onPressed: () => Modular.to.pop(), text: 'Fechar')
                ]);
              });
        },
        child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(2, 2),
                      color: Colors.black12)
                ],
                color: Colors.white),
            child:
                Text(DateParser.getDateWithTimeString(day.start), style: h3)));
  }
}
