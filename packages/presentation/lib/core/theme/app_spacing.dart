/// App-wide spacing and sizing constants based on Figma design
class AppSpacing {
  AppSpacing._();

  // Base spacing unit (4px)
  static const double unit = 4.0;

  // Spacing scale
  static const double xs = unit; // 4px
  static const double sm = unit * 2; // 8px
  static const double md = unit * 3; // 12px
  static const double lg = unit * 4; // 16px
  static const double xl = unit * 5; // 20px
  static const double xxl = unit * 6; // 24px
  static const double xxxl = unit * 8; // 32px

  // Component-specific spacing
  static const double searchBarPadding = md; // 12px
  static const double searchBarMargin = lg; // 16px
  static const double priceRowPadding = lg; // 16px
  static const double priceRowPaddingVertical = md; // 12px
  static const double sortHeaderPadding = lg; // 16px
  static const double sortHeaderPaddingVertical = sm; // 8px

  // Component heights
  static const double searchBarHeight = 48.0;
  static const double priceRowHeight = 72.0;
  static const double sortHeaderHeight = 40.0;
  static const double metricCardMinHeight = 80.0;

  // Border radius
  static const double radiusXs = unit; // 4px
  static const double radiusSm = unit * 2; // 8px
  static const double radiusMd = unit * 3; // 12px
  static const double radiusLg = unit * 4; // 16px
  static const double radiusXl = unit * 5; // 20px
  static const double radiusFull = 9999.0; // Pill shape

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 40.0;

  // Coin icon sizes
  static const double coinIconSmall = 32.0;
  static const double coinIconMedium = 40.0;
  static const double coinIconLarge = 56.0;

  // Grid spacing
  static const double gridSpacing = md; // 12px
  static const double gridPadding = lg; // 16px

  // List spacing
  static const double listItemSpacing = 0.0; // No spacing between items
  static const double listPadding = 0.0; // No padding for lists

  // Card spacing
  static const double cardPadding = lg; // 16px
  static const double cardMargin = sm; // 8px
  static const double cardRadius = radiusMd; // 12px

  // Badge/Chip sizing
  static const double badgePaddingHorizontal = sm; // 8px
  static const double badgePaddingVertical = xs; // 4px
  static const double badgeRadius = radiusSm; // 8px

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerIndent = lg; // 16px

  // Bottom navigation
  static const double bottomNavHeight = 60.0;

  // Chart
  static const double chartHeight = 200.0;
  static const double chartPadding = lg; // 16px

  // Section spacing
  static const double sectionSpacing = xxl; // 24px
  static const double sectionPadding = lg; // 16px

  // Border width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 1.5;
  static const double borderWidthThick = 2.0;
}
