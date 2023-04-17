import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page/vertical_view.dart';
import 'home_page/horizontal_view.dart';
import 'data_manager.dart';
import 'data_model.dart';

void main() => runApp(Stylish());

class Stylish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => ApiService(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return HorizontalView(context);
            } else {
              return VerticalView();
            }
          },
        ),
      ),
    );
  }
}

class HomePageHeaderRow extends StatefulWidget {
  @override
  State<HomePageHeaderRow> createState() => _HomePageHeaderRowState();
}

class _HomePageHeaderRowState extends State<HomePageHeaderRow> {
  final apiService = ApiService();

  List<Product> girlDatas = [];
  @override
  void initState() {
    super.initState();
    apiService.fetchAllProducts('women').then((results) {
      setState(() {
        girlDatas = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: createRowContainer(),
    );
  }
}

List<Widget> createRowContainer() {
  List<Widget> containers = [];
  for (int i = 0; i < 5; i++) {
    containers.add(Container(
      height: 160,
      width: 250,
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              'https://a.cdn-hotels.com/gdcs/production87/d1048/4ed1a1e8-afa7-4640-b8ca-d1d6ccbb54c1.jpg'),
        ),
      ),
    ));
    containers.add(
      const SizedBox(
        height: 5,
      ),
    );
  }
  return containers;
}
