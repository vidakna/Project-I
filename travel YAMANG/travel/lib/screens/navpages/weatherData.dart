// ignore_for_file: file_names, unused_import, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/screens/navpages/weatherModel.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    //jayanthiwewa
    // var uriCall=Uri.parse('http://api.weatherapi.com/v1/current.json?key=cb03b5145d5a4df089c202311222108&q=$latitude,$longitude&aqi=no');
    //colombo
    // var uriCall=Uri.parse('http://api.weatherapi.com/v1/current.json?key=3680fefeb4e9469a8a440926222708&q=6.93,79.85&aqi=no');
    //kiribathgoda
    //var uriCall=Uri.parse('http://api.weatherapi.com/v1/current.json?key=3680fefeb4e9469a8a440926222708&q=6.8,79.88&aqi=no');
    //gampaha
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=3680fefeb4e9469a8a440926222708&q=7.09,79.99&aqi=no');

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
