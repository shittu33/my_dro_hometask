part of 'medicine_category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  const CategoryLoaded(
      {this.categories = const [], required this.selectedCategory});

  final List<CategoryItem> categories;
  final CategoryItem selectedCategory;

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryState {
  @override
  List<Object> get props => [];
}
