import 'package:flutter/material.dart';

class ContributionItem {
  final String number;
  final String title;
  final Color bgColor;
  final Color textColor;

  ContributionItem({
    required this.number,
    required this.title,
    required this.bgColor,
    required this.textColor,
  });
}

final List<ContributionItem> contributionData = [
  ContributionItem(
    number: '1K+',
    title: 'Blood Donner',
    bgColor: const Color.fromARGB(255, 185, 222, 237),
    textColor: Colors.blue,
  ),
  ContributionItem(
    number: '20',
    title: 'Post Everyday',
    bgColor: Colors.lightGreen,
    textColor: Colors.green,
  ),
  ContributionItem(
    number: '20',
    title: 'Post Everyday',
    bgColor: const Color.fromARGB(255, 174, 215, 234),
    textColor: Colors.purple,
  ),
  ContributionItem(
    number: '1K+',
    title: 'Blood Donner',
    bgColor: Colors.blueGrey,
    textColor: Colors.pink,
  ),
  ContributionItem(
    number: '20',
    title: 'Post Everyday',
    bgColor: Colors.lightBlue,
    textColor: Colors.red,
  ),
  ContributionItem(
    number: '20',
    title: 'Post Everyday',
    bgColor: const Color.fromARGB(255, 189, 237, 232),
    textColor: Colors.yellowAccent,
  ),
];
