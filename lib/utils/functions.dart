import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_use/ui/styles/colors.style.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

void preCacheImages(BuildContext context) {
  // PRECACHE SVG
  // precachePicture(
  //     SvgPicture.asset("<<path>>").pictureProvider, context);

  // PRECACHE PNG, JPG, JPEG
  // precacheImage(Image.asset("<<path>>").image, context);
}

// ignore: non_constant_identifier_names
Future<dynamic> confirmAlert(
  BuildContext context,
  String? title,
  String message,
  String confirmButtonText,
  String cancelButtonText,
  dynamic Function() onConfirm,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: title != null
            ? Text(
                title,
                style: const TextStyle(
                  color: textSecondaryColor,
                  fontSize: 20,
                ),
              )
            : null,
        content: Text(
          message,
          style: const TextStyle(
            color: textPrimaryColor,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          OutlinedButton(
            onPressed: () => Get.back(result: false),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: dangerColor, width: 1.5),
            ),
            child: Text(
              cancelButtonText,
              style: const TextStyle(
                color: dangerColor,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onConfirm,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: primaryColor, width: 1.5),
            ),
            child: Text(
              confirmButtonText,
              style: const TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}

// ignore: non_constant_identifier_names
void ShowSimpleAlert(
    BuildContext context, String? title, String? message, String buttonText) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            title!,
            style: const TextStyle(
              color: secondaryColor,
              fontSize: 20,
            ),
          ),
          content: Text(
            message!,
            style: const TextStyle(
              color: textPrimaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        );
      });
}

void showSnackbar(
    {required String title,
    required String message,
    required Color backgroundcolor}) {
  Get.snackbar(
    title,
    message,
    colorText: backgroundColor,
    backgroundColor: backgroundcolor,
    snackPosition: SnackPosition.BOTTOM,
  );
}
