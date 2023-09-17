import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/widgets/General.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _namController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isPhoneNumberValid = false;
  bool _isNameValide = false;
  bool _isPasswordValide = false;
  bool isChecked = false;

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

  bool namValide(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.length < 10) {
      return false;
    }
    return true;
  }

  bool passwordValide(String value) {
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
                        "Inscription",
                        style: theme.headlineLarge?.copyWith(
                          color: darkColor,
                        ),
                      ),
                      Text(
                        "Créez votre compte et continuez",
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
                      'Votre nom',
                      style: theme.bodyMedium?.copyWith(
                        color: labelTextField,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: _namController,
                      keyboardType: TextInputType.text,
                      validator: (value) => value == null ? 'Nom obligatoire' : null,

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
                          Icons.person_outline_outlined,
                          color: darkColor,
                        ),
                        suffixIcon: _isNameValide
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
                          _isNameValide = namValide(value);
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
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mot de passe',
                      style: theme.bodyMedium?.copyWith(
                        color: labelTextField,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: _passController,
                      keyboardType: TextInputType.text,
                      validator: (value) => value == null ? 'Mot de passe obligatoire' : null,
                      obscureText: true,
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
                          Icons.lock_outlined,
                          color: darkColor,
                        ),
                        suffixIcon: _isPasswordValide
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
                          _isPasswordValide = passwordValide(value);
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
                        )
                      ],
                    )
                  ],
                ),
                InkWell(
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    Get.offAndToNamed(Routes.verifiyInfo);
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
                        "CONTINUER",
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
            Icons.person_outline_rounded,
            size: 90,
            color: backgroundColor,
          ),
          text: RichText(
            text: TextSpan(
              text: "Vous avez déjà un compte?  ",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
              children: [
                TextSpan(
                  text: "Connexion",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: boutonColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offAndToNamed(Routes.login);
                    },
                ),
              ],
            ),
          )),
    );
  }
}
