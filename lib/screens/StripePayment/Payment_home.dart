import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/StripePayment/existing-cards.dart';
import 'package:parkit_com/services/StripePayment/payment-service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../confirmPayment_screen.dart';

class PaymentHomePage extends StatefulWidget {
  PaymentHomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<PaymentHomePage> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExistingCardsPage()),
        );
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '200', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration: Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));

    if (response.message == 'Transaction successful') {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ConfirmPayment()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 220, 20, 0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: Colors.red);
                  text = Text('Payment with New Card');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: Colors.red);
                  text = Text('Payment with Existing card');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: theme.primaryColor,
                ),
            itemCount: 2),
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
