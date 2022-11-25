import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/Categories/Categories_Controller.dart';
import 'package:untitled/pages/cart.dart';
import 'package:untitled/pages/splash.dart';

import '../controllers/auth/auth_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoriesController categoriesController = CategoriesController();
  AuthController authController = AuthController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Obx((){
        if(categoriesController.loading.value ){
          return const Center(child: CircularProgressIndicator(color: Colors.black,),);
        }
        if(categoriesController.categories.isEmpty){
          return const Center(child: Text("No categories found"));
        }
        return Padding(
          padding:const  EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTop(),
              _buildCategoriesRow(),
              Expanded(
                  child: Obx((){
                    if(productsController.loading.value){
                      return const Center(child: CircularProgressIndicator(color: Colors.black,),);
                    }
                    if(productsController.products.isEmpty){
                      return const Center(child: Text("No products found"));
                    }

                    if (productsController.showGrid.value){
                      return GridView.builder(
                        padding:const  EdgeInsets.only(top: 16),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: productsController.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding:const  EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(productsController
                                            .products[index]["image"]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productsController.products[index]
                                            ["title"],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              productsController.products[index]
                                              ["description"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "\$${productsController.products[index]["price"]}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return _buildProductsList();
                  })
              )
            ],
          ),
        );
      }),

    );
  }

  PreferredSizeWidget  _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      //centerTitle: true,
      iconTheme:const IconThemeData(color: Colors.black),
      //leading:const BackButton(),
      elevation: 0,
      title:const Text("      Shop", style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(onPressed: (){}, icon:const  Icon(Icons.search)),
        IconButton(onPressed: (){
          authController.logout();
          Get.off(()=>SplashScreen());
        }, icon:const  Icon(Icons.logout_outlined)),
        IconButton(onPressed: (){
          Get.to(()=>Cartpage());
        }, icon:const  Icon(Icons.shopping_cart_outlined))
      ],
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cloths",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsController.toggleGrid();
            },
            icon:const  Icon(Icons.filter_list)),
      ],
    );
  }


  Container _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categoriesController.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            categoriesController.changeCategories(index);
          },
          child: Obx(()=>Container(
            margin:const  EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: index == categoriesController.currentIndex.value ? Colors.black87 : Colors.transparent,
            ),
            padding:const  EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              categoriesController.categories[index],
              style: TextStyle(
                color: index == categoriesController.currentIndex.value ? Colors.white : Colors.black,
              ),
            ),
          )),
        ),
      ),
    );
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding:const  EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding:const  EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
