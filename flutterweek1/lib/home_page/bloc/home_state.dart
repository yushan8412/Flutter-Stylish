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
  //womenDatas, menDatas, accessoriesDatas]
}
