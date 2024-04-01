import 'dart:ui';
import 'package:gluestack_ui/gluestack_ui.dart';

///
/// Extension on GSstyle Copywith method
///
extension GScopyWith on GSStyle {
  GSStyle copyWith({
    Color? bg,
    Color? color,
    double? borderRadius,
    double? borderWidth,
    Color? borderColor,
    GSButtonVariants? variant,
  }) {
    return GSStyle(
      bg: bg ?? this.bg,
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

///
/// Extension on `GSRadiiToken` copywith method
///
extension GSRadiiTokenCopyWith on GSRadiiToken {
  GSRadiiToken copyWith({
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? full,
  }) {
    return GSRadiiToken(
      $sm: sm ?? $sm,
      $md: md ?? $md,
      $lg: lg ?? $lg,
      $xl: xl ?? $xl,
      full: full ?? this.full,
    );
  }
}

extension GSBorderWidthTokenCopyWith on GSBorderWidthToken {
  GSBorderWidthToken copyWith({
    double? $0,
    double? $1,
    double? $2,
    double? $4,
    double? $8,
  }) {
    return GSBorderWidthToken(
      $0: $0 ?? 0,
      $1: $1 ?? 1,
      $2: $2 ?? 2,
      $4: $4 ?? 4,
      $8: $8 ?? 8,
    );
  }
}

extension StringConverterBorderWidth on GSBorderWidthToken {
  String toJsonString() {
    return 'gsBorderWidthToken: GSBorderWidthToken(\$0: ${this.$0}, \$1: ${this.$1}, \$2: ${this.$2}, \$4: ${this.$4}, \$8: ${this.$8})';
  }
}

///
/// To get export value from ColorToken
///
extension StringConverter on GSColorsToken {
  String toJsonString() {
    String primary500v = primary500!.value.toRadixString(16);
    return 'gsColorsToken: GSColorsToken(primary500: Color(0xff$primary500v))';
  }
}

///
/// To get Export Value
///
extension StringConverterRadii on GSRadiiToken {
  String toJsonString() {
    return 'gsRadiiToken: GSRadiiToken(\$sm: ${this.$sm}, \$md: ${this.$md}, \$lg: ${this.$lg}, \$xl: ${this.$xl}, full: ${this.full})';
  }
}

// GSColorsToken(primary500: $primary500)

// extension StringConverter on GSColorsToken {
//   String toJsonString() {
//     final int primary500Value = primary500!.value;

//     Color getColor(int increment) {
//       final double alpha =
//           (increment * 10).toDouble(); // Adjust the multiplier as needed
//       final int alphaValue = alpha.toInt().clamp(0, 255);

//       return primary500!.withAlpha(alphaValue);
//     }

//     return '''
//       gsColorsToken: GSColorsToken(
//         primary0: ${getColor(-5)},
//         primary50: ${getColor(-4)},
//         primary100: ${getColor(-3)},
//         primary200: ${getColor(-2)},
//         primary300: ${getColor(-1)},
//         primary400: ${getColor(0)},
//         primary500: ${getColor(1)},
//         primary600: ${getColor(4)},
//         primary700: ${getColor(8)},
//         primary800: ${getColor(12)},
//         primary900: ${getColor(16)},
//         primary950: ${getColor(20)}
//       )
//     ''';
//   }
// }