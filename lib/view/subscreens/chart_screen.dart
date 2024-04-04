import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late double totalTripValue;
  late double totalExpenseValue;

  late Map<String, double> details;

  @override
  void initState() {
    super.initState();
    addtoPieChart();
  }

  void addtoPieChart() {
    setState(() {
      totalTripValue = TripData.totalValue;
      totalExpenseValue = TripData.totalExpense;
      details = {
        'Budget': totalTripValue,
        'Additional Expense': totalExpenseValue,
      };
    });
  }

  List<Color> listColors = [const Color.fromARGB(255, 235, 239, 96), const Color.fromARGB(255, 162, 224, 75)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 90),
              const Text(
                'Money Status',
                style: TextStyle(fontSize: 28, color: Colors.white,fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 170),
              Center(
                child: PieChart(
                  animationDuration: const Duration(seconds: 5),
                  dataMap: details,
                  colorList: listColors,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  chartLegendSpacing: 50,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    showChartValueBackground: true,
                    showChartValuesOutside: true,
                  ),
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.bottom,
                    legendShape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TripData {
  static double totalValue = 0;
  static double totalExpense = 0;
}
