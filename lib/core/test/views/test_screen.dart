import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/core/test/controller/test_controller.dart';
import 'package:scaper_mobile/shared/custom_button.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());
    return Scaffold(
      body: SizedBox(
        height: queryHeight(context),
        width: queryWidth(context),
        child: Column(
          children: [
            Container(
              height: queryHeight(context) * 0.15,
              width: queryWidth(context),
              margin: EdgeInsets.only(bottom: queryHeight(context) * 0.15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.tileColor,
                border: Border(
                  bottom: BorderSide(color: AppColors.primaryColor, width: 10),
                ),
              ),
              child: SafeArea(
                child: Text(
                  'Dialog Test',
                  style: Styles.boldTextStyle(size: 20),
                ),
              ),
            ),
            Obx(() => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.testEnded.value) ...[
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Score',
                                style: Styles.regularTextStyle(size: 30),
                              ),
                              Text(
                                controller.score.value.toString(),
                                style: Styles.boldTextStyle(size: 80),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              CustomButton(
                                text: 'Go Home',
                                onPressed: Get.back,
                                width: queryWidth(context) * 0.5,
                              )
                            ],
                          ),
                        ),
                      ] else ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            controller.currentNode.value!.text,
                            style: Styles.regularTextStyle(size: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20),
                        ...controller.currentNode.value!.options
                            .map((option) => ElevatedButton(
                                  onPressed: () =>
                                      controller.selectOption(option),
                                  child: Text(
                                    option.text,
                                    style: Styles.regularTextStyle(
                                        color: Colors.blue, size: 16),
                                  ),
                                )),
                        SizedBox(height: 40),
                        Text(
                          "Time Left: ${controller.timeLeft.value} seconds",
                          style: Styles.regularTextStyle(
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ]
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
