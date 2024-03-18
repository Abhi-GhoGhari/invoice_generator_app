import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator_app/utils/global_utils.dart';

import '../../utils/widget/form_widget.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({super.key});

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  int _selectedIndex = 0;
  Future<void> getImg({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: source,
    );
    if (file != null) {
      Global.global.image = File(file.path);
      setState(() {});
    }
  }

  @override
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
            "Personal Info Page",
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
        body: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              //form & photo
              Row(
                children: [
                  //form
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _selectedIndex = 0;
                        setState(() {});
                      },
                      child: Container(
                        height: size.height * 0.07,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xffD4D925),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Form",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2),
                  ),

                  //photo
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _selectedIndex = 1;
                        setState(() {});
                      },
                      child: Container(
                        height: size.height * 0.07,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.black38,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),

              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    //0
                    formWidget(context: context),

                    //1
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Select source"),
                              actions: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    getImg(source: ImageSource.camera).then(
                                      (value) {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text("Camera"),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    getImg(source: ImageSource.gallery).then(
                                      (value) {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.image_rounded),
                                  label: const Text("gallery"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          foregroundImage: Global.global.image != null
                              ? FileImage(Global.global.image!)
                              : null,
                          radius: 120,
                          backgroundColor: const Color(0xffD4D925),
                          child: const Text(
                            "+ Add Photo",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
