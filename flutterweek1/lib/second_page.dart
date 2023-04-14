import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'component/amount_btn.dart';
import 'component/underline_view.dart';
import 'component/detail_bottom.dart';
import 'component/colorbox_btn.dart';
import 'component/detail_top_widget.dart';

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
        title: Container(
          height: 70,
          width: 200,
          child: Image.network(
            'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png',
            height: 100,
            width: 100,
          ),
        ),
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
                      ? Container(
                          height: 400,
                          width: 300,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.mainImage),
                          ),
                        )
                      : SizedBox.shrink(),
                  size.width < 600
                      ? Container(
                          height: 400,
                          width: 350,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(widget.item.mainImage),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    width: 15,
                  ),
                  size.width >= 600
                      ? detailTopWidget(
                          item: widget.item,
                          underlineWidth: 260,
                        )
                      : SizedBox.shrink(),
                ],
              ),
              size.width < 600
                  ? Container(
                      width: 350,
                      child: detailTopWidget(
                        item: widget.item,
                        underlineWidth: 500,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20,
              ),
              size.width >= 600
                  ? Container(
                      width: 570,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: createBottomDetailColum(widget.item),
                      ),
                    )
                  : SizedBox.shrink(),
              size.width < 600
                  ? Container(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: createBottomDetailColum(widget.item),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
