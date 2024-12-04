import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

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
}
