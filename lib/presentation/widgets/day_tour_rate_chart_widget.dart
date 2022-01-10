import 'package:cab_booking/data/models/day_tour_rate_chart_model.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class DayTourRateChartWidget extends StatelessWidget {
  final DayTourRateChartModel? dayRateChartModel;
  const DayTourRateChartWidget({Key? key, this.dayRateChartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        TableRow(children: [
          Text(
            dayRateChartModel!.vehicleType,
            style: CustomTextStyle.ultraSmallBoldTextStyle(
                color: Colors.black),
          ),
          Text(dayRateChartModel!.shared,
              style: CustomTextStyle.ultraSmallBoldTextStyle(
                  color: Colors.black)),
          Text(dayRateChartModel!.reserved,
              style: CustomTextStyle.ultraSmallBoldTextStyle(
                  color: Colors.black))
        ]),
      ],
    );
  }
}
