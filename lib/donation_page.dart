import 'package:flutter/material.dart';

class Donor {
  final String name;
  final int age;
  final String bloodGroup;

  Donor({required this.name, required this.age, required this.bloodGroup});
}

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final List<Donor> donors = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  void addDonor() {
    final String name = nameController.text;
    final int? age = int.tryParse(ageController.text);
    final String bloodGroup = bloodGroupController.text;

    if (name.isNotEmpty && age != null && bloodGroup.isNotEmpty) {
      setState(() {
        donors.add(Donor(name: name, age: age, bloodGroup: bloodGroup));
      });
      nameController.clear();
      ageController.clear();
      bloodGroupController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Donors')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: bloodGroupController,
              decoration: InputDecoration(labelText: 'Blood Group'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addDonor, child: Text('Add Donor')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: donors.length,
                itemBuilder: (context, index) {
                  final donor = donors[index];
                  return Card(
                    child: ListTile(
                      title: Text(donor.name),
                      subtitle: Text(
                        'Age: ${donor.age}, Blood Group: ${donor.bloodGroup}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
