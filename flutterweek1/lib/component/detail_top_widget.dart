import 'package:flutter/material.dart';
import 'package:flutterweek1/component/amount_btn.dart';
import 'package:flutterweek1/component/colorbox_btn.dart';
import 'package:flutterweek1/component/underline_view.dart';
import 'package:flutterweek1/data_model.dart';

class detailTopWidget extends StatefulWidget {
  final Product item;
  final double underlineWidth;
  const detailTopWidget(
      {super.key, required this.item, required this.underlineWidth});

  @override
  State<detailTopWidget> createState() => _detailTopWidgetState();
}

class _detailTopWidgetState extends State<detailTopWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.item.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(widget.item.id.toString()),
        SizedBox(
          height: 15,
        ),
        Text(
          'NT\$ ' + (widget.item.price).toString(),
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        HorizontalLine(
          dashedWidth: widget.underlineWidth,
          dashedHeight: 1,
          color: Color.fromARGB(255, 160, 164, 166),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: createColorBtn(widget.item),
          // children: [
          //   Text('顏色｜'),
          //   buildBtnWithColorBox(Colors.green),
          //   SizedBox(
          //     width: 5,
          //   ),
          //   buildBtnWithColorBox(Colors.blue)
          // ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: createSizeBtnRow(widget.item),
        ),
        SizedBox(
          height: 25,
        ),
        amountAddBtn(
          item: widget.item,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 45,
          width: widget.underlineWidth,
          child: TextButton(
            onPressed: () {},
            child: Text(
              '請選擇尺寸',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            style: TextButton.styleFrom(
              shape: BeveledRectangleBorder(),
              backgroundColor: Color.fromARGB(255, 75, 60, 60),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.item.note,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          widget.item.description,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '產地：' + widget.item.place,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '材質：' + widget.item.texture,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          '洗滌方式：' + widget.item.wash,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  List<Widget> createSizeBtnRow(Product item) {
    List<Widget> sizeBtnRow = [];
    for (int i = 0; i < item.sizes.length; i++) {
      sizeBtnRow.add(
        SizedBox(
          height: 25,
          width: 40,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = i;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: selectedIndex == i ? Colors.blue : Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
            child: Text(
              item.sizes[i],
              style: TextStyle(fontSize: 8),
            ),
          ),
        ),
      );
      sizeBtnRow.add(SizedBox(
        width: 5,
      ));
    }
    return sizeBtnRow;
  }

  List<Widget> createColorBtn(Product item) {
    List<Widget> colorBtnRow = [];
    // Color color = Color(int.parse("0xFF" + colorCode));
    for (int i = 0; i < item.colors.length; i++) {
      Color color = Color(int.parse("0xFF" + item.colors[i].code));

      colorBtnRow.add(
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(color: color),
          child: InkWell(
            onTap: () {
              print('pressssss');
            },
            child: Text(''),
          ),
        ),
      );
      colorBtnRow.add(SizedBox(
        width: 5,
      ));
    }
    return colorBtnRow;
  }
}
