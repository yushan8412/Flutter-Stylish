import 'package:flutter/material.dart';
import 'package:flutterweek1/data_model.dart';
import 'data_model.dart';

class SecondPage extends StatelessWidget {
  
  final itemData item;
  const SecondPage({ required this.item });

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 300,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        item.image
                        ),
                    ),
                  ),
                  SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text('Uniqlo 特級輕羽絨', 
                        style: TextStyle(
                          fontSize: 22
                          ),
                          ),
                        Text(item.name)
                      ],
                    )
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Column(
                  children: [
                    Text('123123')
                  ],)
                ),
            ],
          ),
        ),
    );
  }

}