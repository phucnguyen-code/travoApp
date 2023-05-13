import 'package:flutter/material.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../../core/helpers/image_helper.dart';

class ItemIntroWidget extends StatelessWidget {
  const ItemIntroWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.sourceImage,
    required this.aligment,
  }) : super(key: key);

  final String title;
  final String description;
  final String sourceImage;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: aligment,
          child: ImageHelper.loadFromAsset(
            sourceImage,
            width: MediaQuery.of(context).size.width,
            height: 400,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
