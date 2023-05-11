import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterweek1/ar/arphoto.dart';
import 'package:flutterweek1/ar/earthpage.dart';
import 'package:flutterweek1/map_page/map_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _batteryLevel = 'Flutttttter';

  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => const MapSample()));
              },
              child: const Icon(
                Icons.map_outlined,
                size: 35.0,
                color: Color.fromARGB(255, 75, 76, 68),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get String'),
            ),
            Text(_batteryLevel),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EarthPage()));
              },
              child: const Text('Try AR'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PanoramaPage()));
              },
              child: const Text('Try AR2'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'issssss from $result  .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get string: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
