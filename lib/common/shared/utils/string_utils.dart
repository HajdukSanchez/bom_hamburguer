/// Utilities for string manipulation
class StringUtils {
  /// Returns a formatted price with 2 decimal places
  static String getFormattedPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
}
