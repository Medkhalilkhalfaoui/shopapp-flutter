import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/Cart/Cart_controller.dart';
import 'package:untitled/controllers/Cart/Cart_repository.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _builAppBar(),
      body: Obx(
            () {
          if (cartController.loading.value) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }
          if (cartController.cartItems.isEmpty) {
            return const Center(child: Text("No cart items found!"));
          }
          return Stack(
            children: [
              Container(),
              Positioned.fill(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartController.cartItems.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) => Card(
                    elevation: 0,
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(8.0),
                      width: 100,
                      margin:const  EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(cartController
                                      .cartItems[index]["product"]["image"])),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartController.cartItems[index]["product"]
                                    ["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cartController.cartItems[index]["product"]
                                      ["description"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "\$${cartController.cartItems[index]["product"]["price"]}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.grey[200],
                                child:const  Icon(Icons.remove),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(cartController.cartItems[index]
                                ["quantity"]
                                    .toString()),
                              ),
                              Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildBottom(),
            ],
          );
        },
      ),
    );
  }
  _builAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      title: const Text(
        "Cart",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
      ],
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
  _buildBottom(){
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8.0,top: 4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  const Text("Subtotal",style: TextStyle(fontWeight: FontWeight.bold),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text("\$${cartController.subtotal.value}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      const Text("Subtotal does not include shipping",style: TextStyle(color: Colors.grey,fontSize: 12),),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16
                              ),
                              primary: Colors.black,
                              elevation: 0,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(
                                      color: Colors.black38
                                  )
                              )),
                          onPressed: () {},
                          child: const Text("Check out"))),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16
                            ),
                            primary: Colors.white,
                            elevation: 0,
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(
                                    color: Colors.black38
                                )
                            )),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Check out With",style:TextStyle(color: Colors.black)),
                            const SizedBox(width: 4,),
                            Container(
                              width: 60,
                              height: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://www.techrounder.com/wp-content/uploads/2019/08/paypal-logo.png"),
                                  )),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Continue Shopping"),
            ],
          ),
        ));
  }
}
