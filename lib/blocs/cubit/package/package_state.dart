part of 'package_cubit.dart';

enum PackageStatus {
  initial,
  loading,
  selected,
  failure,
  success,
}

class PackageState extends Equatable {
  final PackageStatus status;
  final ProjectDetail? projectToOrder;
  final int? numOfPackage;
  final List<Package>? packages;
  final Package? packageToOrder;
  const PackageState({
    this.status = PackageStatus.initial,
    required this.projectToOrder,
    required this.packageToOrder,
    this.numOfPackage,
    this.packages,
  });
  PackageState copyWith({
    PackageStatus? status,
    ProjectDetail? projectToOrder,
    Package? packageToOrder,
    List<Package>? packages,
    int? numOfPackages,
  }) {
    return PackageState(
      status: status ?? this.status,
      projectToOrder: projectToOrder ?? this.projectToOrder,
      packageToOrder: packageToOrder,
      numOfPackage: numOfPackage ?? this.numOfPackage,
      packages: packages ?? this.packages,
    );
  }

  @override
  List<Object?> get props =>
      [status, projectToOrder, packageToOrder, numOfPackage, packages];
}
