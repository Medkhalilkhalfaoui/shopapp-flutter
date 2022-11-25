import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriesRepository{
  var url = "https://fakestoreapi.com/products/categories";

  CategoriesRepository(){
    loadCategoriesFromApi();
  }

  loadCategoriesFromApi()async{
    var response = await http.get(Uri.parse(url));
    var Categoriesjson = json.decode(response.body);
    return Categoriesjson;


  }
}


