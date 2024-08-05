enum TaskStatus {
  preparing,
  ready,
  inProgress,
  testing,
  done;

  factory TaskStatus.fromIndex(int index) {
    return switch (index) {
      0 => TaskStatus.preparing,
      1 => TaskStatus.ready,
      2 => TaskStatus.inProgress,
      3 => TaskStatus.testing,
      4 => TaskStatus.done,
      _ => TaskStatus.preparing,
    };
  }

  /// Even thought the enum object has a property called 'index' already,
  /// an override is prefered to make the implementation is safer an preserve
  /// the text precedence in a timeline (eg. 'ready' should be before
  /// 'inProgress').
  int getIndex() {
    return switch (this) {
      TaskStatus.preparing => 0,
      TaskStatus.ready => 1,
      TaskStatus.inProgress => 2,
      TaskStatus.testing => 3,
      TaskStatus.done => 4,
    };
  }
}
