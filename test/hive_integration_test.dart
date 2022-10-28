
import 'dart:io';

import 'package:fade_state_demo/data/hive/loyalty_card_box.dart';
import 'package:fade_state_demo/data/loyalty_card/model/loyalty_card.dart';
import 'package:fade_state_demo/data/loyalty_card/repository/loyalty_card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void initialiseHive() async{
  var path = Directory.current.path;
  Hive
  ..init(path)
  ..registerAdapter(LoyaltyCardAdapter());

  //Always starts from a clean box
  Hive.deleteBoxFromDisk('loyalty_card');
}

void main() async {
  initialiseHive();

  final newCard = LoyaltyCard('New card', '12345');

  group(
      'Given a real loyalty cards repository instance and a real Hive box', () {
    test(
        'should save and then retrieve saved loyalty card from the repository', () async {
      final loyaltyCardRepository = LoyaltyCardRepository(LoyaltyCardBox());

      await loyaltyCardRepository.save(newCard);

      expect(await loyaltyCardRepository.getAll(), [newCard]);
    });
  });
}