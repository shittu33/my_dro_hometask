part of 'medicine_list_bloc.dart';

@immutable
abstract class MedicineEvent extends Equatable {
  const MedicineEvent();
}

class MedicineStarted extends MedicineEvent {
  @override
  List<Object> get props => [];
}

class MedicineReloaded extends MedicineEvent {
  const MedicineReloaded(this.categoryId);

  final int categoryId;

  @override
  List<Object> get props => [categoryId];
}

class MedicineSearch extends MedicineEvent {
  const MedicineSearch(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

