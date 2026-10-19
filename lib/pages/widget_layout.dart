import 'package:flutter/material.dart';

class WidgetLayoutPage extends StatefulWidget {
	const WidgetLayoutPage({super.key});

	@override
	State<WidgetLayoutPage> createState() => _WidgetLayoutPageState();
}

class _WidgetLayoutPageState extends State<WidgetLayoutPage> {
	// Ubah nilai berikut untuk menyesuaikan identitas mahasiswa.
	final String studentName = 'M Fatkhur Rizal';
	final String studentNim = '231234567';
	final String studyProgram = 'Informatika';

	final TextEditingController _usernameController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	String _loginMessage = '';

	@override
	void dispose() {
		_usernameController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	void _handleLogin() {
		setState(() {
			if (_usernameController.text.trim().isEmpty ||
					_passwordController.text.isEmpty) {
				_loginMessage = 'Username/NIM dan password harus diisi.';
			} else {
				_loginMessage = 'Tombol Login berhasil ditekan.';
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		// Scaffold menjadi kerangka halaman dan AppBar menampilkan judul.
		return Scaffold(
			backgroundColor: const Color(0xFFF5F7FA),
			appBar: AppBar(
				title: const Text('Latihan Widget Layout'),
				backgroundColor: Colors.blue,
				foregroundColor: Colors.white,
			),
			// SingleChildScrollView membantu saat layar pendek atau keyboard terbuka.
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(20),
				child: Center(
					// Container membatasi lebar konten agar nyaman dibaca.
					child: Container(
						constraints: const BoxConstraints(maxWidth: 480),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								const SizedBox(height: 8),
								// Center dan ClipOval menampilkan foto bulat di tengah halaman.
								Center(
									child: ClipOval(
										child: Image.asset(
											'asset/rizal.jpg',
											width: 120,
											height: 120,
											fit: BoxFit.cover,
											errorBuilder: (context, error, stackTrace) =>
													const CircleAvatar(
												radius: 60,
												backgroundColor: Color(0xFFDCE6F1),
												child: Icon(Icons.person, size: 64, color: Colors.blue),
											),
										),
									),
								),
								const SizedBox(height: 16),
								Text(
									studentName,
									textAlign: TextAlign.center,
									style: const TextStyle(
										fontSize: 22,
										fontWeight: FontWeight.bold,
										color: Color(0xFF1D2939),
									),
								),
								const SizedBox(height: 6),
								_IdentityRow(icon: Icons.badge_outlined, text: 'NIM: $studentNim'),
								_IdentityRow(
									icon: Icons.school_outlined,
									text: 'Program Studi: $studyProgram',
								),
								const SizedBox(height: 22),
								// Card mengelompokkan form, sementara Padding memberi ruang di dalamnya.
								Card(
									elevation: 2,
									color: Colors.white,
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.circular(18),
									),
									child: Padding(
										padding: const EdgeInsets.all(20),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: [
												const Text(
													'Login Mahasiswa',
													textAlign: TextAlign.center,
													style: TextStyle(
														fontSize: 20,
														fontWeight: FontWeight.bold,
													),
												),
												const SizedBox(height: 20),
												// TextField menerima input dan InputDecoration memberi label serta ikon.
												TextField(
													controller: _usernameController,
													textInputAction: TextInputAction.next,
													decoration: InputDecoration(
														labelText: 'Username atau NIM',
														prefixIcon: const Icon(Icons.person_outline),
														border: OutlineInputBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
												),
												const SizedBox(height: 14),
												TextField(
													controller: _passwordController,
													obscureText: true,
													decoration: InputDecoration(
														labelText: 'Password',
														prefixIcon: const Icon(Icons.lock_outline),
														border: OutlineInputBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
												),
												const SizedBox(height: 20),
												// Tombol hanya memberi respons latihan, bukan autentikasi sungguhan.
												ElevatedButton(
													onPressed: _handleLogin,
													style: ElevatedButton.styleFrom(
														backgroundColor: Colors.blue,
														foregroundColor: Colors.white,
														padding: const EdgeInsets.symmetric(vertical: 14),
														shape: RoundedRectangleBorder(
															borderRadius: BorderRadius.circular(12),
														),
													),
													child: const Text('Login'),
												),
												if (_loginMessage.isNotEmpty) ...[
													const SizedBox(height: 12),
													Text(
														_loginMessage,
														textAlign: TextAlign.center,
														style: TextStyle(
															color: _loginMessage.startsWith('Username')
																	? Colors.red.shade700
																	: Colors.green.shade700,
														),
													),
												],
											],
										),
									),
								),
								const SizedBox(height: 8),
							],
						),
					),
				),
			),
		);
	}
}

// Row menyusun ikon dan teks identitas secara horizontal.
class _IdentityRow extends StatelessWidget {
	const _IdentityRow({required this.icon, required this.text});

	final IconData icon;
	final String text;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 3),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					Icon(icon, size: 18, color: Colors.blueGrey),
					const SizedBox(width: 7),
					Text(text, style: const TextStyle(color: Colors.blueGrey)),
				],
			),
		);
	}
}
