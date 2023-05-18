/// Failure with storage data
class CommonStorageFailure implements Exception {
  /// Constructor
  CommonStorageFailure(this.error);

  /// Message to handle on error
  final String error;
}
