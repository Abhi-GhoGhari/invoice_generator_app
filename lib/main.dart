import 'package:flutter/material.dart';
import 'package:invoice_generator_app/pages/home_page/home_page.dart';
import 'package:invoice_generator_app/pages/invoice_option_paage/components/footer_page/footer_page.dart';
import 'package:invoice_generator_app/pages/invoice_option_paage/components/pdf_page/pdf_page.dart';
import 'package:invoice_generator_app/pages/invoice_option_paage/components/product_details_page/product_details_page.dart';
import 'package:invoice_generator_app/pages/invoice_option_paage/header_page.dart';
import 'package:invoice_generator_app/pages/invoice_option_paage/invoice_option_page.dart';
import 'package:invoice_generator_app/pages/splash_screen/splash_screen.dart';
import 'package:invoice_generator_app/utils/route_utils.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoute.splashscreen: (context) => const SplashScreen(),
        MyRoute.homepage: (context) => const HomePage(),
        MyRoute.invoiceoptionpage: (context) => const InvoiceOptionPage(),
        MyRoute.pdfpage: (context) => const PdfPage(),
        MyRoute.invoiceoptions[0]['route']: (context) => const HeaderPage(),
        MyRoute.invoiceoptions[1]['route']: (context) =>
            const ProductDetailsPage(),
        MyRoute.invoiceoptions[2]['route']: (context) => const FooterPage(),
      },
    );
  }
}
