import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/repository/medicine_repository.dart';


part 'medicine_list_event.dart';
part 'medicine_list_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc({required this.medicineRepository}) : super(MedicineLoading()) {
    on<MedicineStarted>(_onStarted);
    on<MedicineReloaded>(_onMedicineReloaded);
    // on<MedicineItemRemoved>(_onItemRemoved);
  }

  final MedicineRepository medicineRepository;

  void _onStarted(MedicineStarted event, Emitter<MedicineState> emit) async {
    emit(MedicineLoading());
    try {
      final items = await medicineRepository.loadSuggestedMedicines();
      emit(MedicineLoaded(medicines: items));
    } catch (_) {
      emit(MedicineError());
    }
  }

  void _onMedicineReloaded(MedicineReloaded event, Emitter<MedicineState> emit) async {
    final state = this.state;
    if (state is MedicineLoaded) {
      try {
        var newMedicines = await medicineRepository.loadMedicines(event.categoryId);
        emit(MedicineLoaded(medicines: newMedicines));
      } catch (_) {
        emit(MedicineError());
      }
    }
  }
}
