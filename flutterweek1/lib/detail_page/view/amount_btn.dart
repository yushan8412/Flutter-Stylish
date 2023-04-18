import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';

class AmountAddBtn extends StatefulWidget {
  final Product item;
  const AmountAddBtn({super.key, required this.item});

  @override
  State<AmountAddBtn> createState() => _AmountAddBtnState();
}

class _AmountAddBtnState extends State<AmountAddBtn> {
  int selectedAmount = 1;
  // textField 裡面的文字

  final tfController = TextEditingController();

  @override
  void dispose() {
    tfController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    tfController.text = selectedAmount.toString();
    tfController.text = widget.item.variants[0].stock.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('數量｜'),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 20,
          height: 20,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: IconButton(
              color: Colors.amber, // 更改按鈕背景色
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onPressed: () {
                selectedAmount -= 1;
                _updateText(); //呼叫 setState() 通知物件狀態改變
              },
              iconSize: 15,
              padding: const EdgeInsets.all(2),
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 135,
          height: 25,
          child: TextField(
            controller: tfController,
            textAlign: TextAlign.center, // 設置文字置中
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 10.0), // 設置內邊距
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 20,
          height: 20,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: IconButton(
              color: Colors.amber, // 更改按鈕背景色
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onPressed: () {
                selectedAmount += 1;
                _updateText();
                // apiService.fetchAllProducts();
              },
              iconSize: 15,
              padding: const EdgeInsets.all(2),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        )
      ],
    );
  }

  void _updateText() {
    setState(() {
      //寫入畫面有需要更新的部分
      tfController.text = selectedAmount.toString();
    });
  }
}
