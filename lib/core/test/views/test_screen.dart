import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/core/test/controller/test_controller.dart';
import 'package:scaper_mobile/shared/custom_button.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TestController controller = Get.put(TestController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dialog Test")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    Text(
                      controller.currentNode.value!.text,
                      style: Styles.regularTextStyle(size: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ...controller.currentNode.value!.options
                        .map((option) => ElevatedButton(
                              onPressed: () => controller.selectOption(option),
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
              )),
        ),
      ),
    );
  }
}
