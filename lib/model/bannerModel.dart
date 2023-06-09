import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  new BannerModel(
      "News",
      [
        Color(0xffa1d4ed),
        Color(0xffc0eaff),
      ],
      "assets/415.jpg"),
  new BannerModel(
      "Covid-19",
      [
        Color(0xffb6d4fa),
        Color(0xffcfe3fc),
      ],
      "assets/covid-bg.png"),
  new BannerModel(
      "Check disease",
      [
        Color(0xffb6d4fa),
        Color(0xffcfe3fc),
      ],
      "assets/414-bg.png"),
  new BannerModel(
      "Check disease",
      [
        Color(0xffb6d4fa),
        Color(0xffcfe3fc),
      ],
      "assets/414-bg.png"),

];
