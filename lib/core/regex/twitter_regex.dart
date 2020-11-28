/// Positive lookbehind group, matches:
/// * A special character (., 。)
/// * Whitespaces
/// * The beginning of the string
const String _tagBeginGroup = r'(?<=(\.|。)|\s+|^)';

final RegExp hashtagRegex = RegExp(
  // ignore: prefer_interpolation_to_compose_strings
  _tagBeginGroup + r'(?=.{2,140})(#|＃){1}([0-9_\p{L}]*[_\p{L}][0-9_\p{L}]*)',
  caseSensitive: false,
  unicode: true,
);

final RegExp hashtagStartRegex = RegExp(
  // ignore: prefer_interpolation_to_compose_strings
  _tagBeginGroup + r'(#|＃){1}',
  caseSensitive: false,
  unicode: true,
);
