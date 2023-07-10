import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_avia/models/avia_data.dart';

Future<AviaData?> fetchData() async {
  final response = await http.get(Uri.parse(
      'https://k106555.hostde21.fornex.host/v1/test_api.php?key=getAvia&apiKey=RoCyGPs9ocF92neCHnGcAOMvpnLo2ol6'));

  if (response.statusCode == 200) {
    return AviaData?.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
