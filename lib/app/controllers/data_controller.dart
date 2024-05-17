import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DataController extends GetxController {
  Future<List<Map<String, dynamic>>> getData() async {
    List<Map<String, dynamic>> listData = [];
    String header =
        "zm6Bm=/:9F(k;b]i>l^/@s0hlkbfD2pkAW9r}°VM~1d!^hDh\$0GnBpFM=@alOq:Q";
    String encodedHeader =
        Uri.encodeComponent(header); // Encoding the header value

    try {
      final url = Uri.parse(
          'https://online.youngengineers.org/db/wp-json/wp/v2/pages?parent=127&per_page=100');
      var headers = {
        'AUTH_KEY': encodedHeader,
        'Content-Type': 'application/json',
      };
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Apiresponse = await response.stream.bytesToString();

        final apiData = json.decode(Apiresponse);
        for (var item in apiData) {
          // Access individual fields
          int id = item['id'];
          String title = item['title']['rendered'];
          String link = item['link'];
          String programLogo = item['program_logo'][0];
          String legoLogo = item['lego_long'];
          String programName = item['acf']['program_name'];
          String programMobileBI = item['program_mobile_backgroung'][0];
          String programWebBI = item['program_desktop_backgroung'][0];

          // Print the values for demonstration
          // print(item.length);
          // print('ID: $id');
          // print('Title: $title');
          // print('Link: $link');
          // print('PL: $programLogo');
          // print('LL: $legoLong');
          // print('ProgramName: $programName');

          // print('');
          listData.add({
            "id": id,
            "title": title,
            "programLogo": programLogo,
            "legoLogo": legoLogo,
            "programName": programName,
            "programMobileBI": programMobileBI,
            "programWebBI": programWebBI
          });
        }
        listData.sort((a, b) {
          String titleA = a['title'].toString().toLowerCase();
          String titleB = b['title'].toString().toLowerCase();

          bool startsWithP_A = titleA.startsWith('p');
          bool startsWithP_B = titleB.startsWith('p');

          if (startsWithP_A && !startsWithP_B) {
            return -1;
          } else if (!startsWithP_A && startsWithP_B) {
            return 1;
          } else {
            return titleA.compareTo(titleB);
          }
        });

        // for (var item in listData) {
        //   // print(item);
        // }

        // listData = listData
        // print('First API CALL');
        return listData;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> getModelData({required String id}) async {
    List<Map<String, dynamic>> listData = [];
    // Encoding the header value
    try {
      final url = Uri.parse(
          'https://online.youngengineers.org/db/wp-json/wp/v2/pages?parent=$id');
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Apiresponse = await response.stream.bytesToString();

        final apiData = json.decode(Apiresponse);
        for (var item in apiData) {
          // Access individual fields
          int id = item['id'];
          String title = item['title']['rendered'];
          String link = item['link'];
          String smallImage = item['small_image'];
          // String programLogo = item['program_logo'][0];
          // String legoLogo = item['lego_long'];
          // String programName = item['acf']['program_name'];
          // String programMobileBI = item['program_mobile_backgroung'][0];
          // String programWebBI = item['program_desktop_backgroung'][0];
          List<dynamic> listImages = item['lesson_0_gallery'];
          // print('2 API CALL : 1');

          // Print the values for demonstration
          // print(item.length);
          // print('ID: $id');
          // print('Title: $title');
          // print('Link: $link');
          // print('PL: $programLogo');
          // print('LL: $legoLong');
          // print('listImages: $listImages');

          // print('');
          listData.add({
            "id": id,
            "title": title,
            // "programLogo": programLogo,
            // "legoLogo": legoLogo,
            // "programName": programName,
            // "programMobileBI": programMobileBI,
            // "programWebBI": programWebBI,
            "listImages": listImages,
            "smallImage": smallImage
          });
        }
        return listData;
        // print('2 API CALL : 2');
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
