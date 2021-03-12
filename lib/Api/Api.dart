import 'package:http/http.dart' as http;

const baseUrl = "https://fakestoreapi.com";

class Api {
  
  static Future getMunicipios()async{
    var url = "https://fakestoreapi.com/products/";
    final uri = Uri(path: url);
    return await http.get(Uri.parse(url));
  }
}