class MemoryCache<T> {
  MemoryCache({this.ttl});
  final Duration? ttl;
  T? _value;
  DateTime? _ts;

  void set(T value) {
    _value = value;
    _ts = DateTime.now();
  }

  T? get() {
    if (_value == null) return null;
    if (ttl != null && _ts != null) {
      if (DateTime.now().difference(_ts!) > ttl!) {
        _value = null;
        _ts = null;
        return null;
      }
    }
    return _value;
  }
}
