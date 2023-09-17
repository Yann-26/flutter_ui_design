import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/widgets/General.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  void setSelectedRadio(int? value) {
    setState(() {
      selectedRadio = value;
    });
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
                height: MediaQuery.of(context).size.height * 0.08,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ajouter de l'argent à",
                      style: theme.bodySmall?.copyWith(
                        color: darkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "votre portefeuille életronique",
                      style: theme.bodySmall?.copyWith(
                        color: darkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .1,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundTextField,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Numéro de téléphone',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) => value == null ? 'champ obligatoire' : null,
                          style: const TextStyle(
                            color: darkColor,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.sizeOf(context).height * .1,
                    width: MediaQuery.sizeOf(context).width * .6,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundTextField,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Montant',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) => value == null ? 'champ obligatoire' : null,
                          style: const TextStyle(
                            color: darkColor,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text(
                      'F CFA',
                      style: TextStyle(fontSize: 40),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Se recharger avec :',
                    style: theme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      _buildOption(0, 'Tresor Pay'),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildOption(1, 'Orange Money'),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildOption(2, 'Wave'),
                    ],
                  ),
                ],
              ),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  _showDialog(context);
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.sizeOf(context).width * .4,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: boutonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "CONTINUER",
                        style: theme.displayLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        iconCenter: const Icon(
          Icons.add_card_rounded,
          size: 80,
          color: backgroundColor,
        ),
        text: const Text(
          "",
        ),
      ),
    );
  }

  Widget _buildOption(int value, String label) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const CircleAvatar(
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/images/orange.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Radio(
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          fillColor: const MaterialStatePropertyAll(boutonColor),
          value: value,
          groupValue: selectedRadio,
          onChanged: (newValue) {
            setSelectedRadio(newValue as int?);
          },
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .3,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 90),
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: backgroundTextField,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundColor: backgroundColor,
                            child: Icon(
                              Icons.phone_android_rounded,
                              size: 45,
                              color: darkColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: 80,
                          child: Lottie.asset(
                            'assets/lotties/IPnjwWC9Hp.json',
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Tapez #144*82#, entrez votre code secret et entrez ici le code tempraire.",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: labelTextField,
                              fontSize: 12,
                            ),
                        softWrap: true,
                        textAlign: TextAlign.center,
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
                      fieldWidth: 45,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                      onCompleted: (value) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: boutonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Get.offAndToNamed(Routes.transacdone);
                },
                child: const Text('Valider le payement'),
              ),
            ],
          ),
        );
      },
    );
  }
}
