// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../models/form_data_model.dart';
import '../widgets/input_fields.dart';
import '../widgets/date_time_pickers.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final formData = FormDataModel();

  final skills = [
    'Dart',
    'Flutter',
    'Firebase',
    'State Management',
    'REST APIs',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formSectionTitle('Personal Information'),
                      buildTextField(
                        'Full Name',
                        Icons.person,
                        (v) => formData.fullName = v,
                      ),
                      buildTextField(
                        'Email Address',
                        Icons.email,
                        (v) => formData.email = v,
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateEmail,
                      ),
                      buildTextField(
                        'Password',
                        Icons.lock,
                        (v) => formData.password = v,
                        obscureText: true,
                      ),
                      buildTextField(
                        'Phone',
                        Icons.phone,
                        (v) => formData.phone = v,
                        keyboardType: TextInputType.phone,
                      ),
                      buildTextField(
                        'Age',
                        Icons.calendar_today,
                        (v) => formData.age = v,
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 24),
                      formSectionTitle('Demographics', color: Colors.blue),
                      buildDropdown(
                        'Select Gender',
                        Icons.person,
                        formData.gender,
                        ['Male', 'Female', 'Other'],
                        (v) => setState(() => formData.gender = v),
                      ),
                      SizedBox(height: 16),
                      buildDropdown(
                        'Select Country',
                        Icons.public,
                        formData.country,
                        ['saudi arabia', 'Yemenyi', 'Ghazzawi'],
                        (v) => setState(() => formData.country = v),
                      ),

                      SizedBox(height: 24),
                      formSectionTitle('Date & Time', color: Colors.blue),
                      Row(
                        children: [
                          Expanded(
                            child: buildDatePicker(
                              context,
                              formData.birthDate,
                              (date) =>
                                  setState(() => formData.birthDate = date),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: buildTimePicker(
                              context,
                              formData.preferredTime,
                              (time) =>
                                  setState(() => formData.preferredTime = time),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),
                      formSectionTitle(
                        'Skills & Experience',
                        color: Colors.blue,
                      ),
                      buildDropdown(
                        'Experience Level',
                        Icons.work,
                        formData.experience,
                        ['Beginner', 'Intermediate', 'Advanced', 'Expert'],
                        (v) => setState(() => formData.experience = v),
                      ),

                      SizedBox(height: 16),
                      Text(
                        'Programming Skills:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: skills
                            .map(
                              (skill) => FilterChip(
                                label: Text(skill),
                                selected: formData.selectedSkills.contains(
                                  skill,
                                ),
                                onSelected: (selected) {
                                  setState(() {
                                    selected
                                        ? formData.selectedSkills.add(skill)
                                        : formData.selectedSkills.remove(skill);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),

                      SizedBox(height: 16),
                      TextFormField(
                        onChanged: (v) => formData.bio = v,
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Bio',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                      ),
                      SizedBox(height: 24),
                      formSectionTitle(
                        'Rating and preferences',
                        color: Colors.blue,
                      ),
                      Text(
                        'Satisfaction Rating :3.0',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: formData.rating,
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: "${formData.rating.toInt()}/5",
                        onChanged: (v) => setState(() => formData.rating = v),
                      ),
                      

                      Text(
                        'progress level:50%',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: formData.rating,
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: "${formData.rating.toInt()}/5",
                        onChanged: (v) => setState(() => formData.rating = v),
                      ),
                    

                      Text(
                        'Budget Range 20 80 sir',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: formData.rating,
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: "${formData.rating.toInt()}",
                        onChanged: (v) => setState(() => formData.rating = v),
                      ),

                      SwitchListTile(
                        title: Text("i agree to terms and condition"),
                        value: formData.newsletter,
                        onChanged: (v) =>
                            setState(() => formData.newsletter = v),
                        secondary: Icon(Icons.mail),
                      ),

                      CheckboxListTile(
                        title: Text("Agree to Terms"),
                        value: formData.agreeTerms,
                        onChanged: (v) =>
                            setState(() => formData.agreeTerms = v ?? false),
                      ),

                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isFormValid() ? _submitForm : null,
                          child: Text("Submit Form"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Text(
        "Complete Form Example",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) return "Email required";
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Invalid email";
    }
    return null;
  }

  bool _isFormValid() {
    return formData.fullName.isNotEmpty &&
        formData.email.isNotEmpty &&
        formData.password.isNotEmpty &&
        formData.phone.isNotEmpty &&
        formData.age.isNotEmpty &&
        formData.gender != null &&
        formData.country != null &&
        formData.birthDate != null &&
        formData.experience != null &&
        formData.agreeTerms;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("============== FORM DATA ==============");
      print("Full Name: ${formData.fullName}");
      print("Email: ${formData.email}");
      print("Password: ${formData.password}");
      print("Phone: ${formData.phone}");
      print("Age: ${formData.age}");
      print("Gender: ${formData.gender}");
      print("Country: ${formData.country}");
      print("Birth Date: ${formData.birthDate}");
      print("Preferred Time: ${formData.preferredTime}");
      print("Experience: ${formData.experience}");
      print("Skills: ${formData.selectedSkills}");
      print("Bio: ${formData.bio}");
      print("Rating: ${formData.rating}");
      print("Newsletter: ${formData.newsletter}");
      print("Agree Terms: ${formData.agreeTerms}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Form Submitted Successfully")));
    }
  }
}
