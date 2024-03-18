import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global_utils.dart';
import 'my_snackbar.dart';

bool _hide = true;

Widget formWidget({
  required BuildContext context,
}) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  return Container(
    height: double.infinity,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(15),
    child: Form(
      key: formKey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            //Compony name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (val) {
                      Global.global.compony_name = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Name!!";
                      } else {
                        return null;
                      }
                    },
                    initialValue: Global.global.compony_name,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xffD4D925),
                      ),
                      hintText: "Enter Your Company Name",
                      labelText: "Company Name",
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
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(6),
            ),

            // Discription
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (val) {
                      Global.global.compony_discription = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Company Description!!";
                      } else {
                        return null;
                      }
                    },
                    initialValue: Global.global.compony_discription,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color(0xffD4D925),
                      ),
                      hintText: "Enter Your Company Description",
                      labelText: "Company Description",
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
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(6),
            ),

            //Save & Reset
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bool valideted = formKey.currentState!.validate();
                    if (valideted) {
                      formKey.currentState!.save();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      mysnackbar(
                        content:
                            valideted ? "Form Saved" : "Failed  Validation!!",
                        color: valideted ? Colors.green : Colors.red,
                      ),
                    );
                  },
                  child: const Text("SAVE"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Global.global.reset();
                    formKey.currentState!.reset();
                  },
                  child: const Text("RESET"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
