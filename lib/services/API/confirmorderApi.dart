// ignore_for_file: file_names, avoid_print
import 'package:http/http.dart' as http;
import 'package:internapp/global/access.dart';
import 'package:internapp/global/network.dart';

class ConfirmOrder{
  Future <bool> confirm({int? cartcustomerId}) async{
    try{
      return await http.post(
        Uri.parse("${Network.url}/confirmedorder/$cartcustomerId"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $accessToken"
        },
      ).then((response) {
        print(response.body);
        return response.statusCode == 200;
      },);
    }
    catch (e) {
      return false;
    }
  }
}