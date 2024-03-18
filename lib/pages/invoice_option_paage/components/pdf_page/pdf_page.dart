// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart%20';
// import 'package:printing/printing.dart';
//
// import '../../../../utils/global_utils.dart';
//
// class PdfPage extends StatefulWidget {
//   const PdfPage({super.key});
//
//   @override
//   State<PdfPage> createState() => _PdfPageState();
// }
//
// pw.TextStyle nameStyle =
//     pw.TextStyle(fontSize: 35, fontWeight: pw.FontWeight.bold);
// Future<Uint8List> getPDF({required Size size}) async {
//   ByteData byteData = await rootBundle.load("lib/assets/logo/campony_logo.png");
//   pw.Document pdf = pw.Document();
//
//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Padding(
//           padding: const pw.EdgeInsets.all(15),
//           child: pw.Column(
//             children: [
//               pw.Container(
//                 padding: const pw.EdgeInsets.all(5),
//                 height: 100,
//                 width: double.infinity,
//                 child: pw.Row(
//                   children: [
//                     pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           "Invoice",
//                           style: pw.TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         pw.Spacer(),
//                         pw.Text(
//                           "Name = ${Global.global.compony_name}",
//                           style: const pw.TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                         pw.Text(
//                           "Name = ${Global.global.compony_discription}",
//                           style: const pw.TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                         pw.Text(
//                           "Name = ${Global.global.compony_address}",
//                           style: const pw.TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                     pw.Spacer(),
//                     pw.Image(
//                       pw.MemoryImage(
//                         byteData.buffer.asUint8List(),
//                       ),
//                       height: 150,
//                     ),
//                   ],
//                 ),
//               ),
//               pw.Container(
//                 padding: const pw.EdgeInsets.all(5),
//                 height: 500,
//                 width: double.infinity,
//                 child: pw.Row(
//                   children: [
//                     pw.Container(
//                       padding: const pw.EdgeInsets.all(5),
//                       width: 50,
//                       height: 480,
//                       decoration: pw.BoxDecoration(
//                         border:
//                             pw.Border.all(width: 1.5, color: PdfColors.black),
//                         borderRadius: pw.BorderRadius.circular(5),
//                       ),
//                       child: pw.Column(
//                         children: [
//                           pw.Text(
//                             "No.",
//                             style: pw.TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           pw.SizedBox(height: 10),
//                           ...Global.product_n_controller.map(
//                             (e) => pw.Text(
//                               '${Global.product_p_controller.indexOf(e) + 1}',
//                               style: const pw.TextStyle(fontSize: 16),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     pw.Container(
//                       padding: const pw.EdgeInsets.all(5),
//                       width: 200,
//                       height: 480,
//                       decoration: pw.BoxDecoration(
//                         border:
//                             pw.Border.all(width: 1.5, color: PdfColors.black),
//                         borderRadius: pw.BorderRadius.circular(5),
//                       ),
//                       child: pw.Column(
//                         children: [
//                           pw.Text(
//                             'Title',
//                             style: pw.TextStyle(
//                               fontWeight: pw.FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           pw.SizedBox(height: 10),
//                           ...Global.product_p_controller.map(
//                             (e) => pw.Text(
//                               e.text,
//                               style: const pw.TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     pw.Container(
//                       padding: const pw.EdgeInsets.all(5),
//                       width: 200,
//                       height: 480,
//                       decoration: pw.BoxDecoration(
//                         border:
//                             pw.Border.all(width: 1.5, color: PdfColors.black),
//                         borderRadius: pw.BorderRadius.circular(5),
//                       ),
//                       child: pw.Column(
//                         children: [
//                           pw.Text(
//                             'Qut',
//                             style: pw.TextStyle(
//                               fontWeight: pw.FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           pw.SizedBox(height: 10),
//                           ...Global.product_q_controller.map(
//                             (e) => pw.Text(
//                               e.text,
//                               style: const pw.TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     pw.Container(
//                       padding: const pw.EdgeInsets.all(5),
//                       width: 200,
//                       height: 480,
//                       decoration: pw.BoxDecoration(
//                         border:
//                             pw.Border.all(width: 1.5, color: PdfColors.black),
//                         borderRadius: pw.BorderRadius.circular(5),
//                       ),
//                       child: pw.Column(
//                         children: [
//                           pw.Text(
//                             'Val',
//                             style: pw.TextStyle(
//                               fontWeight: pw.FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           pw.SizedBox(height: 10),
//                           ...Global.product_p_controller.map(
//                             (e) => pw.Text(
//                               Global.product_p_controller.isNotEmpty
//                                   ? e.text
//                                   : "0",
//                               style: const pw.TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               pw.Container(
//                 padding: const pw.EdgeInsets.all(5),
//                 width: double.infinity,
//                 height: 68.5,
//                 decoration: pw.BoxDecoration(
//                   border: pw.Border.all(width: 1.5, color: PdfColors.black),
//                   borderRadius: pw.BorderRadius.circular(5),
//                 ),
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       "- Thank you.... And Visit Again!",
//                       style: const pw.TextStyle(
//                         fontSize: 13,
//                       ),
//                     ),
//                     pw.SizedBox(
//                       height: 10,
//                     ),
//                     pw.Text(
//                       "- Contact: 8128214806",
//                       style: const pw.TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
//   return pdf.save();
// }
//
// class _PdfPageState extends State<PdfPage> {
//   @override
//   void initState() {
//     // Global.global.calTotalPrice();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PDF page"),
//       ),
//       body: PdfPreview(
//         build: (PdfPageFormat format) => getPDF(size: size),
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../utils/global_utils.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPDF() async {
    ByteData byteDatadefoult =
        await rootBundle.load("lib/assets/logo/campony_logo.png");
    Uint8List imageData = byteDatadefoult.buffer.asUint8List();
    Global.global.image != null;
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(15),
            child: pw.Column(
              children: [
                pw.Container(
                  padding: const pw.EdgeInsets.all(5),
                  height: 100,
                  width: double.infinity,
                  child: pw.Row(
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          // pw.Text(
                          //   "Invoice",
                          //   style: pw.TextStyle(
                          //     fontWeight: pw.FontWeight.bold,
                          //   ),
                          // ),
                          pw.Spacer(),
                          pw.Text(
                            "Name : ${Global.global.compony_name}",
                            style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "ss${Global.global.compony_discription}",
                            style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      pw.Spacer(),
                      pw.Image(
                        pw.MemoryImage(imageData),
                        height: 120,
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.all(5),
                  height: 500,
                  width: double.infinity,
                  child: pw.Row(
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 50,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              "No.",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...Global.product_n_controller.map(
                              (e) => pw.Text(
                                '${Global.product_n_controller.indexOf(e) + 1}',
                                style: const pw.TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 150,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'Title',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // pw.SizedBox(height: 10),
                            ...Global.product_n_controller.map(
                              (e) => pw.Text(
                                e.text,
                                style: const pw.TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 50,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'Qut',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...Global.product_q_controller.map(
                              (e) => pw.Text(
                                e.text,
                                style: const pw.TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 60,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'Price',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...Global.product_p_controller.map(
                              (e) => pw.Text(
                                e.text,
                                style: const pw.TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 100,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'amt',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            ...Global.product_p_controller.map(
                              (e) => pw.Text((e.text.isNotEmpty
                                      ? int.parse(e.text) *
                                          int.parse(Global
                                              .product_q_controller[Global
                                                  .product_p_controller
                                                  .indexOf(e)]
                                              .text)
                                      : "")
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.all(5),
                        width: 100,
                        height: 500,
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(width: 1.5, color: PdfColors.black),
                          borderRadius: pw.BorderRadius.circular(5),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Text(
                              'Total',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // pw.Text(
                            //   "Rs.  ${Global.totalprice ?? "0"}",
                            //   style: const pw.TextStyle(fontSize: 20),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.all(5),
                  height: 95,
                  width: 600,
                  // decoration: pw.BoxDecoration(
                  //   border: pw.Border.all(width: 1.5, color: PdfColors.black),
                  //   borderRadius: pw.BorderRadius.circular(5),
                  // ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Address : ${Global.global.compony_address}",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(2),
                      ),
                      pw.Text(
                        " Thank you.... \t\tAnd Visit Again!",
                        style: const pw.TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF page"),
      ),
      body: PdfPreview(
        build: (PdfPageFormat format) => getPDF(),
      ),
    );
  }
}
