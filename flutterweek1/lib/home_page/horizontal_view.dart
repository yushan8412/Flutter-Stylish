import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweek1/data_model.dart';
import 'package:flutterweek1/home_page/bloc/home_bloc.dart';
import '../main.dart';
import 'view/listview_withpic.dart';
import '../data_manager.dart';
import 'package:flutterweek1/cart_page/cart_page.dart';

class HorizontalView extends StatelessWidget {
  const HorizontalView(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(RepositoryProvider.of<ApiService>(context))
        ..add(LoadItemEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 70,
            width: 200,
            child: Image.network(
                'https://cdn.discordapp.com/attachments/1083197828467265564/1087723351893610516/Image_Logo02.png'),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage()));
                },
                child: const Icon(
                  Icons.shopping_cart,
                  size: 35.0,
                  color: Color.fromARGB(255, 171, 171, 171),
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is HomeLoadedState) {
              List<Product> womenItems = state.womenDatas;
              List<Product> menItems = state.menDatas;
              List<Product> accessoriesItems = state.accessoriesDatas;
              return Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: HomePageHeaderRow(),
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                                child: Text('女裝'),
                              ),
                              Expanded(child: createlistView(womenItems)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                                child: Text('男裝'),
                              ),
                              Expanded(child: createlistView(menItems)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                                child: Text('飾品'),
                              ),
                              Expanded(child: createlistView(accessoriesItems)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ))
                  ],
                ),
              );
            }
            return Container(
              decoration: const BoxDecoration(color: Colors.blue),
            );
          },
        ),
      ),
    );
  }
}
