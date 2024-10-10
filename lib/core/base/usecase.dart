abstract class Usecase<T, Params> {
  Future<T> execute(Params params);
}
