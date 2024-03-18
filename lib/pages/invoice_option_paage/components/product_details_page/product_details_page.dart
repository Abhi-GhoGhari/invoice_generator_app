import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_generator_app/utils/global_utils.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    if (Global.product_n_controller.length > 1) ;
    {
      Global.product_n_controller
          .removeWhere((element) => element.text.isEmpty);
    }
    if (Global.product_n_controller.isEmpty ||
        Global.product_n_controller.length < 1) {
      if (Global.product_n_controller.length == 0) {
        Global.product_n_controller.add(
          TextEditingController(),
        );
      } else {
        Global.product_n_controller.addAll(
          [
            TextEditingController(),
            TextEditingController(),
          ],
        );
      }
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Product Detail's Page",
            style: TextStyle(
              color: Color(0xffD4D925),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xffD4D925),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ...List.generate(
                  Global.product_n_controller.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      children: [
                        //Product name
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // prefixIcon: const Icon(Icons.person),
                            hintText: "Enter Product Name",
                            labelText: "Product Name",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          controller: Global.product_n_controller[index],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),

                        //Product Price
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.currency_rupee,
                              color: Color(0xffD4D925),
                            ),
                            hintText: "Enter Product Price",
                            labelText: "Product Price",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: Global.product_p_controller[index],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),

                        //Product Quantity
                        TextField(
                          cursorColor: Colors.green,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            // prefixIcon: const Icon(Icons.currency_rupee),
                            hintText: "Enter Product Quantity",
                            labelText: "Product Quantity",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: Global.product_q_controller[index],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        IconButton(
                          onPressed: () {
                            Global.product_n_controller.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Color(0xffD4D925),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Global.product_n_controller.add(
                      TextEditingController(),
                    );
                    Global.product_q_controller.add(
                      TextEditingController(),
                    );
                    Global.product_p_controller.add(
                      TextEditingController(),
                    );
                    setState(() {});
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
