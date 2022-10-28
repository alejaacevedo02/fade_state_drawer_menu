import 'package:fade_state_demo/data/hive/loyalty_card_box.dart';
import 'package:fade_state_demo/data/loyalty_card/model/loyalty_card.dart';
import 'package:fade_state_demo/data/loyalty_card/repository/loyalty_card_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LoyaltyCardBox>()])
@GenerateNiceMocks([MockSpec<Box<LoyaltyCard>>()])

import 'loyalty_card_repository_test.mocks.dart';

//class MockLoyaltyCardBox extends Mock implements LoyaltyCardBox {}
// class MockBox<T> extends Mock implements Box<T> {}

void main(){
  final loyaltyCard1 = LoyaltyCard('Card1','12345');
  final loyaltyCard2 = LoyaltyCard('Card2','54321');
  final loyaltyCardList = [loyaltyCard1, loyaltyCard2];

  group('Given a Loyalty cards repository', () {
    final mockLoyaltyCardBox = MockLoyaltyCardBox();
    final mockBox = MockBox();

    final loyaltyCardRepository = LoyaltyCardRepository(mockLoyaltyCardBox);

    when(mockLoyaltyCardBox.box).thenAnswer((_) async => Future.value(mockBox));
    when(mockBox.values).thenReturn(loyaltyCardList);

    test('should retrieve all LoyaltyCards', () async {
      final result = await loyaltyCardRepository.getAll();

      expect(result, loyaltyCardList);
    });

    test('should save loyalty card in the box', () async {
      final newCard = LoyaltyCard('CardNew','222333');

      await loyaltyCardRepository.save(newCard);

      verify(mockBox.add(newCard));
    });

    test('should delete loyalty card from the box', () async {
      final existingCard = LoyaltyCard('ExistingCard','777878');

      await loyaltyCardRepository.delete(existingCard);

      verify(mockBox.delete(existingCard.key));
    });

  });
}