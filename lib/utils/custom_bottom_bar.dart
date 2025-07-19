import 'package:flutter/material.dart';
import 'package:vivaheal/utils/buttons.dart';
import 'package:vivaheal/utils/text_styles.dart';

class CustomBottomBar extends StatelessWidget {
  final dynamic dashStrings;
  final dynamic dashColors;
  final bool dev;
  final dynamic screenSize;

  const CustomBottomBar({
    Key? key,
    required this.dashStrings,
    required this.dashColors,
    required this.dev,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color grad1 = const Color(0xFF33BB78);
    Color grad2 = const Color(0xFF73ADE3);
    Color bordercol = const Color(0xFF33BB78);

    return Container(
      height: dev ? 132 : 164,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Two Gradient Buttons Row
            Row(
              children: [
                Expanded(
                  child: gradientButton(
                    buttonLabel: dashStrings.createRideButton,
                    onPressed: () {},
                    height: dev ? 34 : 40,
                    width: screenSize.width / 2,
                  ),
                ),
                SizedBox(width: dev ? 10 : 20),
                Expanded(
                  child: gradientButton(
                    buttonLabel: dashStrings.searchRideButton,
                    onPressed: () {},
                    height: dev ? 34 : 40,
                    width: screenSize.width / 2,
                    grad1: dashColors.whiteTextColor,
                    grad2: dashColors.whiteTextColor,
                    textcol: dashColors.tealColor,
                    bordercol: dashColors.tealColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Bottom Navigation Bar with 3 Icons
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: bordercol),
                gradient: LinearGradient(
                  colors: [grad1, grad2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              width: double.infinity,
              height: dev ? 48 : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home Icon Button
                  Container(
                    height: dev ? 40 : 50,
                    padding: EdgeInsets.symmetric(horizontal: dev ? 8 : 12),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.102),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: bordercol),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.home, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Home',
                            style: TextStyles.monText(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Search Icon Button
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/overlapping.png',
                            color: Colors.white,
                            width: dev ? 20 : 35,
                            height: dev ? 20 : 35,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),

                  // Profile Icon Button
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(
                              'assets/star.png',
                              color: Colors.white,
                              width: dev ? 20 : 40,
                              height: dev ? 20 : 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
