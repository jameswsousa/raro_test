import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raro_test/core/entities/movimentation_entity.dart';
import 'package:raro_test/core/entities/spot_entity.dart';
import 'package:raro_test/core/theme/typography.dart';
import 'package:raro_test/modules/parking/presenter/components/default_button.dart';
import 'package:raro_test/modules/parking/presenter/components/default_dialog.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import '../controllers/parking_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SpotComponent extends StatelessWidget {
  SpotComponent({required this.spot});
  final SpotEntity spot;
  final _controller = Modular.get<ParkingController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                _controller.truck_id = null;
                return DefaultDialog(
                  widgets: [
                    if (spot.truck_id == null)
                      TextField(
                        textCapitalization: TextCapitalization.characters,
                        controller: MaskedTextController(
                            text: _controller.truck_id, mask: 'AAA-0@00'),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(8),
                        ],
                        decoration: InputDecoration(
                            hintText: 'Placa do veículo',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.teal))),
                        onChanged: (value) {
                          _controller.truck_id = value;
                        },
                      )
                    else
                      Text('Confirmar saída do veículo'),
                    SizedBox(height: 15),
                    Observer(builder: (context) {
                      return DefaultButton(
                        text: 'Confirmar',
                        onPressed: _controller.truck_id != null ||
                                spot.truck_id != null
                            ? () {
                                _controller.registerMovimentation(
                                    MovimentationEntity(
                                        spot_id: spot.id,
                                        truck_id: spot.truck_id ??
                                            _controller.truck_id!,
                                        time: DateTime.now(),
                                        isEntering: spot.truck_id == null));

                                Modular.to.pop();
                              }
                            : null,
                      );
                    })
                  ],
                );
              });
        },
        child: Container(
            width: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: spot.truck_id == null
                    ? Colors.greenAccent
                    : Colors.redAccent[100],
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            child: Text(" ${spot.id.toString()}\n\n${spot.truck_id ?? 'Livre'}",
                textAlign: TextAlign.center, style: h3)));
  }
}
