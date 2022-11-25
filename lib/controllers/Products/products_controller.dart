

import 'package:get/get.dart';
import 'package:untitled/controllers/Products/products_repository.dart';

class ProductsController extends GetxController{
  ProductsRepository productsRepository = ProductsRepository();
  RxBool  loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;


  loadproductsfromRepo(String cat)async{
    loading(true);
    products = await productsRepository.loadProductsFromApi(cat);
    loading(false);
  }

  toggleGrid(){
    showGrid(!showGrid.value);
  }

}