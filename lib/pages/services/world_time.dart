import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime;
  WorldTime({this.location, this.flag, this.time, this.url,this.isDaytime});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      // Get properties from data
      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(utc_offset);

      // Create date object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset)));

      // Set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true: false;
      time = DateFormat.jm().format(now);
      // print(now);
    } catch (e) {
      print('Catch error: $e');
      time = 'Time Could not Available now';
    }
  }
}
