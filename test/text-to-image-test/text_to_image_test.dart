import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

main() {
  test("TEXT TO IMAGE TEST", () async {
    var uri = Uri.parse("https://open-ai21.p.rapidapi.com/texttoimage2");

    var headers = {
      "X-RapidAPI-Key": "43ed9df511msh831c9c93c93baacp1e4d29jsn92387802553b",
      "X-RapidAPI-Host": "open-ai21.p.rapidapi.com",
      'content-type': 'application/x-www-form-urlencoded',
    };

    var response = await http.post(
      uri,
      headers: headers,
      body: {
        'text': "OTTOMAN EMPIRE SOLDIER ON HORSE",
      },
    );
    var result = response.body;
    print(result);
    print(result.runtimeType);
    expect(response.statusCode == 200, true);
  });
}
