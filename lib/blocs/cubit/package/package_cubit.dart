// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';
import 'package:rsi/router/router_constants.dart';

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final Repository repository = new Repository();
  PackageCubit()
      : super(const PackageState(packageToOrder: null, projectToOrder: null));

  init(ProjectDetail projectToOrder) {
    emit(PackageState(projectToOrder: projectToOrder, packageToOrder: null));
  }

  Future<void> fetchPackages() async {
    emit(state.copyWith(status: PackageStatus.loading));
    try {
      final tuple2_numOfPackage_listOfPackage =
          await repository.fetchPackages(state.projectToOrder!.id!);
      final numOfPackage = tuple2_numOfPackage_listOfPackage.item1;
      final listOfPackage = tuple2_numOfPackage_listOfPackage.item2;
      emit(state.copyWith(
        status: PackageStatus.success,
        numOfPackages: numOfPackage,
        packages: listOfPackage,
      ));
    } catch (e) {
      emit(state.copyWith(status: PackageStatus.failure));
    }
  }

  chooseThePackage(BuildContext context, Package packageToOrder) async {
    emit(state.copyWith(status: PackageStatus.loading));
    try {
      emit(state.copyWith(
        status: PackageStatus.selected,
        packageToOrder: packageToOrder,
      ));
      Navigator.pushNamed(context, cartRoute);
    } catch (e) {
      emit(
        state.copyWith(status: PackageStatus.failure),
      );
    }
  }
}
