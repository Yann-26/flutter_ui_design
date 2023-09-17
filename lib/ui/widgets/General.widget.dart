import 'package:app_use/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({
    super.key,
    required this.theme,
    required this.content,
    required this.iconCenter,
    required this.text,
  });
  final Widget content;
  final TextStyle? theme;
  final Icon iconCenter;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.09,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.close),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  child: text,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.19),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: backgroundColor,
            ),
            child: content,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: circleAvatarColor,
                child: iconCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
