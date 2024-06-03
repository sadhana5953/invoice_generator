import 'package:flutter/material.dart';
import 'package:invoice_generator/home/invoices/page1.dart';

class invoicePage2 extends StatefulWidget {
  const invoicePage2({super.key});

  @override
  State<invoicePage2> createState() => _invoicePage2State();
}

class _invoicePage2State extends State<invoicePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            items.clear();
            price.clear();
            total = 0;
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          '${title}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.grey.shade300, width: 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Customer',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${customer}',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              '\nInvoice Items',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ...List.generate(
                items.length,
                (index) => ListTile(
                      subtitle: Text(
                        '${items[index]}',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      trailing: Text(
                        '${price[index]}',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
                Text('$total',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 30,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tax = total * 10 / 100;
          amt = total + tax;
          Navigator.of(context).pushNamed('/pdf');
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.picture_as_pdf,
          color: Colors.white,
        ),
      ),
    );
  }
}

double tax = 0;
double amt = 0;
