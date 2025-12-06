# usecase_interface

A simple library that introduces a UseCase interface for clean architecture patterns.

## Features

- `UseCase<Input, Output>` — for asynchronous use cases
- `UseCaseSync<Input, Output>` — for synchronous use cases
- Minimal API with no dependencies

## Installation

```yaml
dependencies:
  usecase_interface: ^1.0.0
```

## Usage

### Async UseCase with input

```dart
import 'package:usecase_interface/usecase_interface.dart';

class GetUser implements UseCase<GetUserParams, Result<User, Exception>> {
  @override
  Future<Result<User, Exception>> call(GetUserParams input) async {
    // Implementation
  }
}

// Usage (callable syntax)
final result = await getUser(GetUserParams(id: '123'));
```

### Async UseCase without input

```dart
class GetCurrentUser implements UseCase<void, Result<User, Exception>> {
  @override
  Future<Result<User, Exception>> call(void input) async {
    // Implementation
  }
}

// Usage (pass null for void input)
final result = await getCurrentUser(null);
```

### Sync UseCase

```dart
class ValidateEmail implements UseCaseSync<String, Result<bool, Exception>> {
  @override
  Result<bool, Exception> call(String input) {
    // Implementation
  }
}

// Usage (callable syntax)
final result = validateEmail('test@example.com');
```

## Recommended: Use Result type

It is recommended to use a Result type (e.g. from [`result_dart`](https://pub.dev/packages/result_dart) package) as the `Output` to handle success and failure cases explicitly.

