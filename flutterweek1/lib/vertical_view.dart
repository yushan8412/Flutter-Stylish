
import 'package:flutter/material.dart';
import 'main.dart';
import 'data_model.dart';

class VerticalView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Widget VerticalView() {
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

  }
