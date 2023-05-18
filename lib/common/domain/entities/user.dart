import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Information about system user
@freezed
class User with _$User {
  /// Named constructor
  const factory User({
    /// User Name
    required String name,
  }) = _User;

  /// Empty constructor
  const User._();
}
