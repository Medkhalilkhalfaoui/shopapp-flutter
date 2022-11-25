import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsRepository{
  var url = "https://fakestoreapi.com/products/category/";

  loadProductsFromApi(String cat)async{
    var response = await http.get(Uri.parse(url+cat));
    return json.decode(response.body);

  }

}