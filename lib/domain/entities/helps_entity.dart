import 'evaluetion_help_entity.dart';

class HelpsEntity {
  final String guid;
  final String title;
  final String description;
  final EvaluetionHelpEntity? evaluation;

  HelpsEntity({
    required this.guid,
    required this.title,
    required this.description,
    this.evaluation,
  });
}
