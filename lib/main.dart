import 'package:flutter/material.dart';
import 'package:invoice_generator/home/invoices/page1.dart';
import 'package:invoice_generator/home/invoices/page2.dart';
import 'package:invoice_generator/home/invoices/pdf.dart';
void main()
{
  return runApp(invoice(),);
}

class invoice extends StatelessWidget {
  const invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => invoicePage1(),
        '/page':(context) => invoicePage2(),
        '/pdf':(context) => Pdf(),
      },
    );
  }
}
