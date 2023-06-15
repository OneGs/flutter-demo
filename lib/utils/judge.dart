bool isEmpty<T>(T data) {
  if (data == null) return false;

  if (data is String) {
    return data == '';
  }

  return false;
}
