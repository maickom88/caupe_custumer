enum TypeEvaluetion { liked, unliked }

extension ConvertEvaluetion on TypeEvaluetion {
  String convertEvaluetion() {
    switch (this) {
      case TypeEvaluetion.liked:
        return 'LIKED';
      default:
        return 'UNLIKE';
    }
  }
}
