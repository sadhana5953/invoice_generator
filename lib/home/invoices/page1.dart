import 'package:flutter/material.dart';

class invoicePage1 extends StatefulWidget {
  const invoicePage1({super.key});

  @override
  State<invoicePage1> createState() => _invoicePage1State();
}

class _invoicePage1State extends State<invoicePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'Invoices',
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: Column(
        children: List.generate(
            itemList.length,
            (index) => GestureDetector(
                  onTap: () {
                    title = listOfInvoice[index].Category.toString();
                    customer = listOfInvoice[index].Name.toString();
                    address = listOfInvoice[index].Add.toString();
                    if (index == 0) {
                      for (int i = 0; i < invoice1List.length; i++) {
                        items.add(invoice1List[i].name.toString());
                        price.add(invoice1List[i].price.toString());
                        total = total + invoice1List[i].price!;
                      }
                    } else if (index == 1) {
                      for (int i = 0; i < invoice2List.length; i++) {
                        items.add(invoice2List[i].name.toString());
                        price.add(invoice2List[i].price.toString());
                        total = total + invoice2List[i].price!;
                      }
                    } else if (index == 2) {
                      for (int i = 0; i < invoice3List.length; i++) {
                        items.add(invoice3List[i].name.toString());
                        price.add(invoice3List[i].price.toString());
                        total = total + invoice3List[i].price!;
                      }
                    }
                    Navigator.of(context).pushNamed('/page');
                  },
                  child: ListTile(
                    title: Text(
                      '${listOfInvoice[index].Category.toString()}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${listOfInvoice[index].Name.toString()}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    trailing: Text(
                      '\$${check[index]}',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                )),
      ),
    );
  }
}

String title = '';
String customer = '';
String address = '';

class customerModel {
  String? Name;
  String? Add;
  String? Category;

  customerModel({this.Name, this.Add, this.Category});
}

List<customerModel> listOfInvoice = [
  customerModel(
      Name: 'David Thomas',
      Add: '123 Fake St\r\nBermuda Triangle',
      Category: 'Create and deploy software package'),
  customerModel(
      Name: 'Michael Ambiguous',
      Add: '82 Unsure St\r\nBaggle Palace',
      Category: 'Provide remote support after lunch'),
  customerModel(
      Name: 'Marty McDanceFace',
      Add: '55 Dancing Parade\r\nDance Place',
      Category: 'Create software to teach robots how to dance'),
];
List itemList = [
  invoice1List,
  invoice2List,
  invoice3List,
];
List<InvoiceModel> invoice1List = [
  InvoiceModel(
    name: 'Technical Engagement',
    price: 120.00,
  ),
  InvoiceModel(
    name: 'Deployment Assistance',
    price: 200.00,
  ),
  InvoiceModel(
    name: 'Develop Software Solution',
    price: 3020.45,
  ),
  InvoiceModel(
    name: 'Produce Documentation',
    price: 840.50,
  ),
];
List<InvoiceModel> invoice2List = [
  InvoiceModel(
    name: 'Professional Advice',
    price: 100.00,
  ),
  InvoiceModel(
    name: 'Lunch Bill',
    price: 43.55,
  ),
  InvoiceModel(
    name: 'Remote Assistance',
    price: 50.00,
  ),
];
List<InvoiceModel> invoice3List = [
  InvoiceModel(
    name: 'Program the robots',
    price: 400.50,
  ),
  InvoiceModel(
    name: 'Find tasteful dance moves \nfor the robots',
    price: 80.55,
  ),
  InvoiceModel(
    name: 'General quality assurance',
    price: 80.00,
  ),
];

class InvoiceModel {
  String? name;
  String? category;
  double? price;

  InvoiceModel({this.name, this.price, this.category});
}

List items = [];
List price = [];
double total = 0;
List check = [4180.95, 193.55, 561.05];
