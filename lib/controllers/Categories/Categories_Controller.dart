import 'package:get/get.dart';
import 'package:untitled/controllers/Categories/Categories_repository.dart';
import 'package:untitled/controllers/Products/products_controller.dart';

ProductsController productsController = ProductsController();

class CategoriesController extends GetxController{

  CategoriesRepository categoriesRepository = CategoriesRepository();
  var categories = [].obs;
  var currentIndex = 0.obs;
  var loading = false.obs;

  CategoriesController(){
   loadCategories();
  }
  loadCategories()async{
    loading(true);
    var tcategories = await categoriesRepository.loadCategoriesFromApi();
    categories (tcategories);
    if(categories.isNotEmpty){
      await productsController.loadproductsfromRepo(categories[currentIndex.value]);
    }

    loading(false);
  }
  changeCategories(index)async{
    currentIndex(index);
    await productsController.loadproductsfromRepo(categories[currentIndex.value]);

    //await loadCategories();
  }
}