import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/screens/medicine_category/medicine_category.dart';
import 'package:pharmacy/presentation/screens/medicine_list/medicine_list.dart';
import 'package:pharmacy/repository/medicine_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.medicineRepository}) : super(key: key);

  final MedicineRepository medicineRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MedicineBloc(
            medicineRepository: medicineRepository,
          )..add(MedicineStarted()),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            medicineRepository: medicineRepository,
          )..add(CategoryStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Pharmacy',
        routes: {
          AppRoutes.medicineList: (ctx) => const MedicineListPage(),
          AppRoutes.medicineCategory: (ctx) => const CategoryListScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.medicineList,
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
      ),
    );
  }
}
