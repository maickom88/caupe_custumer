import '../../core/enums/type_days.dart';

class AvailableEntity {
  final String? guid;
  final List<TypeDay> days;
  final firstTime;
  final lastTime;

  AvailableEntity({
    this.guid,
    required this.days,
    required this.firstTime,
    required this.lastTime,
  });
}
