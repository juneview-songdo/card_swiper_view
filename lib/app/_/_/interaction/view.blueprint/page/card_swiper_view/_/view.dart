import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  final CardSwiperController controller = CardSwiperController();

  List<Widget> cards = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      controller: controller,
      cardsCount: cards.length,
      onSwipe: (
        int previousIndex,
        int? currentIndex,
        CardSwiperDirection direction,
      ) {
        debugPrint(
          'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
        );
        return true;
      },
      onUndo: (
          int? previousIndex,
          int currentIndex,
          CardSwiperDirection direction,
          ) {
        debugPrint(
          'The card $currentIndex was undod from the ${direction.name}',
        );
        return true;
      },
      numberOfCardsDisplayed: 3,
      backCardOffset: const Offset(40, 40),
      padding: const EdgeInsets.all(24.0),
      cardBuilder: (
        context,
        index,
        horizontalThresholdPercentage,
        verticalThresholdPercentage,
      ) =>
          cards[index],
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
