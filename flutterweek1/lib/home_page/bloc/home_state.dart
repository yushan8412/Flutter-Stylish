part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  //這個 state 裡面會有的物件
  List<Product> womenDatas = [];
  List<Product> menDatas = [];
  List<Product> accessoriesDatas = [];
  HomeLoadedState(this.womenDatas, this.menDatas, this.accessoriesDatas);

  @override
  List<Object?> get props => [];
  //當又送出一樣的 Event 時，要吐出 state 的時候會比較這個 props list 裡面的物件是否相同，
  //若相同則不需要重劃 UI，
  //所以在選擇顏色尺寸時才會看到差異
}
