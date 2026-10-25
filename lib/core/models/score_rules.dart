/// Score invariant: an integer from 1 to 10 where 5 is not allowed, so the
/// person always leans to one side.
abstract final class ScoreRules {
  static const int min = 1;
  static const int max = 10;
  static const int forbidden = 5;

  /// Every score a person may choose, in ascending order.
  static const List<int> allowed = [1, 2, 3, 4, 6, 7, 8, 9, 10];

  static bool isAllowed(int? score) =>
      score != null && score >= min && score <= max && score != forbidden;
}
