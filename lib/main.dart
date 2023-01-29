import 'package:flutter/material.dart';
import 'package:flutter_conversor/app/controllers/home_controller.dart';

import 'app/components/currency_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();
  HomeController? homeController;
  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 20, left: 20),
        child: Column(
          children: [
            Image.asset("assets/logo.png"),
            SizedBox(height: 20),
            CurrencyBox(
                selectedItem: homeController!.toCurrency,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController!.toCurrency = model!;
                  });
                },
                controller: toText),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController!.fromCurrency,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController!.fromCurrency = model!;
                  });
                },
                controller: fromText),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  homeController!.convert();
                });
                },
              child: Text("CONVERTER"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.amber)),
            )
          ],
        ),
      ),
    ));
  }
}
