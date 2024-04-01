import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/token/public.dart';

/// Represents the style configuration for GSBadgeIcon.
final GSStyle badgeIconStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().badgeIcon);

/// Needed configuration for descendantStyle, specifying the component name and ancestor style.
const GSStyleConfig gsBadgeIconStyle =
    GSStyleConfig(componentName: 'BadgeIcon', ancestorStyle: ['_icon']);

/// GSBadgeIconStyle class containing predefined sizes for GSBadgeIcon.
class GSBadgeIconStyle {
  /// Map of GSSizes to corresponding font sizes for GSBadgeIcon.
  static Map<GSSizes, double?> size = {
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
  };
}
