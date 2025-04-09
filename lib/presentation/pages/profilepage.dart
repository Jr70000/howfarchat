import 'package:flutter/material.dart';
import 'package:howfarchat/presentation/pages/all_new_userpage.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  late TextEditingController _textController5;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
    _textController5 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 24, color: Color(0xFFD9D9D9)),
        ),
        backgroundColor: const Color(0xFF1A2947),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Icon(
              Icons.menu,
              color: Color(0xFFD9D9D9),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFF1A2947),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Container(
                height: 112,
                width: 112,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(70, 80, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_rounded),
                    iconSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController1,
              decoration: const InputDecoration(
                labelText: 'Birthday',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController2,
              decoration: const InputDecoration(
                labelText: 'First name',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController3,
              decoration: const InputDecoration(
                labelText: 'Last name',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController4,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController5,
              decoration: const InputDecoration(
                labelText: 'Location',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 65,
              width: 345,
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(16)),
              child: Stack(
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-0.93, -0.82),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.black, // Change to desired color
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                            child: Radio(
                              value: 'male',
                              groupValue: _selectedGender,
                              onChanged: (val) {
                                setState(() {
                                  _selectedGender = val;
                                });
                              },
                            ),
                          ),
                          const Text('Male'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Radio(
                              value: 'female',
                              groupValue: _selectedGender,
                              onChanged: (val) {
                                setState(() {
                                  _selectedGender = val;
                                });
                              },
                            ),
                          ),
                          const Text('Female'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(34, 0, 0, 0),
                            child: Radio(
                              value: 'other',
                              groupValue: _selectedGender,
                              onChanged: (val) {
                                setState(() {
                                  _selectedGender = val;
                                });
                              },
                            ),
                          ),
                          const Text('Other'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              width: 267,
              child: ElevatedButton(
                onPressed: _selectedGender != null ? _saveData : null,
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFFFBD512)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveData() {
  // Here, you can save the profile data including the selected gender
  print('Selected gender: $_selectedGender');

  // Navigate to another page
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AllUserPage()),
  );
}
}