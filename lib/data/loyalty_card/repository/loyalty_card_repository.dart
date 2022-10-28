import 'package:fade_state_demo/data/loyalty_card/model/loyalty_card.dart';
import 'package:fade_state_demo/data/repository.dart';

import '../../hive/loyalty_card_box.dart';

class LoyaltyCardRepository extends Repository<LoyaltyCard> {
  final LoyaltyCardBox loyaltyCardBox;

  LoyaltyCardRepository(this.loyaltyCardBox);

  @override
  Future<void> delete(LoyaltyCard objectToDelete) async {
    final box = await loyaltyCardBox.box;
    box.delete(objectToDelete.key);
  }

  @override
  Future<void> deleteAll() async {
    final box = await loyaltyCardBox.box;
    box.deleteAll(box.keys);
  }

  @override
  Future<List<LoyaltyCard>> getAll() async {
    final box = await loyaltyCardBox.box;
    return box.values.toList();
  }

  @override
  Future<LoyaltyCard> getById(String id) async {
    final box = await loyaltyCardBox.box;
    return box.values.firstWhere((element) => element.number == id);
  }

  @override
  Future<void> save(LoyaltyCard newObject) async {
    final box = await loyaltyCardBox.box;
    box.add(newObject);
  }
}
