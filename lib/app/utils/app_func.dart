import 'package:intl/intl.dart';

bool isValidEmail(String email) {
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

String formatDate(String? dateString) {
  DateTime dateTime = DateTime.parse(dateString ?? "");
  String formattedDate = DateFormat('d MMMM y', 'id_ID').format(dateTime);
  return formattedDate;
}

String formatCurrency(String amount) {
  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );
  final num parsedAmount = num.parse(amount);
  return currencyFormatter.format(parsedAmount);
}

String formatTime(String time) {
  final DateTime parsedTime = DateFormat('HH:mm:ss').parse(time);
  final String formattedTime = DateFormat('HH.mm').format(parsedTime);

  return formattedTime;
}

String getPaymentStatus({
  required bool isPaid,
  required bool isPaymentAccepted,
  required bool isRefund,
  required bool isRefundAccepted,
}) {
  if (isPaid == false &&
      isPaymentAccepted == false &&
      isRefund == false &&
      isRefundAccepted == false) {
    return "Belum terbayar";
  } else if (isPaid == true &&
      isPaymentAccepted == false &&
      isRefund == false &&
      isRefundAccepted == false) {
    return "Menunggu konfirmasi pembayaran";
  } else if (isPaid == true &&
      isPaymentAccepted == true &&
      isRefund == false &&
      isRefundAccepted == false) {
    return "Pesanan sudah terbayar dan sudah dikonfirmasi";
  } else if (isPaid == true &&
      isPaymentAccepted == true &&
      isRefund == true &&
      isRefundAccepted == false) {
    return "Menunggu konfirmasi pengembalian dana";
  } else if (isPaid == true &&
      isPaymentAccepted == true &&
      isRefund == true &&
      isRefundAccepted == true) {
    return "Dana sudah dikembalikan";
  } else {
    return "Terjadi kesalahan";
  }
}

bool isRefundable({
  required bool isPaymentAccepted,
  required bool isPaid,
  required bool isRefund,
  required bool isRefundAccepted,
  required bool isAdmin,
  required String date,
  required String departureTime,
}) {
  final now = DateTime.now();
  final scheduleDate = DateTime.tryParse(date);
  final scheduleTimeString = departureTime;
  final timeParts = scheduleTimeString.split(':');
  final scheduleHour = int.tryParse(timeParts[0]) ?? 0;
  final scheduleMinute = int.tryParse(timeParts[1]) ?? 0;
  final scheduleDateTime = DateTime(
      scheduleDate?.year ?? 0,
      scheduleDate?.month ?? 1,
      scheduleDate?.day ?? 1,
      scheduleHour,
      scheduleMinute);

  if (isAdmin) {
    if (isPaymentAccepted == true &&
        isPaid == true &&
        isRefund == true &&
        isRefundAccepted == false &&
        scheduleDateTime.isAfter(now)) {
      return true;
    } else {
      return false;
    }
  } else {
    if (isPaymentAccepted == true &&
        isPaid == true &&
        isRefund == false &&
        isRefundAccepted == false &&
        scheduleDateTime.isAfter(now)) {
      return true;
    } else {
      return false;
    }
  }
}

String getIsOneWay(bool isOneWay) {
  if (isOneWay) {
    return "Pulang & Pergi";
  } else {
    return "Berangkat";
  }
}
