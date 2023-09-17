import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/widgets/General.widget.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:flutter/material.dart';

class OtpCheckScreen extends StatefulWidget {
  const OtpCheckScreen({super.key});

  @override
  State<OtpCheckScreen> createState() => _OtpCheckScreenState();
}

class _OtpCheckScreenState extends State<OtpCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: background,
      body: GeneralWidget(
        theme: Theme.of(context).textTheme.bodyLarge,
        content: Padding(
          padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  bottom: MediaQuery.of(context).size.height * 0.06,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Confirmation du N°",
                      style: theme.headlineLarge?.copyWith(
                        color: darkColor,
                      ),
                    ),
                    Text(
                      "Veuillez entrer le code reçu au",
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "+225 0440505585",
                      style: theme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              OTPTextField(
                keyboardType: TextInputType.number,
                length: 4,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: backgroundTextField,
                  borderColor: backgroundTextField,
                ),
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                onCompleted: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Je n'ai pas reçu le code.  ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Renvoyer le code.',
                      style: TextStyle(
                        color: boutonColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .16,
              ),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(Routes.homescreen);
                },
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: boutonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'continer'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "En me connectant, j'accepte ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'la police de confidentialité',
                      style: TextStyle(
                        color: boutonColor,
                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        iconCenter: const Icon(
          Icons.person_outline_rounded,
          size: 90,
          color: backgroundColor,
        ),
        text: const Text(
          "",
        ),
      ),
    );
  }
}
