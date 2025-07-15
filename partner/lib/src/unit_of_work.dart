class UnitOfWork {
  List<Map<String, dynamic>> sources = [];

  void add(Map<String, dynamic> source) {
    sources.add(source);
  }

}

mixin Source {
  String sourceId();
  Map<String, dynamic> toMap();
}