// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// User data to be transformed on Mapper layer
@freezed
class UserDTO with _$UserDTO {
  /// Named constructor
  const factory UserDTO({
    /// User Name
    @JsonKey(name: 'name') required String name,
  }) = _UserDTO;

  /// Empty constructor
  const UserDTO._();

  /// Function to handle `fromJson` and `toJson`
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
