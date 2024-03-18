import 'dart:io';

import 'package:flutter/cupertino.dart';

class Global {
  String? compony_name, compony_discription, compony_address;
  File? image;

  Global._();

  static final Global global = Global._();
  void reset() {
    compony_name = compony_discription = compony_address = null;
  }

  static List<TextEditingController> product_n_controller = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> product_p_controller = [
    TextEditingController(),
    TextEditingController(),
  ];
  static List<TextEditingController> product_q_controller = [
    TextEditingController(),
    TextEditingController(),
  ];

  static int totalprice = 0;

  void calTotalPrice() {
    for (var element in product_p_controller) {
      totalprice += int.parse(element.text.isNotEmpty ? element.text : '0') *
          int.parse(product_q_controller[product_p_controller.indexOf(element)]
                  .text
                  .isEmpty
              ? product_q_controller[product_p_controller.indexOf(element)].text
              : "0");
    }
  }
}
