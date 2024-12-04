// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Name': name,
      'docid': docid,
      'Isfeatured': isfeatured,
      'Id': '',
    };
  }

  static CategoryModel empty() =>
      CategoryModel(name: '', docid: '', isfeatured: false, id: '');

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'docid': docid,
      'isfeatured': isfeatured,
      'id': id,
    };
  }

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(
          name: data['Name'] ?? '',
          docid: data['Id'] ?? '',
          isfeatured: data['Isfeatured'] ?? false,
          id: document.id);
    } else {
      return CategoryModel.empty();
    }
  }
}
