import 'package:flutter/material.dart';
import 'package:flutterweek1/detail_page/view/amount_btn.dart';
import 'package:flutterweek1/detail_page/view/underline_view.dart';
import 'package:flutterweek1/data_model.dart';

class DetailTopWidget extends StatefulWidget {
  final Product item;
  final double underlineWidth;
  const DetailTopWidget(
      {super.key, required this.item, required this.underlineWidth});

  @override
  State<DetailTopWidget> createState() => _DetailTopWidgetState();
}

class _DetailTopWidgetState extends State<DetailTopWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.item.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(widget.item.id.toString()),
        const SizedBox(
          height: 15,
        ),
        Text(
          'NT\$ ${widget.item.price}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        HorizontalLine(
          dashedWidth: widget.underlineWidth,
          dashedHeight: 1,
          color: const Color.fromARGB(255, 160, 164, 166),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: createColorBtn(widget.item),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: createSizeBtnRow(widget.item),
        ),
        const SizedBox(
          height: 25,
        ),
        AmountAddBtn(
          item: widget.item,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 45,
          width: widget.underlineWidth,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const BeveledRectangleBorder(),
              backgroundColor: const Color.fromARGB(255, 75, 60, 60),
            ),
            child: const Text(
              '請選擇尺寸',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.item.note,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          widget.item.description,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '產地：${widget.item.place}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '材質：${widget.item.texture}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '洗滌方式：${widget.item.wash}',
          style: const TextStyle(fontSize: 16),
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
              style: const TextStyle(fontSize: 8),
            ),
          ),
        ),
      );
      sizeBtnRow.add(const SizedBox(
        width: 5,
      ));
    }
    return sizeBtnRow;
  }

  List<Widget> createColorBtn(Product item) {
    List<Widget> colorBtnRow = [];
    for (int i = 0; i < item.colors.length; i++) {
      Color color = Color(int.parse("0xFF${item.colors[i].code}"));

      colorBtnRow.add(
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(color: color),
          child: InkWell(
            onTap: () {},
            child: const Text(''),
          ),
        ),
      );
      colorBtnRow.add(const SizedBox(
        width: 5,
      ));
    }
    return colorBtnRow;
  }
}
