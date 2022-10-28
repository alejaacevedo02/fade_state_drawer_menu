
import 'package:hive/hive.dart';

import '../loyalty_card/model/loyalty_card.dart';

class LoyaltyCardBox {
  var box = Hive.openBox<LoyaltyCard>('loyalty_card');
}