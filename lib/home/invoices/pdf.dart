import 'dart:typed_data';
import 'package:invoice_generator/home/invoices/page1.dart';
import 'package:invoice_generator/home/invoices/page2.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (formate) => generatepdf(),
      ),
    );
  }
}

Future<Uint8List> generatepdf() async {
  final pdf = pw.Document();
  final image1 = await imageFromAssetBundle('assets/images/logo.png');
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a3,
      build: (context) => pw.Column(children: [
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('${customer}\n${address}',
                      style: pw.TextStyle(fontSize: 25)),
                  pw.Container(
                      height: 120, width: 180, decoration: pw.BoxDecoration(color: PdfColors.purpleAccent,image: pw.DecorationImage(image:  image1,fit: pw.BoxFit.cover))),
                ]),
            pw.SizedBox(height: 50),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColors.black, width: 2),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('INVOICE FOR PAYMENT',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(fontSize: 26)),
                      ),
                      padding: pw.EdgeInsets.all(20),
                    ),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 120),
                    ),
                  ]),
                  ...List.generate(
                      items.length,
                      (index) => pw.TableRow(children: [
                            pw.Padding(
                              child: pw.Container(
                                child: pw.Text('${items[index]}',
                                    textAlign: pw.TextAlign.left,
                                    style: pw.TextStyle(fontSize: 25)),
                              ),
                              padding: pw.EdgeInsets.all(15),
                            ),
                            pw.Padding(
                              child: pw.Text('\$${price[index]}',
                                  textAlign: pw.TextAlign.left,
                                  style: pw.TextStyle(fontSize: 25)),
                              padding: pw.EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10, right: 120),
                            ),
                          ])),
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('TAX ',
                            textAlign: pw.TextAlign.right,
                            style: pw.TextStyle(fontSize: 26)),
                      ),
                      padding: pw.EdgeInsets.all(15),
                    ),
                    pw.Padding(
                      child: pw.Text('\$${tax} ',
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(fontSize: 25)),
                      padding: pw.EdgeInsets.only(
                          top: 15, bottom: 15, left: 15, right: 120),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('TOTAL ',
                            textAlign: pw.TextAlign.right,
                            style: pw.TextStyle(fontSize: 26)),
                      ),
                      padding: pw.EdgeInsets.all(15),
                    ),
                    pw.Padding(
                      child: pw.Text('\$${amt} ',
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(fontSize: 25)),
                      padding: pw.EdgeInsets.only(
                          top: 15, bottom: 15, left: 15, right: 120),
                    ),
                  ]),
                ]),
            pw.Text('\nTHANK YOU FOR YOUR BUSINESS!',
                style: pw.TextStyle(fontSize: 25)),
            pw.Text(
                '\nPlease forward the below slip to your accounts payable department',
                style: pw.TextStyle(fontSize: 23)),
            pw.Text(
                '---------------------------------------------------------------------------------------',
                style: pw.TextStyle(fontSize: 25)),
            pw.SizedBox(height: 50),
            pw.Table(
                border: pw.TableBorder.all(color: PdfColors.black, width: 2),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('Account Number',
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(fontSize: 27)),
                      ),
                      padding: pw.EdgeInsets.all(15),
                    ),
                    pw.Padding(
                      child: pw.Text(' 1234 1234',
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(fontSize: 25)),
                      padding: pw.EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 50),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('Account Name',
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(fontSize: 27)),
                      ),
                      padding: pw.EdgeInsets.all(15),
                    ),
                    pw.Padding(
                      child: pw.Text(' ADAM FAMILY TRUST',
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(fontSize: 25)),
                      padding: pw.EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 50),
                    ),
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                      child: pw.Container(
                        child: pw.Text('Total Amount to be Paid',
                            textAlign: pw.TextAlign.left,
                            style: pw.TextStyle(fontSize: 27)),
                      ),
                      padding: pw.EdgeInsets.all(15),
                    ),
                    pw.Padding(
                      child: pw.Text(' \$${amt}',
                          textAlign: pw.TextAlign.left,
                          style: pw.TextStyle(fontSize: 25)),
                      padding: pw.EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 50),
                    ),
                  ])
                ]),
            pw.RichText(
                text: pw.TextSpan(children: [
              pw.TextSpan(
                  text: '\nPlease ensure all checks are payable to the ',
                  style: pw.TextStyle(fontSize: 28)),
              pw.TextSpan(
                  text:
                      'ADAM FAMILY \n                                             TRUST ',
                  style: pw.TextStyle(
                      fontSize: 25, fontStyle: pw.FontStyle.italic)),
            ]))
          ])));
  return pdf.save();
}
