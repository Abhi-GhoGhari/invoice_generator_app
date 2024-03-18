import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Color(0xffD4D925),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.42,
            width: double.infinity,
            color: Colors.black,
            alignment: Alignment.center,
            // child: const Text(
            //   "+ Create Your Invoice ",
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.47,
              color: const Color(0xff9EB23B),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                MyRoute.invoiceoptionpage,
              );
            },
            child: Align(
              alignment: const Alignment(0, -0.1),
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.8,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  color: Color(0xffD4D925),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black45,
                        offset: Offset(5, 5)),
                  ],
                ),
                child: const Text(
                  "+ Creat Your Invoice",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
