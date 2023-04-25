import 'package:flutter/material.dart';
import 'package:flutterweek1/cart_page/cart_page.dart';
import 'package:flutterweek1/data_model.dart';
import 'view/detail_bottom.dart';
import 'view/detail_top_widget.dart';
import 'package:flutterweek1/cart_page/cart_page.dart';

class SecondPage extends StatefulWidget {
  final Product item;

  const SecondPage({super.key, required this.item});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedIndex = -1;
  final tfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          height: 70,
          width: 200,
          child: Image.network(
            'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png',
            height: 100,
            width: 100,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 35.0,
                color: Color.fromARGB(255, 171, 171, 171),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  size.width >= 600
                      ? SizedBox(
                          height: 400,
                          width: 300,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.mainImage),
                          ),
                        )
                      : const SizedBox.shrink(),
                  size.width < 600
                      ? SizedBox(
                          height: 400,
                          width: 350,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.mainImage),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    width: 15,
                  ),
                  size.width >= 600
                      ? DetailTopWidget(
                          item: widget.item,
                          underlineWidth: 260,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              size.width < 600
                  ? SizedBox(
                      width: 350,
                      child: DetailTopWidget(
                        item: widget.item,
                        underlineWidth: 500,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20,
              ),
              size.width >= 600
                  ? SizedBox(
                      width: 570,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: createBottomDetailColum(widget.item),
                      ),
                    )
                  : const SizedBox.shrink(),
              size.width < 600
                  ? SizedBox(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: createBottomDetailColum(widget.item),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
