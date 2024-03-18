import 'package:flutter/material.dart';
import 'package:invoice_generator_app/utils/route_utils.dart';

class InvoiceOptionPage extends StatefulWidget {
  const InvoiceOptionPage({super.key});

  @override
  State<InvoiceOptionPage> createState() => _InvoiceOptionPageState();
}

class _InvoiceOptionPageState extends State<InvoiceOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        title: const Text(
          "Invoice Option",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.white,
            color: Color(0xffD4D925),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffD4D925),
        ),
      ),
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: MyRoute.invoiceoptions
                .map(
                  (e) => ListTile(
                    title: Text(
                      e['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          e['route'],
                        );
                      },
                      icon: const Icon(Icons.arrow_right, size: 30),
                      color: const Color(0xffD4D925),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffD4D925),
        onPressed: () => Navigator.pushNamed(
          context,
          MyRoute.pdfpage,
        ),
        icon: const Icon(
          Icons.picture_as_pdf,
          color: Colors.black,
        ),
        label: const Text(
          "Create PDF",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
