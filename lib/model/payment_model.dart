import 'package:flutter/material.dart';

class PaymentModel extends ChangeNotifier {
  String _selectedPaymentMethod = '';
  IconData _selectedPaymentIcon = Icons.credit_card;

  String get selectedPaymentMethod => _selectedPaymentMethod;
  IconData get selectedPaymentIcon => _selectedPaymentIcon;

  void setPaymentMethod(String method, IconData icon) {
    _selectedPaymentMethod = method;
    _selectedPaymentIcon = icon;
    notifyListeners();
  }
}
