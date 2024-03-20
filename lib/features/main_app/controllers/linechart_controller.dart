import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thrift/local_storage/sqflite_local/database_helper.dart';

class LineChartController extends GetxController {
  // Create a stream controller
  final StreamController<List<ChartData>> _dataStreamController = StreamController<List<ChartData>>();

  // Expose the stream
  Stream<List<ChartData>> get dataStream => _dataStreamController.stream;

  // Function to generate and emit weekly data
  void generateWeeklyData() async {
    // Initialize a list to store weekly data
    List<ChartData> data = [];

    // Calculate total debit amount for each day of the week
    DateTime monday = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    for (int i = 0; i < 7; i++) {
      // Get the date for the current day of the week
      DateTime date = monday.add(Duration(days: i));

      // Calculate the total debit amount for the current day
      double debitAmount = await TransactionDatabase.instance.getTotalDebitAmountForDate(date);

      // Format the date to display in the chart
      String formattedDate = DateFormat('EEE').format(date);

      // Add the data to the list
      data.add(ChartData(debitAmount, formattedDate));
    }

    // Emit the data through the stream
    _dataStreamController.add(data);
  }

  // Dispose the stream controller when not needed
  @override
  void dispose() {
    super.dispose();
    _dataStreamController.close();
  }
}

class ChartData {
  final String week;
  final double debitAmount;

  ChartData(this.debitAmount, this.week);
}
