class MyResponse<T> {
  MyResponse._();
  factory MyResponse.success(T data) = Success<T>;

  factory MyResponse.error(String message) = Error<T>;
}

class Success<T> extends MyResponse<T> {
  final T value;
  Success(this.value) : super._();
}

class Error<T> extends MyResponse<T> {
  final String message;

  Error(this.message) : super._();
}
