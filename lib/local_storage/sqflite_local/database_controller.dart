import 'package:get/get.dart';
import 'database_helper.dart';
import 'sqflite_db_model.dart';

class TransactionController extends GetxController {
  static TransactionController get instance => Get.find();
  var transactions = <SqfliteDbModel>[].obs;
  RxDouble totalDebitAmount = 0.0.obs;
  RxDouble totalCreditAmount = 0.0.obs;
  RxDouble totalDebitAmountToday = 0.0.obs;
  RxDouble totalCreditAmountToday = 0.0.obs;
  RxDouble totalDebitAmountMonth = 0.0.obs;
  RxDouble totalCreditAmountMonth = 0.0.obs;
  RxDouble averageMonthTransaction = 0.0.obs;
  RxInt totalDebitNoInMonth = 0.obs;
  RxInt totalCreditNoInMonth = 0.obs;
  var deleteTableDB = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
    fetchTotalDebitAmount();
    fetchTotalCreditAmount();
    fetchTotalDebitAmountForToday();
    fetchTotalCreditAmountForToday();
    fetchTotalDebitAmountForMonth();
    fetchTotalCreditAmountForMonth();
    fetchAverageTAmountForMonth();
    fetchTotalNoOfDebitForMonth();
    fetchTotalNoOfCreditForMonth();
  }

  // -- load Transactions when application opens
  Future<void> loadTransactions() async {
    final List<SqfliteDbModel> loadedTransactions = await TransactionDatabase.instance.readAllTransactions();
    transactions.assignAll(loadedTransactions);
  }

  // -- add Transaction Method when new sms is received
  Future<void> addTransaction(String header, String type, double amount) async {
    final currentDate = DateTime.now();
    final newTransaction = SqfliteDbModel(
      header: header,
      type: type,
      amount: amount,
      dateReceived: currentDate,
    );
    await TransactionDatabase.instance.create(newTransaction);
    loadTransactions();
    fetchTotalDebitAmount();
    fetchTotalCreditAmount();
    fetchTotalDebitAmountForToday();
    fetchTotalCreditAmountForToday();
    fetchTotalDebitAmountForMonth();
    fetchTotalCreditAmountForMonth();
    fetchAverageTAmountForMonth();
    fetchTotalNoOfDebitForMonth();
    fetchTotalNoOfCreditForMonth();
  }

  // -- FETCH TOTAL DEBIT AMOUNT ON SCREEN (PAGE: CREDIT PAYMENT)
  void fetchTotalDebitAmount() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalDebitAmount();
      totalDebitAmount.value = amount;
    } catch (e) {
      //---
    }
  }

  // -- FETCH TOTAL CREDIT AMOUNT ON SCREEN (PAGE: DEBIT PAYMENTS)
  void fetchTotalCreditAmount() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalCreditAmount();
      totalCreditAmount.value = amount;
    } catch (e) {
      //---
    }
  }

  // ---------------------------------------------------------------------------------------------------------------------------- //

  // -- FETCH TOTAL DEBIT AMOUNT FOR CURRENT DAY  => Today's Insight (PAGE: HOME)
  void fetchTotalDebitAmountForToday() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalDebitAmountForToday();
      totalDebitAmountToday.value = amount;
    } catch (e) {
      //---
    }
  }

  // -- FETCH TOTAL CREDIT AMOUNT FOR CURRENT DAY => Today's Insight (PAGE: HOME)
  void fetchTotalCreditAmountForToday() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalCreditAmountForToday();
      totalCreditAmountToday.value = amount;
    } catch (e) {
      //---
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------- //

  // -- FETCH TOTAL DEBIT AMOUNT FOR CURRENT MONTH  => Monthly Statistics (PAGE: HOME)
  void fetchTotalDebitAmountForMonth() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalDebitAmountForMonth();
      totalDebitAmountMonth.value = amount;
    } catch (e) {
      //---
    }
  }

  // -- FETCH TOTAL CREDIT AMOUNT FOR CURRENT MONTH => Monthly Statistics (PAGE: HOME)
  void fetchTotalCreditAmountForMonth() async {
    try {
      var amount = await TransactionDatabase.instance.getTotalCreditAmountForMonth();
      totalCreditAmountMonth.value = amount;
    } catch (e) {
      //---
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------- //

  // -- FETCH TOTAL DEBIT AMOUNT FOR CURRENT MONTH  => Monthly Statistics (PAGE: HOME)
  void fetchAverageTAmountForMonth() async {
    try {
      var amount = await TransactionDatabase.instance.getAverageForMonth();
      averageMonthTransaction.value = amount;
    } catch (e) {
      //---
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------- //

  // -- FETCH TOTAL DEBIT AMOUNT FOR CURRENT MONTH  => Monthly Statistics (PAGE: HOME)
  void fetchTotalNoOfDebitForMonth() async {
    try {
      var noOfTransaction = await TransactionDatabase.instance.getTotalNoOfDebitForMonth();
      totalDebitNoInMonth.value = noOfTransaction;
    } catch (e) {
      //---
    }
  }

  // -- FETCH TOTAL CREDIT AMOUNT FOR CURRENT MONTH => Monthly Statistics (PAGE: HOME)
  void fetchTotalNoOfCreditForMonth() async {
    try {
      var noOfTransaction = await TransactionDatabase.instance.getTotalNoOfCreditForMonth();
      totalCreditNoInMonth.value = noOfTransaction;
    } catch (e) {
      //---
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------- //

  // ------ DELETE TRANSACTION DATA => (PAGE: PROFILE)
  // void clearTransactionDataTable() async {
  //   try {
  //     deleteTableDB = await TransactionDatabase.instance.clearTransactionsTable();
  //   } catch (e) {
  //     // ---
  //   }
  // }
}
