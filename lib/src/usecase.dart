/// An abstract class that represents an asynchronous use case in clean architecture.
///
/// [Input] is the type of parameters required by the use case. Use [void] for
/// use cases that don't require input.
/// [Output] is the type returned by the use case.
///
/// It is recommended to use a Result type (e.g. from `result_dart` package)
/// as the [Output] to handle success and failure cases explicitly.
///
/// Example with input:
/// ```dart
/// class GetUser implements UseCase<GetUserParams, Result<User, Exception>> {
///   @override
///   Future<Result<User, Exception>> call(GetUserParams input) async {
///     // Implementation
///   }
/// }
///
/// // Usage (callable syntax)
/// final result = await getUser(GetUserParams(id: '123'));
/// ```
///
/// Example without input:
/// ```dart
/// class GetCurrentUser implements UseCase<void, Result<User, Exception>> {
///   @override
///   Future<Result<User, Exception>> call(void input) async {
///     // Implementation
///   }
/// }
///
/// // Usage (pass null for void input)
/// final result = await getCurrentUser(null);
/// ```
abstract interface class UseCase<Input, Output> {
  /// Executes the use case with the given [input].
  ///
  /// Returns a [Future] containing the [Output].
  Future<Output> call(Input input);
}

/// An abstract class that represents a synchronous use case in clean architecture.
///
/// [Input] is the type of parameters required by the use case. Use [void] for
/// use cases that don't require input.
/// [Output] is the type returned by the use case.
///
/// It is recommended to use a Result type (e.g. from `result_dart` package)
/// as the [Output] to handle success and failure cases explicitly.
///
/// Example with input:
/// ```dart
/// class ValidateEmail implements UseCaseSync<String, Result<bool, Exception>> {
///   @override
///   Result<bool, Exception> call(String input) {
///     // Implementation
///   }
/// }
///
/// // Usage (callable syntax)
/// final result = validateEmail('test@example.com');
/// ```
///
/// Example without input:
/// ```dart
/// class GetCachedUser implements UseCaseSync<void, Result<User, Exception>> {
///   @override
///   Result<User, Exception> call(void input) {
///     // Implementation
///   }
/// }
///
/// // Usage (pass null for void input)
/// final result = getCachedUser(null);
/// ```
abstract interface class UseCaseSync<Input, Output> {
  /// Executes the use case with the given [input].
  ///
  /// Returns the [Output].
  Output call(Input input);
}
