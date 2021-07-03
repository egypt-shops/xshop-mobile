import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:xshop_mobile/screens/Cashier/qrscanner.dart';
import 'package:xshop_mobile/screens/data_entry/main_of_data_entry.dart';
import 'package:xshop_mobile/screens/data_entry/product_creating.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  // make object from scanner
  QRViewScanner _qrViewScanner = QRViewScanner();
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
          title: Text(
            "new order",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                onPressed: () {})
          ]),
      stickyFrontLayer: false,
      frontLayer: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(icon: Icon(Icons.qr_code)),
                Tab(icon: Icon(Icons.add_circle)),
              ],
            ),
            body: TabBarView(
              children: [
                Center(child: _qrViewScanner),
                ProductCreatingPage(),
              ],
            ),
          )),
      backLayer: Center(
        child: Text("list of added products"),
      ),
    );
  }
}
