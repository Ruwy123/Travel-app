import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:travellapp/lib/features/travel/data/Models/categories/category_model.dart';
import 'package:travellapp/lib/features/travel/presentation/widgets/categories.dart';

abstract class Categoriesfirebasservice {
  Future<Either> getCategories();
}

class Categoriesfirebaseimpl extends Categoriesfirebasservice {
  @override
  Future<Either> getCategories() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection('Categories').get();
      return right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return left(e);
    }
  }
//  var categories =
//           await FirebaseFirestore.instance.collection('Categories').get();
//       return right(categories.docs.map((e) => e.data()).toList());
//     } catch (e) {
//       return left(e);
}
