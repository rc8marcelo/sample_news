import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_news/app.dart';
import 'package:sample_news/core/di/service_locator.dart';

void main() {
  configureDependencies(Environment.prod);
  runApp(const NewsApp());
}
