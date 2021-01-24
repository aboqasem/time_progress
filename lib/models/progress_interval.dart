import 'package:flutter/foundation.dart';

class ProgressInterval {
  final DateTime begin;
  final DateTime end;

  ProgressInterval({
    @required this.begin,
    @required this.end,
  })  : assert(begin != null),
        assert(end != null);
}
