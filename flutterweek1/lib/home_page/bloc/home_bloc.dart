import 'package:bloc/bloc.dart';
import 'package:flutterweek1/data_manager.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterweek1/data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService _apiService;
  HomeBloc(this._apiService) : super(HomeLoadingState()) {
    on<LoadItemEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final womenDatas = await _apiService.fetchAllProducts('women');
        final menDatas = await _apiService.fetchAllProducts('men');
        final accessoriesDatas =
            await _apiService.fetchAllProducts('accessories');
        emit(HomeLoadedState(womenDatas, menDatas, accessoriesDatas));
      } catch (e) {}
      print('123123123');
      // emit(HomeLoadedState());
    });
  }
}
