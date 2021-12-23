enum TypeDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension ConvertStringInTypeDay on String {
  TypeDay toTypeDayInString() {
    switch (this) {
      case 'Segunda':
        return TypeDay.monday;
      case 'Terça':
        return TypeDay.tuesday;
      case 'Quarta':
        return TypeDay.wednesday;
      case 'Quinta':
        return TypeDay.thursday;
      case 'Sexta':
        return TypeDay.friday;
      case 'Sabádo':
        return TypeDay.saturday;
      case 'Domingo':
      default:
        return TypeDay.sunday;
    }
  }
}

extension ConvertTypeDayInString on TypeDay {
  String dayInString() {
    switch (this) {
      case TypeDay.monday:
        return 'Segunda';
      case TypeDay.tuesday:
        return 'Terça';
      case TypeDay.wednesday:
        return 'Quarta';
      case TypeDay.thursday:
        return 'Quinta';
      case TypeDay.friday:
        return 'Sexta';
      case TypeDay.saturday:
        return 'Sabádo';
      case TypeDay.sunday:
      default:
        return 'Domingo';
    }
  }

  String dayInStringAbbreviated() {
    switch (this) {
      case TypeDay.monday:
        return 'SEG';
      case TypeDay.tuesday:
        return 'TER';
      case TypeDay.wednesday:
        return 'QUA';
      case TypeDay.thursday:
        return 'QUI';
      case TypeDay.friday:
        return 'SEX';
      case TypeDay.saturday:
        return 'SAB';
      case TypeDay.sunday:
      default:
        return 'DOM';
    }
  }
}
