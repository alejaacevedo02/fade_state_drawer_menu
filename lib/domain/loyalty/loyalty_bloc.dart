import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/loyalty_card/model/loyalty_card.dart';
import '../../data/loyalty_card/repository/loyalty_card_repository.dart';

part 'loyalty_event.dart';
part 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  final LoyaltyCardRepository loyaltyCardRepository;

  LoyaltyBloc({ required this.loyaltyCardRepository}) : super(LoyaltyEmpty());
  LoyaltyState get initialState => LoyaltyEmpty();

  Stream<LoyaltyState> mapEventToState(LoyaltyEvent event) async* {
    switch (event.runtimeType) {
      case Fetch:
        try {
          yield LoyaltyLoading();
          final loyaltyCards = await _fetchLoyaltyCards();
          if (loyaltyCards.isNotEmpty) {
            yield LoyaltyLoaded(loyaltyCards: loyaltyCards);
          }else {
            yield LoyaltyEmpty();
          }
        } catch(_) {
          yield LoyaltyError();
        }
        break;
      default:
        yield LoyaltyError();
    }
  }

  Future<List<LoyaltyCard>> _fetchLoyaltyCards() async {
    return loyaltyCardRepository.getAll();
  }
  
}
