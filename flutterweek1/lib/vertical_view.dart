import 'package:flutter/material.dart';
import 'main.dart';
import 'data_model.dart';
import 'component/expansiontile_list.dart';
import 'data_manager.dart';

class VerticalView extends StatefulWidget {
  const VerticalView({super.key});

  @override
  State<VerticalView> createState() => _VerticalViewState();
}

class _VerticalViewState extends State<VerticalView> {
  final apiService = ApiService();

  List<Product> womenDatas = [];
  List<Product> menDatas = [];
  List<Product> accessoriesDatas = [];

  @override
  void initState() {
    super.initState();
    Future.wait([
      apiService.fetchAllProducts('women'),
      apiService.fetchAllProducts('men'),
      apiService.fetchAllProducts('accessories'),
    ]).then((results) {
      setState(() {
        womenDatas = results[0];
        menDatas = results[1];
        accessoriesDatas = results[2];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 70,
          width: 200,
          child: Image.network(
              'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildHorizontalRow(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    children: [
                      buildExpansionTile('女裝', womenDatas),
                      buildExpansionTile('男裝', menDatas),
                      buildExpansionTile('配件', accessoriesDatas),
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

  Widget _buildHorizontalRow() {
    return Container(
      alignment: Alignment.center,
      height: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: HomePageHeaderRow(),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: createRowContainer(),
        // ),
      ),
    );
  }

  List<Widget> _createRowContainer() {
    List<Widget> rowContainers = [];
    for (int i = 0; i < 5; i++) {
      rowContainers.add(
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return rowContainers;
  }
}
