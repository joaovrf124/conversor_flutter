import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/currency_view.dart';

class HomeController {
  late List<CurrencyModel>  currencies;
  late CurrencyModel toCurrency ;
  late CurrencyModel fromCurrency;
  TextEditingController toText;
  TextEditingController fromText;

  HomeController({required this.toText,required this.fromText}){
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies![0];
    fromCurrency = currencies![1];
  }

  convert(){
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double? returnValue;
    if(fromCurrency!.name == "Real"){
      returnValue = value * toCurrency!.real;
    }

    if(fromCurrency!.name == "Dolar"){
      returnValue = value * toCurrency!.dolar;
    }

    if(fromCurrency!.name == "Euro"){
      returnValue = value * toCurrency!.euro;
    }

    if(fromCurrency!.name == "Bitcoin"){
      returnValue = value * toCurrency!.bitcoin;
    }
      
      fromText.text = returnValue.toString();
  }

}