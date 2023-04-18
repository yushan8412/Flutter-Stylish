import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweek1/home_page/bloc/home_bloc.dart';
import '../main.dart';
import '../data_model.dart';
import '../component/expansiontile_list.dart';
import '../data_manager.dart';

class VerticalView extends StatelessWidget {
  const VerticalView({super.key});

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
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(decoration: BoxDecoration(color: Colors.amber));
            }
            if (state is HomeLoadedState) {
              List<Product> womenItems = state.womenDatas;
              List<Product> menItems = state.menDatas;
              List<Product> accessoriesItems = state.accessoriesDatas;
              return Center(
                child: Column(
                  children: <Widget>[
                    _buildHorizontalRow(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Column(
                            children: [
                              buildExpansionTile('女裝', womenItems),
                              buildExpansionTile('男裝', menItems),
                              buildExpansionTile('配件', accessoriesItems),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(color: Colors.grey),
            );
          },
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
      ),
    );
  }
}
