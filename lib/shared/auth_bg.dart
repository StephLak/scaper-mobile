import 'package:flutter/material.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_images.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/utils/image_factory.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class AuthBg extends StatelessWidget {
  const AuthBg({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: queryHeight(context),
        width: queryWidth(context),
        child: Column(
          children: [
            Stack(
              children: [
                ImageFactory.getImage(AppImages.headerBg).render(),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: queryWidth(context) * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: queryHeight(context) * 0.07,
                        ),
                        Text(
                          title,
                          style: Styles.boldTextStyle(
                            size: 20,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
