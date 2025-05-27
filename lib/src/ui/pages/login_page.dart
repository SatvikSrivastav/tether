import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'forgot_password.dart'; // Import the ForgotPassword page
import 'dashboard_page.dart'; // Import the DashboardPage

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        title: const Text('Login'), // Add a title to the AppBar
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove the shadow
        centerTitle: true, // Center the title
      ),
      body: Container(
        // Removed fixed height to allow scrolling
        padding: const EdgeInsets.symmetric(horizontal: 41), // Adjust padding
        child: SingleChildScrollView( // Main content is scrollable
          // Removed Center widget as SingleChildScrollView handles layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align items to the start, allowing scroll from top
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally within the available width
            children: [
              const SizedBox(height: 60), // Add some space at the top to account for AppBar
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
              LoginButton(
                 onPressed: () {
                  print('Login button tapped!'); // Added print statement
                  // Navigate to the DashboardPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardPage()),
                  );
                },
              ), // Pass the navigation logic to the button
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword()), // Navigate to ForgotPassword
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some space at the bottom
            ],
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
  final VoidCallback? onPressed; // Add onPressed callback

  const LoginButton({Key? key, this.onPressed}) : super(key: key); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: onPressed, // Use the provided onPressed callback
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
