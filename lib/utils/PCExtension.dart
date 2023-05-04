import 'dart:convert';

import 'package:cricket_worlcup_ui/model/PCPlayerListModel.dart';
import 'package:flutter/services.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<PCPlayerListModel>> loadPlayerList() async {
  String jsonString = await loadContentAsset('assets/Cricket_Team.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => PCPlayerListModel.fromJson(i)).toList();
}
