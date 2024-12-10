import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:travellapp/lib/features/travel/domain/categories/entities/category.dart';

class CategoryModel extends CategoryEntities {
  CategoryModel(
      {required super.name,
      required super.docid,
      required super.isfeatured,
      required super.id});

  @override
  List<Object?> get props => [name, docid, isfeatured, id];
  //converting it to json

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'docid': docid,
      'Isfeatured': isfeatured,
      'Id': id,
    };
  }

  factory CategoryModel.fromFirestore(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      docid: map['docid'] as String,
      isfeatured: map['Isfeatured'] as bool,
      id: map['Id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryEntities.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntities toEntity() {
    return CategoryEntities(
        name: name, docid: docid, isfeatured: isfeatured, id: id);
  }
}
