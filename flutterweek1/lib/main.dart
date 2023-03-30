
import 'package:flutter/material.dart';
import 'vertical_view.dart';
import 'horizontal_view.dart';
import 'data_model.dart';

void main() => runApp(Stylish());

class Stylish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            return HorizontalView(context);
          } else {
            return VerticalView();
          }
        },
      ),
    );
  }
}

List<Widget> createRowContainer() {
  List<Widget> containers = [];
  for (int i = 0; i < 10; i++) {
    containers.add(
      Container(
        height: 160,
        width: 250,
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: FittedBox(
          fit: BoxFit.fill,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
              ),
          ),
        ),
      )
    );
    containers.add(
      const SizedBox(height: 5,),
    );
  }
  return containers;
}

List<Widget> createContainerWithPic() {
  List<Widget>containers = [];
  for (int i = 0; i < 5; i++) {
    containers.add(
        Container(
          decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
             ),
          height: 100,
          child: Row(
            children: [
              SizedBox(
                height: 130,
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), 
                    bottomLeft: Radius.circular(10)
                    ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                    'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                     ),
                    ),
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('1231233'),
                  Text('4645644')
                ],
              )
            ],
          ),
        ),
      // ),
    );
    containers.add(
      const SizedBox(height: 5,),
    );
  }
  return containers;
}

