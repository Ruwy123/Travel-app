import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class Catrep {
  Future<Either> getCategories();
}
