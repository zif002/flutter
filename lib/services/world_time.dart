import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time; // the time in that location
  String flag; //url to an asset 
  String url; //location uel api endpoint
  WorldTime({ this.location, this.flag ,this.url });

  Future<void> getTime() async{

    try{
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);
        // print(data);

        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);
        
        DateTime now = DateTime.parse(dateTime);
        now = now.add(Duration(hours: int.parse(offset)));
        time = DateFormat.jm().format(now);
        //set time is property
    }catch(e){
      print('couth ereror $e');
      time = 'could not get time data';
    }
  } 
}