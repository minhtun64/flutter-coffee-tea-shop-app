// import 'package:flutter/material.dart';

// import '../../../values/app_regex.dart';

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   // late bool isPasswordHidden;
//   // final TextEditingController usernameController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   isPasswordHidden = true;
//   // }
//   final _formKey = GlobalKey<FormState>();

//   final ValueNotifier<bool> passwordNotifier = ValueNotifier(true);
//   final ValueNotifier<bool> fieldValidNotifier = ValueNotifier(false);

//   late final TextEditingController emailController;
//   late final TextEditingController passwordController;

//   void initializeControllers() {
//     emailController = TextEditingController()..addListener(controllerListener);
//     passwordController = TextEditingController()
//       ..addListener(controllerListener);
//   }

//   void disposeControllers() {
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   void controllerListener() {
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (email.isEmpty && password.isEmpty) return;

//     if (AppRegex.emailRegex.hasMatch(email) &&
//         AppRegex.passwordRegex.hasMatch(password)) {
//       fieldValidNotifier.value = true;
//     } else {
//       fieldValidNotifier.value = false;
//     }
//   }

//   @override
//   void initState() {
//     initializeControllers();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     disposeControllers();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           // style: const TextStyle(color: Colors.white),
//           controller: usernameController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             labelText: 'Tên đăng nhập',
//             fillColor: Colors.white,
//             filled: true,
//             prefixIcon: const Icon(Icons.person),
//           ),
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         TextField(
//           // style: const TextStyle(color: Colors.white),
//           controller: passwordController,
//           obscureText: isPasswordHidden,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             labelText: 'Mật khẩu',
//             fillColor: Colors.white,
//             filled: true,
//             prefixIcon: const Icon(Icons.lock),
//             suffixIcon: IconButton(
//               icon: isPasswordHidden
//                   ? const Icon(Icons.visibility)
//                   : const Icon(Icons.visibility_off),
//               onPressed: () {
//                 setState(() {
//                   isPasswordHidden = !isPasswordHidden;
//                 });
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
