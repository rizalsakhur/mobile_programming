import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
	const LoginPage({super.key});

	@override
	State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
	final _usernameController = TextEditingController();
	final _passwordController = TextEditingController();
	bool _obscurePassword = true;

	@override
	void dispose() {
		_usernameController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	void _showMessage(String message) {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(content: Text(message)),
		);
	}

	@override
	Widget build(BuildContext context) {
		const primaryColor = Color(0xFF146C43);

		return Scaffold(
			backgroundColor: const Color(0xFFF7F9F8),
			body: SafeArea(
				child: Center(
					child: SingleChildScrollView(
						padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
						child: ConstrainedBox(
							constraints: const BoxConstraints(maxWidth: 440),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									Align(
										alignment: Alignment.centerLeft,
										child: Image.asset(
											'asset/logo_unhasy.png',
											height: 72,
											fit: BoxFit.contain,
											errorBuilder: (context, error, stackTrace) =>
													const SizedBox(
												height: 72,
												child: Align(
													alignment: Alignment.centerLeft,
													child: Icon(Icons.school, size: 56, color: primaryColor),
												),
											),
										),
									),
									const SizedBox(height: 40),
									Row(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											const Expanded(
												child: Text(
													'Formulir Pendaftaran\nSEVIMA',
													style: TextStyle(
														fontSize: 25,
														height: 1.25,
														fontWeight: FontWeight.bold,
														color: Color(0xFF202A25),
													),
												),
											),
											TextButton(
												onPressed: () => _showMessage('Halaman register'),
												child: const Text('Register'),
											),
										],
									),
									const SizedBox(height: 28),
									TextField(
										controller: _usernameController,
										keyboardType: TextInputType.text,
										textInputAction: TextInputAction.next,
										decoration: InputDecoration(
											labelText: 'Username',
											hintText: 'Masukkan username',
											prefixIcon: const Icon(Icons.person_outline),
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(12),
											),
										),
									),
									const SizedBox(height: 16),
									TextField(
										controller: _passwordController,
										obscureText: _obscurePassword,
										textInputAction: TextInputAction.done,
										decoration: InputDecoration(
											labelText: 'Password',
											hintText: 'Masukkan password',
											prefixIcon: const Icon(Icons.lock_outline),
											suffixIcon: IconButton(
												tooltip: _obscurePassword
														? 'Tampilkan password'
														: 'Sembunyikan password',
												onPressed: () => setState(
													() => _obscurePassword = !_obscurePassword,
												),
												icon: Icon(
													_obscurePassword
															? Icons.visibility_outlined
															: Icons.visibility_off_outlined,
												),
											),
											filled: true,
											fillColor: Colors.white,
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(12),
											),
										),
									),
									Align(
										alignment: Alignment.centerRight,
										child: TextButton(
											onPressed: () => _showMessage('Pemulihan password'),
											child: const Text('Lupa password?'),
										),
									),
									const SizedBox(height: 8),
									SizedBox(
										height: 52,
										child: ElevatedButton(
											onPressed: () {
												if (_usernameController.text.trim().isEmpty ||
														_passwordController.text.isEmpty) {
													_showMessage('Username dan password wajib diisi.');
													return;
												}
												_showMessage('Login berhasil dikirim.');
											},
											style: ElevatedButton.styleFrom(
												backgroundColor: primaryColor,
												foregroundColor: Colors.white,
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(12),
												),
											),
											child: const Text(
												'Login',
												style: TextStyle(
													fontSize: 16,
													fontWeight: FontWeight.w600,
												),
											),
										),
									),
								],
							),
						),
					),
				),
			),
		);
	}
}
