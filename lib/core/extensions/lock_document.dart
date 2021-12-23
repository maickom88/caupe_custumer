extension LockDocument on String {
  String lockDocument() {
    final list = this.split('-').last;
    return 'XXX.XXX.XXX-$list';
  }
}

extension Lock on String {
  String lock() {
    final email = this.split('@').first;
    int numSpace = email.length - 3;
    String result = this.replaceRange(0, numSpace, '*' * numSpace);
    return result;
  }
}
