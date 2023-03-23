import 'package:flutter/material.dart';

void main() => runApp(Stylish());

class Stylish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Class Name",
      home: Scaffold(
      // return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: const EdgeInsets.fromLTRB(130, 15, 130, 15),
            child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          height: 150,
                          child: Image.network(
                            'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                            ),
                        ),
                      ),
                      Card(
                      child: Container(
                        height: 150,
                        child: Image.network(
                          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 150,
                        child: Image.network(
                          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                          ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 150,
                        child: Image.network(
                          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90)
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 150,
                        child: Image.network(
                          'https://image.cache.storm.mg/styles/smg-800x533-fp/s3/media/image/2016/03/28/20160328-024000_U6251_M142129_6df2.jpg?itok=4KQSoi0q'
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10, child: const DecoratedBox(decoration: BoxDecoration(color: Colors.pink)),),
              Expanded( //將畫面分割
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        itemCount: 15,
                        itemBuilder:(context, index) {
                          return 
                          // Padding(padding: const EdgeInsets.all(10));
                          Container(
                            
                            padding: const EdgeInsets.all(5),
                            color: Color.fromARGB(255, 244, 204, 217),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black, width: 5)
                            // ),
                            child: ListTile(
                              title: Center(child: Text('123123123'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}