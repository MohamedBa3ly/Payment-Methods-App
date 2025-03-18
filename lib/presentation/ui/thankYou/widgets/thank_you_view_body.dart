
import 'package:flutter/material.dart';
import 'package:payment_app/presentation/ui/thankYou/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: Row(
              children: List.generate(
                30,
                    (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      color: const Color(0xffB8B8B8),
                      height: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}