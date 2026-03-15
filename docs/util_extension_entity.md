# Util, Extension, Entity의 역할

## 목차
1. [공통점](#1-공통점)
2. [개별 역할](#2-개별-역할)
3. [Entity에서 Util과 Extension을 사용할 수 있을까?](#3-entity에서-util과-extension을-사용할-수-있을까)
4. [Crypto Book 예시 코드](#4-crypto-book-예시-코드)
5. [클린 아키텍처와 Util, Extension, Entity](#5-클린-아키텍처와-util-extension-entity)
6. [안정성을 보장하는 방법과 그것이 민감한 이유](#6-안정성을-보장하는-방법과-그것이-민감한-이유)
7. [Crypto Book Case Scratch](#7-crypto-book-case-scratch)
8. [현재 구현 분석](#8-현재-구현-분석)

---

## 1. 공통점

| 공통점 | 설명 |
|--------|------|
| 언어 레벨 구현 | 프레임워크(Flutter, Android 등) 없이 순수 Dart만으로 작성 가능 |
| 재사용 단위 | 한 번 만들어두면 프로젝트 전반에서 반복 사용 |
| 비즈니스 로직의 기반 | 도메인 규칙을 표현하거나 보조하는 역할 |
| 테스트 용이 | 외부 의존성이 없어 단위 테스트가 쉬움 |

---

## 2. 개별 역할

### Util 클래스의 역할

- **특정 타입에 종속되지 않는 범용 도우미 함수 모음**
- `static` 메서드로 구성, 인스턴스를 만들지 않음 (`ClassName._()` private 생성자)
- 입력을 받아 → 변환/포맷/계산 → 결과를 반환하는 **순수 함수(pure function)** 성격
- **호출 방식**: `PriceFormatter.formatUSD(67000.50)` — 클래스 이름으로 직접 호출
- 프로젝트 내 예시: `PriceFormatter`, `NumberFormatter`, `DateFormatter`

### Extension 함수의 역할

- **기존 클래스의 소스를 수정하지 않고 메서드를 추가**
- "이 타입이 원래 가지고 있었으면 좋겠는 기능"을 외부에서 붙이는 것
- **호출 방식**: `context.priceChangeColor(change)` 또는 `'BTCUSDT'.baseAsset` — 마치 원래 메서드인 것처럼 사용
- 프로젝트 내 예시: `ThemeContextExtension` on `BuildContext`, `SymbolParsing` on `String`

### Entity 클래스의 역할

- **비즈니스 도메인의 핵심 데이터 + 규칙을 캡슐화**
- 불변(immutable), `const` 생성자, `final` 필드
- 값 기반 동등성 (`==`, `hashCode` 오버라이드)
- Entity 자체가 도메인 로직을 가질 수 있음
- 프로젝트 내 예시: `CoinEntity`, `CoinTickerEntity`, `ExchangeRateEntity`, `ChartDataEntity`

### 세 가지 비교표

| 구분 | Util | Extension | Entity |
|------|------|-----------|--------|
| 형태 | `static` 메서드 모음 클래스 | 기존 타입에 추가되는 메서드 | 데이터 + 비즈니스 규칙 클래스 |
| 인스턴스 | 만들지 않음 | 대상 타입의 인스턴스에서 호출 | 인스턴스를 만들어서 사용 |
| 상태 | 없음 (stateless) | 없음 (대상 인스턴스의 상태 활용) | 있음 (필드로 데이터 보유) |
| 호출 예시 | `PriceFormatter.format(price)` | `'BTCUSDT'.baseAsset` | `ticker.currentPrice` |
| 목적 | 범용 변환/포맷 | 기존 타입 확장 | 도메인 데이터 표현 |

---

## 3. Entity에서 Util과 Extension을 사용할 수 있을까?

**사용할 수 있다. 단, 조건이 있다.**

### 가능한 경우
- Entity가 속한 **같은 레이어(domain)** 또는 **순수 언어 레벨**의 Util/Extension만 사용 가능
- 예: domain 패키지 안의 `SymbolParsing` Extension은 Entity와 같은 레이어이므로 사용 가능

### 불가능한 경우
- Presentation 레이어의 `PriceFormatter` → Entity에서 import 불가 (의존성 역전 위반)
- Flutter의 `BuildContext` Extension → Entity에서 사용 불가 (프레임워크 의존)

### 실제 코드 예시
```dart
// domain 패키지의 String Extension — Entity/DTO 양쪽에서 사용 가능
extension SymbolParsing on String {
  String get baseAsset {
    if (endsWith('USDT')) return substring(0, length - 4);
    if (endsWith('USDC')) return substring(0, length - 4);
    if (endsWith('BTC'))  return substring(0, length - 3);
    return this;
  }
}

// DTO에서 Extension 활용
class TickerDTO {
  CoinTickerEntity toEntity() {
    return CoinTickerEntity(
      baseAsset: symbol.baseAsset,   // Extension 호출
      quoteAsset: symbol.quoteAsset, // Extension 호출
      // ...
    );
  }
}
```
→ 심볼 파싱은 특정 Entity 고유 로직이 아닌 **범용 문자열 파싱**이므로,
  domain 레이어의 String Extension으로 분리하여 Entity와 DTO 양쪽에서 활용한다.

---

## 4. Crypto Book 예시 코드

가격과 등락률, 날짜를 다루는 Crypto Book 스펙 기반.

### NumberFormatter — 순수 숫자 포맷 담당

> 파일 위치: `packages/presentation/lib/core/utils/number_formatter.dart`

```dart
/// 순수 숫자 포맷 유틸 — 통화 기호 없이 숫자만 포맷
class NumberFormatter {
  NumberFormatter._();

  /// 가격대별 동적 소수점 포맷 (통화 기호 없음)
  /// - ≥100  → 2자리 ("67000.50")
  /// - ≥10   → 3자리 ("45.123")
  /// - ≥1    → 4자리 ("1.2345")
  /// - ≥0.01 → 5자리 ("0.12345")
  /// - <0.01 → 6자리 ("0.001234")
  static String formatPrice(double price) {
    if (price >= 100) return price.toStringAsFixed(2);
    if (price >= 10)  return price.toStringAsFixed(3);
    if (price >= 1)   return price.toStringAsFixed(4);
    if (price >= 0.01) return price.toStringAsFixed(5);
    return price.toStringAsFixed(6);
  }

  /// 거래량 축약 — K/M/B/T 단위 (통화 기호 없음)
  static String formatVolume(double volume) {
    if (volume >= 1e12) return '${(volume / 1e12).toStringAsFixed(2)}T';
    if (volume >= 1e9)  return '${(volume / 1e9).toStringAsFixed(2)}B';
    if (volume >= 1e6)  return '${(volume / 1e6).toStringAsFixed(2)}M';
    if (volume >= 1e3)  return '${(volume / 1e3).toStringAsFixed(2)}K';
    return volume.toStringAsFixed(2);
  }

  /// 시가총액 포맷 — formatVolume()에 $ 접두사 위임
  static String formatMarketCap(double marketCap) {
    return '\$${formatVolume(marketCap)}';
  }

  /// 등락률 포맷 — 부호 포함
  static String formatPercent(double percent) {
    final sign = percent >= 0 ? '+' : '';
    return '$sign${percent.toStringAsFixed(2)}%';
  }

  /// 콤마 포맷
  static String formatWithCommas(double number) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(number);
  }
}
```

**역할 분담 설계:**
- `NumberFormatter`는 **통화 기호 없이 순수 숫자만** 포맷한다.
- `formatVolume()`이 축약 로직의 단일 원천(Single Source)이고, `formatMarketCap()`은 여기에 `$`를 붙이는 래퍼다.

---

### PriceFormatter — NumberFormatter에 통화 기호를 위임

> 파일 위치: `packages/presentation/lib/core/utils/price_formatter.dart`

```dart
/// 통화별 가격 표시 — 내부적으로 NumberFormatter에 위임
class PriceFormatter {
  PriceFormatter._();

  static String format({
    required double priceInUSD,
    required String currency,
    ExchangeRateEntity? exchangeRate,
  }) {
    switch (currency) {
      case 'USD': return _formatUSD(priceInUSD);
      case 'KRW': return _formatKRW(priceInUSD, exchangeRate);
      default:    return _formatUSD(priceInUSD);
    }
  }

  /// USD — NumberFormatter.formatPrice()에 $ 접두사
  static String _formatUSD(double price) {
    return '\$${NumberFormatter.formatPrice(price)}';
  }

  /// KRW — 환율 적용 + 원화 포맷
  static String _formatKRW(double priceInUSD, ExchangeRateEntity? exchangeRate) {
    if (exchangeRate == null) return _formatUSD(priceInUSD);
    final priceInKRW = priceInUSD * exchangeRate.rate;
    final formatter = NumberFormat('#,###', 'ko_KR');
    if (priceInKRW >= 1) return '₩${formatter.format(priceInKRW.toInt())}';
    return '₩${priceInKRW.toStringAsFixed(2)}';
  }

  /// 거래량/시가총액 — NumberFormatter.formatVolume()에 $ 접두사
  static String formatLargeNumber(double number) {
    return '\$${NumberFormatter.formatVolume(number)}';
  }

  static String formatPercentChange(double percent) {
    final sign = percent >= 0 ? '+' : '';
    return '$sign${percent.toStringAsFixed(2)}%';
  }
}
```

**NumberFormatter와 PriceFormatter의 관계:**

```
NumberFormatter (순수 숫자)          PriceFormatter (통화 기호 + 위임)
├─ formatPrice("9.3100")     ←──── _formatUSD("$9.3100")
├─ formatVolume("1.23B")     ←──── formatLargeNumber("$1.23B")
└─ formatMarketCap("$1.23B")       (자체적으로 formatVolume 호출)
```

- `NumberFormatter`는 **숫자 포맷의 단일 원천** — 소수점 규칙, 축약 규칙이 한 곳에만 존재
- `PriceFormatter`는 **통화 기호 + 환율 변환 계층** — `NumberFormatter`를 호출하고 `$`, `₩`를 붙임
- 로직 중복 없음. 소수점 규칙을 바꾸면 `NumberFormatter`만 수정하면 전체에 반영됨.

---

### DateFormatter — 상대 시간 + 차트 날짜

> 파일 위치: `packages/presentation/lib/core/utils/date_formatter.dart`

```dart
class DateFormatter {
  /// 상대 시간 ("3시간 전", "방금 전")
  static String timeAgo(DateTime dateTime, AppStrings strings) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inSeconds < 60) return strings.get('just_now');
    if (difference.inMinutes < 60) return strings.get('minutes_ago', params: ['${difference.inMinutes}']);
    if (difference.inHours < 24)   return strings.get('hours_ago', params: ['${difference.inHours}']);
    return strings.get('days_ago', params: ['${difference.inDays}']);
  }

  /// 차트 X축 라벨 — 타임프레임별 포맷
  static String formatChartLabel(DateTime dateTime, ChartTimeframe timeframe) {
    switch (timeframe) {
      case ChartTimeframe.h24: return DateFormat('HH:mm').format(dateTime);    // "14:00"
      case ChartTimeframe.d7:
      case ChartTimeframe.m1:  return DateFormat('MM/dd').format(dateTime);    // "03/15"
    }
  }

  /// 차트 툴팁 타임스탬프 — 상세 포맷
  static String formatChartTimestamp(DateTime dateTime, ChartTimeframe timeframe) {
    switch (timeframe) {
      case ChartTimeframe.h24: return DateFormat('MMM dd HH:mm').format(dateTime);  // "Mar 15 14:00"
      case ChartTimeframe.d7:
      case ChartTimeframe.m1:  return DateFormat('MMM dd, yyyy').format(dateTime);  // "Mar 15, 2026"
    }
  }
}
```

**차트 위젯에서의 사용:**
```dart
// price_chart_widget.dart
String _formatBottomLabel(DateTime timestamp) {
  return DateFormatter.formatChartLabel(timestamp, selectedTimeframe);
}
String _formatTimestamp(DateTime timestamp) {
  return DateFormatter.formatChartTimestamp(timestamp, selectedTimeframe);
}
```
→ 위젯이 `DateFormat`을 직접 사용하지 않고, `DateFormatter`를 통해 중앙화된 포맷을 호출한다.

---

### SymbolParsing Extension

> 파일 위치: `packages/domain/lib/extensions/symbol_extension.dart`

```dart
/// 거래 쌍 문자열에서 base/quote 자산 추출
extension SymbolParsing on String {
  /// "BTCUSDT" → "BTC"
  String get baseAsset {
    if (endsWith('USDT')) return substring(0, length - 4);
    if (endsWith('USDC')) return substring(0, length - 4);
    if (endsWith('BUSD')) return substring(0, length - 4);
    if (endsWith('USD'))  return substring(0, length - 3);
    if (endsWith('BTC'))  return substring(0, length - 3);
    if (endsWith('ETH'))  return substring(0, length - 3);
    return this;
  }

  /// "BTCUSDT" → "USDT"
  String get quoteAsset {
    if (endsWith('USDT')) return 'USDT';
    if (endsWith('USDC')) return 'USDC';
    if (endsWith('BUSD')) return 'BUSD';
    if (endsWith('BTC'))  return 'BTC';
    if (endsWith('ETH'))  return 'ETH';
    if (endsWith('USD'))  return 'USD';
    return 'UNKNOWN';
  }
}
```

**Extension의 특징이 드러나는 부분:**
- `String`의 소스 코드를 건드리지 않고 `baseAsset`, `quoteAsset` 프로퍼티 추가
- domain 레이어에 위치하여 data 레이어(`TickerDTO`)와 presentation 레이어(`CoinDetailViewModel`) 양쪽에서 사용 가능
- `'BTCUSDT'.baseAsset` 처럼 자연스럽게 호출

---

### ThemeContext Extension

> 파일 위치: `packages/presentation/lib/theme/extensions/context_extensions.dart`

```dart
/// BuildContext에 테마/가격 색상 관련 편의 메서드를 추가
extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CryptoThemeExtension get cryptoTheme =>
      Theme.of(this).extension<CryptoThemeExtension>()!;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// 등락률에 따른 색상 반환 (상승=초록, 하락=빨강, 보합=회색)
  Color priceChangeColor(double change) {
    if (change > 0) return cryptoTheme.priceUpColor;
    if (change < 0) return cryptoTheme.priceDownColor;
    return cryptoTheme.priceNeutralColor;
  }
}
```

---

### CoinTickerEntity / ChartDataEntity

> 파일 위치: `packages/domain/lib/entities/coin_ticker_entity.dart`

```dart
/// 코인 시세 Entity — 비즈니스 데이터를 캡슐화
class CoinTickerEntity {
  final String symbol;                  // "BTCUSDT"
  final String baseAsset;               // "BTC"
  final String quoteAsset;              // "USDT"
  final double currentPrice;            // 67000.50
  final double priceChange24h;          // +1200.00
  final double priceChangePercent24h;   // +1.82
  final double high24h;
  final double low24h;
  final double volume24h;
  final double quoteVolume24h;
  final DateTime timestamp;
  final String? imageUrl;

  const CoinTickerEntity({ /* required fields */ });

  // 값 기반 동등성 — symbol + 가격 데이터로 비교
  @override
  bool operator ==(Object other) { /* ... */ }

  @override
  int get hashCode => Object.hash(symbol, currentPrice, priceChangePercent24h, volume24h);
}
```

> 파일 위치: `packages/domain/lib/entities/chart_data_entity.dart`

```dart
/// 차트 데이터 Entity — 데이터 + 계산 로직을 캡슐화
class ChartDataEntity {
  final List<ChartDataPoint> dataPoints;
  final ChartTimeframe timeframe;

  const ChartDataEntity({ required this.dataPoints, required this.timeframe });

  /// Entity 내부 도메인 로직 — 최저가 계산
  double get minPrice =>
      dataPoints.isEmpty ? 0 : dataPoints.map((p) => p.price).reduce((a, b) => a < b ? a : b);

  /// Entity 내부 도메인 로직 — 최고가 계산
  double get maxPrice =>
      dataPoints.isEmpty ? 0 : dataPoints.map((p) => p.price).reduce((a, b) => a > b ? a : b);

  /// Entity 내부 도메인 로직 — 가격 범위
  double get priceRange => maxPrice - minPrice;

  bool get isEmpty => dataPoints.isEmpty;
  int get length => dataPoints.length;
}
```

**Entity의 특징이 드러나는 부분:**
- `const` 생성자, `final` 필드 → 불변 객체
- `minPrice`, `maxPrice`, `priceRange` → Entity 자신의 데이터에 대한 **도메인 로직**
- `==`, `hashCode` 오버라이드 → 값 기반 동등성
- 외부 의존성 없음 → 순수 Dart만으로 작성
- 심볼 파싱 같은 범용 유틸리티는 Entity에 넣지 않고, domain 레이어의 Extension으로 분리

---

## 5. 클린 아키텍처와 Util, Extension, Entity

### 동심원에서의 위치

```
┌─────────────────────────────────────────────────────┐
│  Presentation (UI, Frameworks & Drivers)             │
│  → BuildContext Extension                            │
│  → PriceFormatter (통화 기호 + NumberFormatter 위임)    │
│  → DateFormatter (상대 시간 + 차트 포맷)                │
│  ┌─────────────────────────────────────────────────┐ │
│  │  Domain (Application Business Rules)             │ │
│  │  → UseCase (AnalyzeCoinUseCase 등)                │ │
│  │  → Repository 인터페이스                           │ │
│  │  ┌─────────────────────────────────────────────┐ │ │
│  │  │  Entities (Enterprise Business Rules)        │ │ │
│  │  │  → CoinTickerEntity                          │ │ │
│  │  │  → ChartDataEntity                           │ │ │
│  │  │  → ExchangeRateEntity                        │ │ │
│  │  │  → SymbolParsing Extension (언어 레벨)         │ │ │
│  │  │  → NumberFormatter (순수 숫자 포맷)             │ │ │
│  │  └─────────────────────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────┘ │
│  Data (외부 세계)                                      │
│  → DTO, DataSource, ErrorMapper                      │
└─────────────────────────────────────────────────────┘
```

- **Entity** → 가장 안쪽 원 (Enterprise Business Rules)
- **UseCase** → 그 다음 원 (Application Business Rules)
- **순수 Util/Extension** (언어 레벨, 프레임워크 비의존) → Entity와 같은 레벨에 위치 가능
- **Presentation용 Formatter/Extension** (Flutter 의존) → 바깥 원 (Interface Adapters)

### UseCase vs Entity — 둘 다 언어 레벨인데 차이는?

| 구분 | Entity | UseCase |
|------|--------|---------|
| **역할** | 핵심 비즈니스 데이터 + 규칙 | 애플리케이션 흐름/시나리오 조율 |
| **상태** | 데이터를 들고 있음 | 데이터를 조합/처리하는 **행위** |
| **의존성** | 없음 (자기 자신만) | Repository **인터페이스**에 의존 |
| **변경 빈도** | 가장 적게 변함 | 비즈니스 요구사항에 따라 변함 |
| **프로젝트 예시** | `ChartDataEntity.minPrice` (데이터 자체의 규칙) | `AnalyzeCoinUseCase.execute()` (ticker+chart+news → AI 전달 흐름) |

핵심 차이: Entity는 **"이 데이터는 무엇인가"**, UseCase는 **"이 데이터로 무엇을 하는가"**

### Entity 로직은 Presentation/Data에서 의존을 가질 수 있을까?

**가질 수 있다. 방향이 중요할 뿐이다.**

```
Presentation ──→ Domain(Entity) ←── Data
               (의존 방향은 항상 안쪽으로)
```

| 의존 방향 | 가능 여부 | 프로젝트 예시 |
|-----------|----------|--------------|
| Presentation → Entity | O (가능) | `PriceRow` 위젯이 `CoinTickerEntity`를 받아서 표시 |
| Data → Entity | O (가능) | `TickerDTO.toEntity()`에서 Entity를 생성 |
| Entity → Presentation | X (불가) | Entity에서 Flutter Widget을 import하면 안 됨 |
| Entity → Data | X (불가) | Entity에서 Dio, Hive 등을 import하면 안 됨 |

### 의존 방식 — 인터페이스(추상 클래스)를 통해서

```dart
// Domain 레이어에 인터페이스 정의 (안쪽 원)
abstract interface class AiRepository {
  Future<AiInsightEntity> analyzeCoin({required CoinTickerEntity ticker, ...});
}

// Data 레이어에서 구현 (바깥 원 → 안쪽 원에 의존)
class AiRepositoryImpl implements AiRepository {
  @override
  Future<AiInsightEntity> analyzeCoin({required CoinTickerEntity ticker, ...}) {
    // 실제 AI API 호출 구현
  }
}

// UseCase에서는 인터페이스에만 의존 (안쪽 원끼리)
class AnalyzeCoinUseCaseImpl implements AnalyzeCoinUseCase {
  final AiRepository repository; // 추상 인터페이스
  // ...
}
```

→ **의존성 역전 원칙(DIP)**: 바깥 원이 안쪽 원의 인터페이스를 구현하고,
  안쪽 원은 바깥 원의 존재를 모른다.

---

## 6. 안정성을 보장하는 방법과 그것이 민감한 이유

### 방법

| 방법 | 설명 | 적용 대상 |
|------|------|----------|
| **단위 테스트** | 순수 함수/데이터이므로 테스트가 매우 쉬움. 모든 경계값을 검증 | Util, Extension, Entity 전부 |
| **불변성 (Immutability)** | `const` 생성자, `final` 필드로 외부 상태 변경 차단 | Entity |
| **프레임워크 비의존** | Flutter, Dio 등에 의존하지 않으므로 독립적으로 검증 가능 | Domain 레벨 Util/Entity |
| **Private 생성자** | 인스턴스화 방지로 잘못된 사용 차단 | Util |
| **값 동등성** | `==`, `hashCode` 오버라이드로 예측 가능한 비교 | Entity |

### 이유 — 왜 민감한가?

Entity, Util, Extension은 **프로젝트 전체가 의존하는 가장 안쪽 기반**이다.

```
Entity/Util에 버그가 있으면:
  → UseCase가 잘못된 데이터로 동작
    → Presentation이 잘못된 결과를 표시
      → 앱 전체가 틀린 정보를 보여줌
```

**구체적 예시:**

| 버그 위치 | 영향 범위 |
|-----------|----------|
| `NumberFormatter.formatPrice()`에서 소수점 로직 오류 | USD/KRW 모든 가격 표시가 전부 틀림 (`PriceFormatter`가 위임하므로) |
| `'BTCUSDT'.baseAsset`에서 파싱 오류 | 모든 코인의 심볼이 깨짐 (DTO, ViewModel 양쪽 영향) |
| `ChartDataEntity.minPrice`에서 계산 오류 | 차트 Y축 범위가 틀어짐 |
| `ExchangeRateEntity.rate` 적용 오류 | 원화 가격이 전부 잘못 표시됨 |

**결론:** 변경 빈도가 가장 낮아야 하고, 변경할 때 가장 신중해야 하며, 반드시 테스트로 보호해야 하는 영역이다.

---

## 7. Crypto Book Case Scratch

현재 스펙에서 구현되어야 하는 Util, Extension 목록.

### 숫자

| 기능 | 구현 위치 | 설명 | 사용처 |
|------|----------|------|--------|
| A: 콤마 포맷 | `NumberFormatter.formatWithCommas` | `1234567` → `"1,234,567"` | 거래량, 시가총액 표시 |
| B: 단위 축약 | `NumberFormatter.formatVolume` | `1234567890` → `"1.23B"` | 24시간 거래량 |

### 가격

| 기능 | 구현 위치 | 설명 | 사용처 |
|------|----------|------|--------|
| A: 동적 소수점 포맷 | `NumberFormatter.formatPrice` → `PriceFormatter._formatUSD` | 가격대별 소수점 자릿수 자동 조절 | 현재가, 고가, 저가 |
| B: 통화 변환 포맷 | `PriceFormatter.format` | USD→KRW 환율 적용 + 원화 포맷 | 설정에 따른 통화 전환 |
| C: 대형 숫자 포맷 | `NumberFormatter.formatVolume` → `PriceFormatter.formatLargeNumber` | `$` 접두사 + K/M/B/T 축약 | 시가총액, 거래대금 |

### 등락률 (PricePnL)

| 기능 | 구현 위치 | 설명 | 사용처 |
|------|----------|------|--------|
| A: 부호 포함 포맷 | `PriceFormatter.formatPercentChange` | `+5.23%` / `-2.15%` | 24시간 변동률 뱃지 |
| B: 색상 매핑 | `context.priceChangeColor` | 상승=초록, 하락=빨강, 보합=회색 | 가격 행, 상세 페이지 |

### 날짜 / 시간 데이터

| 기능 | 구현 위치 | 설명 | 사용처 |
|------|----------|------|--------|
| A: 상대 시간 | `DateFormatter.timeAgo` | `"3시간 전"`, `"방금 전"` | 뉴스 발행 시간 |
| B: 차트 X축 라벨 | `DateFormatter.formatChartLabel` | `"14:00"`, `"03/15"` 등 타임프레임별 | 차트 X축 라벨 |
| C: 차트 툴팁 | `DateFormatter.formatChartTimestamp` | `"Mar 15 14:00"`, `"Mar 15, 2026"` | 차트 터치 툴팁 |

### 심볼 파싱

| 기능 | 구현 위치 | 설명 | 사용처 |
|------|----------|------|--------|
| A: 기본 자산 추출 | `String.baseAsset` (SymbolParsing) | `"BTCUSDT"` → `"BTC"` | DTO 변환, 뉴스 검색 |
| B: 견적 자산 추출 | `String.quoteAsset` (SymbolParsing) | `"BTCUSDT"` → `"USDT"` | DTO 변환 |

---

## 8. 현재 구현 분석

### 설계 원칙 적용 현황

| 설계 원칙 | 적용 방식 |
|-----------|----------|
| **단일 책임** | `NumberFormatter`(순수 숫자) → `PriceFormatter`(통화 기호 + 위임)로 역할 분리 |
| **DRY (중복 제거)** | 소수점 로직은 `NumberFormatter.formatPrice()` 한 곳, 축약 로직은 `formatVolume()` 한 곳 |
| **의존성 방향** | domain(`SymbolParsing`) ← data(`TickerDTO`) / presentation(`ViewModel`) |
| **중앙화** | 날짜 포맷을 `DateFormatter`에 집중, 위젯에서 `DateFormat` 직접 사용하지 않음 |

### 레이어별 Util/Extension 배치

```
domain/
  extensions/
    symbol_extension.dart        ← SymbolParsing (String Extension)
  entities/
    coin_ticker_entity.dart      ← 순수 데이터, 파싱 로직 없음
    chart_data_entity.dart       ← 도메인 계산 (minPrice, maxPrice)

presentation/
  core/utils/
    number_formatter.dart        ← 순수 숫자 포맷 (단일 원천)
    price_formatter.dart         ← NumberFormatter 위임 + 통화 기호
    date_formatter.dart          ← 상대 시간 + 차트 날짜 포맷
  theme/extensions/
    context_extensions.dart      ← BuildContext 테마 Extension
```

### 전체 평가

| 항목 | 평가 |
|------|------|
| 클린 아키텍처 구조 | 잘 잡혀 있음 (domain/data/presentation 분리) |
| 의존성 방향 | 정확함 (바깥 → 안쪽으로만) |
| Entity 설계 | 적절함 (불변, 값 동등성, 도메인 로직만 포함) |
| Util 설계 | NumberFormatter → PriceFormatter 위임 구조로 중복 없음 |
| Extension 활용 | domain 레이어의 SymbolParsing으로 레이어 간 공유, presentation의 ThemeContext로 UI 편의 제공 |
| 날짜 포맷 | DateFormatter에 중앙화, 위젯에서 직접 DateFormat 사용하지 않음 |
| 테스트 | 확인 필요 — 핵심 Util/Entity에 대한 단위 테스트가 있는지 |
