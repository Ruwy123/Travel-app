import 'package:equatable/equatable.dart';

class CategoryEntities extends Equatable {
  final String name;
  final String docid;
  final bool isfeatured;
  final String id;

  CategoryEntities(
      {required this.name,
      required this.docid,
      required this.isfeatured,
      required this.id});

  @override
  List<Object?> get props => [name, docid, isfeatured, id];
}
