import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos_system/consts.dart';
import 'dart:developer';

enum Tasks { Login, Teams, Products, Purchase }

extension TaskAPI on Tasks {
  String get api {
    switch (this) {
      case Tasks.Login:
        return "login";
        break;
      case Tasks.Teams:
        return "teams";
        break;
      case Tasks.Products:
        return "products";
      case Tasks.Purchase:
        return "purchase";
      default:
        return "err";
    }
  }
}

String _buildGetHeader(Map<String, String> data) {
  String buf = "";
  data.forEach((key, value) {
    buf += key + "=" + value + "&";
    // buf += "$key=$value&";
  });
  if (buf.length != 0) {
    buf = buf.substring(0, buf.length - 1); // Remove final &
  }
  return buf;
}

Future<Map<String, dynamic>> getter(
    Tasks task, Map<String, String> data) async {
  String _processedData = _buildGetHeader(data);
  String _task = task.api;
  final response = await http.get("$ENDPOINT?task=$_task&$_processedData");
  assert(response.statusCode == 200);
  log(response.body);
  return convert.json.decode(response.body);
}

Future<Map<String, dynamic>> setter(
    Tasks task, Map<String, dynamic> data) async {
  print(json.encode(data));
  final response = await http
      .get(ENDPOINT + "?task=" + task.api + "&data=" + json.encode(data));
  assert(response.statusCode == 200);
  print(response.body);
  return convert.json.decode(response.body);
}
