import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/widgets/General.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyInfoScreen extends StatefulWidget {
  const VerifyInfoScreen({super.key});

  @override
  State<VerifyInfoScreen> createState() => _VerifyInfoScreenState();
}

class _VerifyInfoScreenState extends State<VerifyInfoScreen> {
  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _permisController = TextEditingController();
  final TextEditingController _immatriculationContriller = TextEditingController();

  bool _ispermisValide = false;
  bool _immaValide = false;
  bool isChecked = false;

  bool permisValide(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.length < 10) {
      return false;
    }
    return true;
  }

  bool immatriculationValide(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.length < 10) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: background,
      body: GeneralWidget(
        theme: theme.bodyLarge,
        content: Padding(
          padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  bottom: MediaQuery.of(context).size.height * 0.06,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Vos informations",
                      style: theme.headlineLarge?.copyWith(
                        color: darkColor,
                      ),
                    ),
                    Text(
                      "Votre permis et ajoutez un matricule",
                      style: theme.bodyMedium?.copyWith(
                        color: boutonColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Numéro du permis de conduire',
                    style: theme.bodyMedium?.copyWith(
                      color: labelTextField,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _permisController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null) {
                        return 'Numero de telephone requis';
                      } else if (value.length > 10) {
                        return 'Maximum 10 chiffres';
                      } else if (value.length < 10) {
                        return 'Le numéro doit contenir 10 chiffres';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Uniquement des chiffres';
                      }
                      return null;
                    },

                    // controller: controller,

                    obscureText: false,
                    cursorColor: darkColor,
                    style: const TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: backgroundTextField,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.closed_caption_off_rounded,
                        color: darkColor,
                      ),
                      suffixIcon: _ispermisValide
                          ? const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.check_circle_outline_outlined,
                              color: darkColor,
                            ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _ispermisValide = permisValide(value);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Marque de la voiture',
                    style: theme.bodyMedium?.copyWith(
                      color: labelTextField,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  DropdownButtonFormField(
                    style: const TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: backgroundTextField,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.directions_car_filled_outlined,
                        color: darkColor,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        child: Text('Mercedes'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plaque d'immatriculation",
                    style: theme.bodyMedium?.copyWith(
                      color: labelTextField,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _immatriculationContriller,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null) {
                        return 'Numero de telephone requis';
                      } else if (value.length > 10) {
                        return 'Maximum 10 chiffres';
                      } else if (value.length < 10) {
                        return 'Le numéro doit contenir 10 chiffres';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Uniquement des chiffres';
                      }
                      return null;
                    },
                    cursorColor: darkColor,
                    style: const TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: backgroundTextField),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: backgroundTextField,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.directions_car_filled_sharp,
                        color: darkColor,
                      ),
                      suffixIcon: _immaValide
                          ? const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.check_circle_outline_outlined,
                              color: darkColor,
                            ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _immaValide = immatriculationValide(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: boutonColor,
                        fillColor: const MaterialStatePropertyAll(Colors.transparent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(width: 1.0, color: boutonColor),
                        ),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              "En créant un compte, vous acceptez nos \nconditions d'utilisation. ",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
                          children: [
                            TextSpan(
                              text: "Conditions d'utilisation",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: boutonColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Conditions d'utilisation cliquées !");
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  Get.offAndToNamed(Routes.checkotp);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: boutonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "TERMINER L'INSCRIPTION",
                      style: theme.displayLarge?.copyWith(
                        fontSize: 20,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        iconCenter: const Icon(
          Icons.car_rental_rounded,
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
