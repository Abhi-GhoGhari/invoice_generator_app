class MyRoute {
  static String splashscreen = "/";
  static String homepage = "home_page";
  static String invoiceoptionpage = "invoice_option_page";
  static String pdfpage = "pdf_page";
  static String productdetailspage = "product_details_page";
  static String footerpage = "footer_page";

  static List invoiceoptions = [
    {
      'title': 'Header Option',
      'route': 'Headeroption',
    },
    {
      'title': 'Product Option',
      'route': 'ProductOption',
    },
    {
      'title': 'Footer Option',
      'route': 'Footeroption',
    },
  ];
}
