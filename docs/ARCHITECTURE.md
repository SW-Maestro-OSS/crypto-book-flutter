# Architecture 개선 내역

## 1. Theme System

### 구조
```
packages/presentation/lib/theme/
├── app_theme.dart                 # ThemeData (Light/Dark)
├── theme_mode_provider.dart       # Riverpod 상태관리
├── colors/
│   ├── app_colors.dart            # ColorScheme
│   └── semantic_colors.dart       # 가격 색상 (녹/빨/회)
├── typography/app_typography.dart # TextTheme
├── spacing/app_spacing.dart       # 8pt Grid
├── extensions/
│   ├── crypto_theme_extension.dart  # ThemeExtension<T>
│   └── context_extensions.dart      # context.colorScheme 등
└── persistence/theme_preference_service.dart  # Hive 저장
```

### 사용법
```dart
// 테마 색상
Text('Title', style: TextStyle(color: context.colorScheme.primary));

// Crypto 특화 (가격 변동)
final color = context.priceChangeColor(ticker.priceChangePercent24h);

// 간격
Padding(padding: AppSpacing.allMd)
```

### 주요 결정
- Material 3 표준 (`Theme.of(context)`) 사용
- Dark Mode 지원 (Light/Dark/System)
- Hive로 선호도 저장

---

## 2. Routing Architecture

### 구조

**Domain Layer:**
```
packages/domain/lib/routing/
├── page_type.dart         # enum PageType (splash, main, coinDetail)
└── routing_helper.dart    # interface (navigateTo, pushTo, goBack)
```

**Presentation Layer:**
```
packages/presentation/lib/
├── routing/
│   ├── navigation_state.dart      # NavigationState (idle, navigateTo, pushTo...)
│   └── routing_helper_impl.dart   # RoutingHelper 구현체
└── main/
    ├── main_state.dart            # currentTabIndex + navigationState
    ├── main_viewmodel.dart        # RoutingHelper 제공
    └── main_page.dart             # ref.listen → context.go/push 실행
```

### Flow
```
View → routingHelper.pushTo(PageType.coinDetail, params)
     → RoutingHelperImpl → MainViewModel.state 업데이트
     → MainPage.ref.listen 감지
     → context.push(path)
```

### 주요 결정
- PageType enum으로 타입 안전성
- ViewModel에서 네비게이션 가능 (BuildContext 불필요)
- MainPage에서만 context.go/push 실행
- Splash는 예외적으로 context.go() 직접 사용 (MainViewModel 초기화 전)

---

## 3. Deep Link (기본 구조)

**Android:** `AndroidManifest.xml`
```xml
<!-- Custom: crypto://coin/BTCUSDT -->
<data android:scheme="crypto" android:host="coin" />

<!-- HTTPS: https://crypto.example.com/coin/... -->
<data android:scheme="https" android:host="crypto.example.com" />
```

**iOS:** `Info.plist`
```xml
<key>CFBundleURLSchemes</key>
<string>crypto</string>

<key>com.apple.developer.associated-domains</key>
<string>applinks:crypto.example.com</string>
```

---

```
Domain 
  ├── entities/
  ├── usecases/
  └── routing/          # ← NEW (PageType, RoutingHelper interface)

Data
  ├── datasources/
  ├── repositories/
  └── constants/

Presentation (Flutter)
  ├── theme/            # ← NEW
  ├── routing/          # ← NEW (구현체)
  ├── main/             # ← NEW (MainViewModel)
  ├── home/
  ├── splash/
  └── settings/
```

