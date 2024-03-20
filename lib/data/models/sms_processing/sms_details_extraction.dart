class SmsDetailsExtraction {
  static bool headerValidate(String messageHeader) {
    // --- Revise data source headers to accommodate an expanded range of bank.
    List<String> headerList = [
      'BOIIND',
      'MAHABK',
      'HDFCBK',
      'SBIINB',
      'SBIBNK',
      'CBSSBI',
      'IDFCFB',
      'CANBNK',
      'AXISBK',
      'SBIUPI',
      'BOBBNK',
      'BOBTXN',
      'UNIONB',
      // --- add more headers here.
    ];

    List<String> parts = messageHeader.split("-");
    String secondPart = parts.length > 1 ? parts[1] : ''; // Accessing the second part

    return headerList.contains(secondPart);
  }

  getTransactionAmount(String message) {
    String amountStr = message.split('.').first.split(' ').last.replaceAll(RegExp(r'INR\s+(\d+(\.\d{1,2})?)|Rs\.\s+(\d+(\.\d{1,2})?)'), '').trim();
    double amount = double.tryParse(amountStr) ?? 0.0;
    return amount;
  }

  String getTransactionType(String message) {
    if (message.contains('debited')) {
      String type = 'debit';
      return type;
    } else if (message.contains('credited')) {
      String type = 'credit';

      return type;
    } else {
      String type = 'NA';

      return type;
    }
  }
}
