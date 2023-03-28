// import 'dart:js';

import 'package:flutter/material.dart';

void main() => runApp(Stylish());

class Stylish extends StatefulWidget {
  @override
  State<Stylish> createState() => _StylishState();
}

class _StylishState extends State<Stylish> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
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

Widget VerticalView() {
  return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            height: 70,
            width: 200,
            child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 180,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: createRowContainer(),
                  ),
                ),
              ),
              Expanded( 
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),                  
                    child: Column(
                      children: [
                        ExpansionTile(
                          title: Center(
                            child: 
                            Text('女裝', style: TextStyle(
                              color: Colors.black
                            ),),),
                          children: createContainerWithPic(),
                        ),ExpansionTile(
                          title: Center(child: Text('男裝'),),
                          children: createContainerWithPic(),
                        ),ExpansionTile(
                          title: Center(child: Text('配件'),),
                          children: createContainerWithPic(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }


Widget HorizontalView(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            height: 70,
            width: 200,
            child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 180,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: createRowContainer(),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   SizedBox(width: 10,),
                   Expanded(
                     child: GestureDetector(
                      onTap: () {
                       Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SecondPage()),
                       );
                     },
                       child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              child: Text('123'),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: createContainerWithPic(),
                                ),
                              ),
                            )
                          ],                    
                        ),
                       ),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Expanded(
                     child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SecondPage(),)
                          );
                      },
                       child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              child: Text('123'),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: createContainerWithPic(),
                                ),
                              ),
                            )
                          ],                    
                        ),                   
                       ),
                     ),
                   ),
                   SizedBox(width: 10,),
                   Expanded(
                     child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SecondPage(),)
                        );
                      },
                       child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              child: Text('123'),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: createContainerWithPic(),
                                ),
                              ),
                            )
                          ],                    
                        ),
                       ),
                     ),
                   ),
                   SizedBox(width: 10,),
                  ],
                )
              )
            ],
          ),
        ),
      );
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
      SizedBox(height: 5,),
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
             ),
          height: 100,
          child: Row(
            children: [
              Container(
                height: 130,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), 
                    bottomLeft: Radius.circular(10)
                    ),
                  child: FittedBox(
                    child: Image.network(
                    'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                     ),
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
      SizedBox(height: 5,),
    );
  }
  return containers;
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            height: 70,
            width: 200,
            child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'
            ),
          ),
        ),
    );
  }

}

