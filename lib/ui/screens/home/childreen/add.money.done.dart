import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransaxtionDoneScreen extends StatelessWidget {
  const TransaxtionDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09,
                vertical: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * .2,
              ),
              decoration: BoxDecoration(
                color: boutonColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: boutonColorShadow.withOpacity(1),
                    blurRadius: 20,
                    blurStyle: BlurStyle.solid,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: boutonColorShadow.withOpacity(1),
                    blurRadius: 20,
                    blurStyle: BlurStyle.solid,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: boutonColorShadow.withOpacity(1),
                    blurRadius: 20,
                    blurStyle: BlurStyle.solid,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  size: 100,
                  color: backgroundColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Rechargement éffectué',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: boutonColor,
                    fontSize: 24,
                  ),
            ),
            Text(
              'Votre compte a été débité',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: darkColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .2,
            ),
            InkWell(
              onTap: () => Get.offAndToNamed(Routes.homescreen),
              child: const Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
