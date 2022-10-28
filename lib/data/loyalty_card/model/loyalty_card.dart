
import 'package:hive/hive.dart';

part 'loyalty_card.g.dart';

@HiveType(typeId: 0)
class LoyaltyCard extends HiveObject{
  LoyaltyCard(this.name, this.number);

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;
}