import 'package:flutter/material.dart';

class FormDataModel {
  String fullName = '';
  String email = '';
  String password = '';
  String phone = '';
  String age = '';
  String? gender;
  String? country;
  String? experience;
  DateTime? birthDate;
  TimeOfDay? preferredTime;
  List<String> selectedSkills = [];
  String bio = '';
  double rating = 1.0;
  bool newsletter = false;
  bool agreeTerms = false;
}
