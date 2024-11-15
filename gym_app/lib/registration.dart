import 'package:flutter/material.dart';
import 'package:gym_app/text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String? _gender;
  String? _packageType;
  String? _price;

  void _updatePrice(String package){
    setState(() {
_packageType = package;
switch(package)
    {
  case 'Standard':
    _price = '30 \$';
    break;
  case 'Ultimate':
    _price = '45 \$';
    break;
  case 'Professional':
    _price = '60 \$';
    break;
    default:
      _price = "";
      break;
    }
_priceController.text = _price ?? " ";
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Register For MemberShip",
                      style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _nameController,
                    hintText: "Enter Your Name",
                    obscureText: false,
                    prefixIcon: Icons.person,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _emailController,
                    hintText: "Enter Your Email",
                    obscureText: false,
                    prefixIcon: Icons.mail,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFieldInput(
                    controller: _phoneController,
                    hintText: "Enter Your Phone Number",
                    obscureText: false,
                    prefixIcon: Icons.phone,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  DropdownInput(
                    value: _gender,
                    prefixIcon: Icons.person,
                    hintText: 'Select the Gender',
                    items:const  ['Male','Female'],
                    onChanged: (value) {
                      if (value != null) {
                        _gender = value;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Gender';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  DropdownInput(
                    value: _packageType,
                    prefixIcon: Icons.shopping_cart,
                    hintText: 'Select the Package',
                    items: const ['Standard', 'Ultimate', 'Professional'], onChanged: (value) {
                      if (value != null) {
                        _updatePrice(value);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a Package';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Price',
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      prefixIcon: const Icon(Icons.price_check, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    readOnly: true,
                    validator: (value) => value == null || value.isEmpty ?'Plase Select a Packge' : null,
                  ),
                  const SizedBox(height: 16),

                  TextFieldInput(
                    controller: _messageController,
                    hintText: "Enter Your Message",
                    obscureText: false,
                    prefixIcon: Icons.message,
                    fillColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 15.0),
                        child:  Text("Register",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.blue)))
                  ),
                  const SizedBox(height: 24),
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
