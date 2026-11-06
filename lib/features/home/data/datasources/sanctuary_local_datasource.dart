import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sanctuary_model.dart';

abstract class SanctuaryLocalDataSource {
  Future<SanctuaryHomeDataModel> getSanctuaryHomeData();
}

class SanctuaryLocalDataSourceImpl implements SanctuaryLocalDataSource {
  @override
  Future<SanctuaryHomeDataModel> getSanctuaryHomeData() async {
    final jsonString = await rootBundle.loadString('assets/data/static.json');
    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return SanctuaryHomeDataModel.fromJson(decoded);
  }
}

