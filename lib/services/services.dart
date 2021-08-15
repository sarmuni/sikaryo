import 'package:http/http.dart' as http;

const urlBase = 'http://192.168.1.102/api_sikaryo/';

class Request{
  final String url;
  final dynamic body;

  Request({required this.url, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(urlBase+url), body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> get(){
    print(urlBase+url);
    return http.get(Uri.parse(urlBase+url)).timeout(Duration(minutes: 2));
  }
}