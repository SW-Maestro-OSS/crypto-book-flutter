import 'package:dart_mappable/dart_mappable.dart';
import 'dto/coin_dto.dart';
import 'dto/ticker_dto.dart';

void initializeMappers() {
  MapperContainer.globals.use(CoinDTOMapper.ensureInitialized());
  MapperContainer.globals.use(TickerDTOMapper.ensureInitialized());
}
