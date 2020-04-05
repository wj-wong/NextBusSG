import 'package:nextbussg/components/home/favorites/confirmation_bottom_sheet.dart';
import 'package:nextbussg/styles/tile_color.dart';
import 'package:nextbussg/styles/transit_colors.dart';
import 'package:nextbussg/styles/values.dart';
import 'package:flutter/material.dart';
import 'package:nextbussg/models/bus_arrival.dart';

class BusServiceTile extends StatelessWidget {
  final String code;
  final String service;
  final BusArrival busArrival;
  BusServiceTile({this.code, this.service, this.busArrival});

  @override
  Widget build(BuildContext context) {
    // the load can be SEA, SDA, or LSD (green, orange, red)
    Map loadColors = {
      "SEA": TransitColors.seats,
      "SDA": TransitColors.standing,
      "LSD": TransitColors.limited,
    };

    return Container(
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(Values.busStopTileHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Text(
                  service,
                  style: Theme.of(context).textTheme.display3,
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (var nextBus in busArrival.nextBuses)
                      Text(
                        nextBus.timeInMinutes ?? '-',
                        style: Theme.of(context).textTheme.display4.copyWith(
                              color: loadColors[nextBus.load],
                            ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(Values.borderRadius * 0.8),
        onTap: () => ConfirmationBottomSheets.confirmAction(context, code, service),
        onLongPress: () => ConfirmationBottomSheets.confirmAction(context, code, service),
        onDoubleTap: () => ConfirmationBottomSheets.confirmAction(context, code, service),
      ),
      margin: EdgeInsets.only(
        left: Values.pageHorizontalPadding,
        right: Values.pageHorizontalPadding,
        bottom: Values.pageHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: TileColors.busServiceTile(context),
        borderRadius: BorderRadius.circular(Values.borderRadius * 0.8),
      ),
    );

  }
}
