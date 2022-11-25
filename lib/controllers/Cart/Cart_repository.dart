
import 'dart:convert';

import 'package:http/http.dart' as http;

class CartRepository{
  var url = "https://fakestoreapi.com/carts/1";
  var purl = "https://fakestoreapi.com/products/";

  CartRepository(){
    loadCartFromApi();
  }

  loadCartFromApi()async{
    var response = await http.get(Uri.parse(url));
    var productsjson = json.decode(response.body);
    return productsjson["products"];


  }

  getProductFromApi(productId)async{
     var response = await http.get(Uri.parse(purl+productId.toString()));
     return json.decode(response.body);
  }

}