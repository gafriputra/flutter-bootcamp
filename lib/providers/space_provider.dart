
import 'dart:convert';

import 'package:bootcamp/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier{
  Future<List<Space>> getRecommendedSpaces() async {
    var url = Uri.http('bwa-cozy.herokuapp.com','recommended-spaces' );
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map<Space>((item) => Space.fromJson(item)).toList();
      return spaces;
    }else{
      return <Space>[];
    }
  }
}