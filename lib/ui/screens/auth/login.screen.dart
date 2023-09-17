import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/widgets/General.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/text_field.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _isPhoneNumberValid = false;

  bool numeroValide(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length != 10) {
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
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
                      "Connexion",
                      style: theme.headlineLarge?.copyWith(
                        color: darkColor,
                      ),
                    ),
                    Text(
                      "Veuillez renseigner vos informations",
                      style: theme.bodyMedium?.copyWith(
                        color: boutonColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Numéro de téléphone',
                      style: theme.bodyMedium?.copyWith(
                        color: labelTextField,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
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
                          Icons.phone_android_rounded,
                          color: darkColor,
                        ),
                        suffixIcon: _isPhoneNumberValid
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
                          _isPhoneNumberValid = numeroValide(value);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                controller: passController,
                theme: theme,
                label: "Mot de passe",
                obscure: true,
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: darkColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  Get.offAndToNamed(Routes.homescreen);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: boutonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "CONNEXION",
                      style: theme.displayLarge?.copyWith(
                        fontSize: 20,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  Get.offAndToNamed(Routes.signup);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: backgroundTextField,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Créer un compte",
                      style: theme.displayMedium?.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        iconCenter: const Icon(
          Icons.person_outline_rounded,
          size: 90,
          color: backgroundColor,
        ),
        text: Text(
          "Mot de passe oublié ?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
