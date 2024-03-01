// extension as overloading (add function to class )

// extension on String

import 'package:mvvm/data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

//================================================================================================================



// extension on int
extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

//================================================================================================================
