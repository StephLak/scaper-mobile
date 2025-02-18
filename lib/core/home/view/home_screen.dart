import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/internalization/app_strings.dart';
import 'package:scaper_mobile/navigation/routes.dart';
import 'package:scaper_mobile/shared/custom_button.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle boldTextStyle = Styles.semiBoldTextStyle();
    return Scaffold(
      floatingActionButton: CustomButton(
        text: 'Take Test',
        onPressed: () => Get.toNamed(AppRoutes.quiz),
        width: 130,
        height: 40,
      ),
      body: SizedBox(
        height: queryHeight(context),
        width: queryWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: queryHeight(context) * 0.15,
                width: queryWidth(context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.tileColor,
                  border: Border(
                    bottom:
                        BorderSide(color: AppColors.primaryColor, width: 10),
                  ),
                ),
                child: SafeArea(
                  child: Text(
                    AppStrings.homeTitle.tr,
                    style: Styles.boldTextStyle(size: 20),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 40, horizontal: queryWidth(context) * 0.05),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'In each game you\'ll be'),
                          TextSpan(
                            text: ' playing a role.',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text:
                                  ' The character on the screen will engage you in an'),
                          TextSpan(
                            text: ' informal conversation.',
                            style: boldTextStyle,
                          ),
                          TextSpan(text: ' Your job is to'),
                          TextSpan(
                            text:
                                ' listen and respond with your preferred choice.',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text:
                                  ' It is not a simple choice between right and wrong answers. The choices represent your preference concerning the subject of conversation.\n\nAt every moment you should listen to what the character on the screen says and try to understand'),
                          TextSpan(
                            text: ' the meaning and intent.',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text:
                                  ' You will not have the ability to repeat any of the answers or the speech of the character. Even if you are not sure you understand, you must'),
                          TextSpan(
                            text: ' use your judgement',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text:
                                  ' to choose one of the proposed answers. You will always have'),
                          TextSpan(
                            text: ' two opportunities',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text:
                                  ' to play each game. Your score will be based on your answers in the second round of each game. You can view the first one as essentially as a trial round.\n\nThe first dialogue is a demonstration game. It does not produce a score. Here\'s a tip: '),
                          TextSpan(
                            text: ' don’t try to be perfect.',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                              text: ' Choose the answers that seem to you the'),
                          TextSpan(
                            text: ' most natural,',
                            style: boldTextStyle,
                          ),
                          TextSpan(text: ' the'),
                          TextSpan(
                            text: ' most logical',
                            style: boldTextStyle,
                          ),
                          TextSpan(text: ' in the context and the'),
                          TextSpan(
                            text: ' best formulated.',
                            style: boldTextStyle,
                          ),
                        ],
                      ),
                      style: Styles.regularTextStyle(size: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
