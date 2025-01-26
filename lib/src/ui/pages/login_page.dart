import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAdmin = true; // State to track the toggle button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Container(
        height: MediaQuery.of(context).size.height, // Set height to full screen
        padding: const EdgeInsets.symmetric(horizontal: 41), // Adjust padding
        child: Center( // Center the content vertically
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center elements vertically
              children: [
                ToggleButton(
                  isAdmin: isAdmin,
                  onToggle: (value) {
                    setState(() {
                      isAdmin = value; // Update the state on toggle
                    });
                  },
                ),
                const SizedBox(height: 20), // Adjusted spacing
                SvgPicture.asset(
                  'lib/src/ui/assets/images/4668855.svg', // Load the working asset
                  width: 300, // Set desired width
                  height: 300, // Set desired height
                ),
                const SizedBox(height: 16), // Adjusted gap
                const InputField(
                  label: 'email',
                  placeholder: 'johndoe@example.com',
                  type: TextInputType.emailAddress,
                ),
                const InputField(
                  label: 'password',
                  placeholder: 'johndoe123**',
                  isPassword: true,
                ),
                const LoginButton(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Toggle Button Widget
class ToggleButton extends StatelessWidget {
  final bool isAdmin;
  final ValueChanged<bool> onToggle;

  const ToggleButton({
    Key? key,
    required this.isAdmin,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: const BoxConstraints(maxWidth: 300),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(true), // Toggle to Admin
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isAdmin ? const Color(0xFF2C2C2C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: isAdmin ? Colors.white : const Color.fromRGBO(158, 158, 158, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(false), // Toggle to User
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isAdmin ? Colors.transparent : const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'User',
                    style: TextStyle(
                      color: isAdmin ? const Color.fromRGBO(158, 158, 158, 1) : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Input Field Widget
class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final TextInputType? type;

  const InputField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: isPassword,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Login Button Widget
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2C2C2C),
            padding: const EdgeInsets.symmetric(vertical: 17),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}