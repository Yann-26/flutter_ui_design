import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/transaction.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Transaction> transactions = [
    Transaction(
      colorText: Colors.red,
      title: 'Excès de vitesse',
      date: '01/02/2023 : 08H20',
      amount: '-2000 fcfa',
      image: const AssetImage('assets/images/orange.png'),
    ),
    Transaction(
      colorText: Colors.green,
      title: 'Ajout de fond',
      date: '03/02/2023 : 12H20',
      amount: '+ 15 000 fcfa',
      image: const AssetImage('assets/images/done-image.png'),
    ),
    Transaction(
      title: 'Conduite en sens inverse',
      date: '04/01/2023 : 12H20',
      amount: '-10 000 fcfa',
      image: const AssetImage('assets/images/orange.png'),
      colorText: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: const Drawer(
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: boutonColor,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_outlined,
                  size: 85,
                  color: backgroundColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenue',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "M'lan Alban",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10 625 FCFA",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  Text(
                    'Votre solde',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  Get.offAndToNamed(Routes.addmoney);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: circleAvatarColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: backgroundColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                color: background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 5,
                      width: 45,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'vos recentes transactions'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.history_outlined,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: buildTransactionRow(transactions[index]),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {},
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: boutonColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.qr_code_scanner_outlined,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                          Text(
                            'Scanner',
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .04,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransactionRow(Transaction transaction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipOval(
                child: Image(
                  image: transaction.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  transaction.date,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          transaction.amount.toUpperCase(),
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            fontWeight: FontWeight.w700,
            color: transaction.colorText,
          ),
        ),
      ],
    );
  }
}
