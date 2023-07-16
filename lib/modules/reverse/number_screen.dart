import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: [
        SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
        "assets/Images/x3.png",
        fit: BoxFit.cover,
    ),
    ),
    SlidingUpPanel(
    panel: Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
    ),
    color: Colors.white,
    ),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    "Car Number",
    style: TextStyle(
    fontSize: 24,
    fontFamily: "SF Pro Disblay",
    ),
    ),
     SizedBox(
    height: 30,
    ),
     Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
    "Your number",
    style: TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontFamily: "SF Pro Disblay Pro",
    ),
    ),
    ),
    SizedBox(
    width: 340,
    child: TextFormField(
    validator: (value) {
    if (value != null && value.isEmpty) {
    return "This Field cannot be empty!";
    }
    return null;
    },
    decoration: InputDecoration(
    hintText: 'Enter your car number',
    helperStyle: const TextStyle(
    color: Colors.grey,
    fontFamily: "SF Pro Disblay ProRR",
    fontSize: 18,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
    width: 2,
    color:
    const Color(0xff4A4845).withOpacity(0.1),
    ),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
    width: 2,
    color:
    const Color(0xff4A4845).withOpacity(0.1),
    ),
    ),
    ),
    ),
    ),
    const SizedBox(
    height: 30,
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Container(
    width: 107,
    height: 48,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
    width: 1,
    color:  Color(0xff252527),
    ),
    ),
    child:  Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Back",
    style: TextStyle(
    fontSize: 18,
    fontFamily: "SF Pro Disblay Pro"),
    ),
    Icon(
    Icons.arrow_forward_ios,
    size: 15,
    ),
    ],
    ),
    ),
    ),
    const SizedBox(
    width: 22,
    ),
    InkWell(
    onTap: () {
    if (_formKey.currentState!.validate()) {
    // TODO : NAVIGATOR TO ANOTHER SCREEN OR DO SOMETHING
    } else {
    // TODO : SHow toast or something
    print("Not valid");
    }
    },
    child: Container(
    width: 205,
    height: 48,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: const Color.fromARGB(
    255,
    68,
    184,
    219,
    ),
    ),
    child:  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Continue",
    style: TextStyle(
    fontSize: 18,
    fontFamily: "SF Pro Disblay Pro",
    ),
    ),
    Icon(
    Icons.arrow_right_alt,
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    minHeight: 80,
    maxHeight: MediaQuery.of(context).size.height / 1.5,
    borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    ),
    ),
    Positioned(
    top: 150,
    left: 30,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CircleAvatar(
    maxRadius: 40,
    minRadius: 40,
    backgroundImage: AssetImage("assets/Images/x33.jpg"),
    ),
    SizedBox(
    height: 10,
    ),
      Text(
        "Stefn Fancik",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: "SF Pro Disbly",
        ),
      ),
      SizedBox(
        height: 5,
      ),
      
    ],
    ),
    ),
        ],
        ),
    );
  }
}