import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:travel_app/model/tripmodel/trip_model.dart';

class ChartPage extends StatelessWidget {
  final List<TripModel> trips;

  const ChartPage({Key? key, required this.trips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total Budget and Total Days for All Trips',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: charts.PieChart(
                _createChartData(),
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 60,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.auto,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<TripData, String>> _createChartData() {
    final totalBudget = trips.map((trip) => trip.budget).fold(0, (a, b) => a + b);
    final totalDays = trips.map((trip) => trip.totalDay).fold(0, (a, b) => a + b);

    final data = [
      TripData('Total Budget', totalBudget.toDouble()),
      TripData('Total Days', totalDays.toDouble()),
    ];

    return [
      charts.Series<TripData, String>(
        id: 'TripData',
        domainFn: (TripData trip, _) => trip.title,
        measureFn: (TripData trip, _) => trip.value,
        data: data,
        labelAccessorFn: (TripData trip, _) => '${trip.title}: ${trip.value}',
      )
    ];
  }
}

class TripData {
  final String title;
  final double value;

  TripData(this.title, this.value);
}

