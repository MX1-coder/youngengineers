import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ye_app/app/views/widgets/drawer.dart';
import '../widget/custom_textfield.dart';

class SignUpStudent extends StatefulWidget {
  const SignUpStudent({super.key});

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  String _selectedItem = 'Select Program'; // Default selected item

  List<String> _dropdownItems = [
    'Select Program',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
  late DateTime selectedStartDate;
  late DateTime selectedEndDate;

  TextEditingController _dateStartController = TextEditingController();
  TextEditingController _dateEndController = TextEditingController();
  bool isSelectStart = false;
  bool isSelectEnd = false;

  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedStartDate = DateTime.now();
    selectedEndDate = DateTime.now();

    _dateStartController.text = dateFormat.format(selectedStartDate);
    _dateEndController.text = dateFormat.format(selectedEndDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
        _dateStartController.text = dateFormat.format(selectedStartDate);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
        _dateEndController.text = dateFormat.format(selectedEndDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Color.fromRGBO(145, 181, 8, 1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Hi'), Text('Deepesh@Youngengineers.org')],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      endDrawer: CustomDrawer(),

      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_login.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 70, bottom: 70),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up New Student',
                          style: TextStyle(
                              fontSize: 25, color: Colors.blue.shade900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(hintText: 'Student First Name'),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(hintText: 'Student Last Name'),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(hintText: 'Parent Name'),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(hintText: 'Username(Email)'),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(hintText: 'Phone'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            style: TextStyle(color: Colors.black), // Text color

                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            borderRadius: BorderRadius.circular(15),
                            isExpanded: true,
                            value: _selectedItem,
                            items: _dropdownItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedItem = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 55,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 110, child: Text('Lesson Start Date')),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                // height: 60,
                                // width: 200,
                                child: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: TextFormField(
                                    controller: _dateStartController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () => _selectDate(context),
                                          icon: Icon(Icons.calendar_today),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 55,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 110, child: Text('Lesson End Date  ')),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                // height: 60,
                                // width: 200,
                                child: GestureDetector(
                                  onTap: () => _selectEndDate(context),
                                  child: TextFormField(
                                    controller: _dateEndController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              _selectEndDate(context),
                                          icon: Icon(Icons.calendar_today),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 55,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 110, child: Text('Number Of Lessons')),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  // height: 60,
                                  // width: 200,
                                  child: CustomTextField(hintText: ''))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue.shade900),
                            child: Center(
                              child: Text(
                                'Add Student',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'User name and password will be sent to parent email and to your email: deepesh@youngengineers.org',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
