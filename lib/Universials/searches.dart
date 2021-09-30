import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:includepay/jsonConvter/saccoSearch.dart';

Future saccoSearch(String q) async {
  try {
    print("Testing serial......");
    var headers = {'Cookie': 'PHPSESSID=c96c308490ba093f4d2a5e073eaaf6dc'};
    var request = http.Request(
        'GET', Uri.parse('https://sacco.irembofinance.com/API/saccos/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      SaccoSearch saccoslist = SaccoSearch.fromJson(body);
      List<Sacco> list = saccoslist.saccos;
      return list
          .where(
            (sco) => sco.name.toUpperCase().startsWith(
                  q.toUpperCase(),
                ),
          )
          .toList();
    } else {
      print(response.reasonPhrase);
    }
  } catch (e) {}
}
