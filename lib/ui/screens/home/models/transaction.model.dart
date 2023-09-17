import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String date;
  final String amount;
  final AssetImage image;
  final Color? colorText;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.image,
    this.colorText,
  });
}
