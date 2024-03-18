import 'package:flutter/material.dart';

import '../../../../utils/global_utils.dart';
import '../../../../utils/widget/my_snackbar.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({super.key});

  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Footer Page",
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
        body: Container(
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
                  //Compony Address
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onSaved: (val) {
                            Global.global.compony_address = val;
                          },
                          validator: (val) =>
                              val!.isEmpty ? "Enter Company Address!!" : null,
                          onFieldSubmitted: (val) {
                            formKey.currentState!.validate();
                          },
                          initialValue: Global.global.compony_address,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.location_on,
                              color: Color(0xffD4D925),
                            ),
                            hintText: "Enter Your Company Address",
                            labelText: "Company Address",
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
                  const SizedBox(
                    height: 20,
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
                              content: valideted
                                  ? "Form Saved"
                                  : "Failed  Validation!!",
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
        ),
      ),
    );
  }
}
