import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String nama = 'Donald Trump';
    const int umur = 77;
    const double tinggi = 1.88;
    const bool mahasiswa = true;
    const double berat = 200.0;
    const int jumlahHobi = 5;

    return MaterialApp(
      title: 'Klinik',
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'asset/logo_unhasy.png',
            height: 56,
            fit: BoxFit.contain,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Versi 1.0.0', style: TextStyle(color: Colors.white)),
                Text(
                  'Create by : Bondan Prakoso',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: _AppBackground(
          child: Builder(
            builder: (context) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    ),
                    const SizedBox(height: 16),
                    Text('Nama: $nama'),
                    Text('Umur: $umur'),
                    Text('Tinggi: $tinggi'),
                    Text('Mahasiswa: $mahasiswa'),
                    Text('Berat: $berat'),
                    Text('Jumlah Hobi: $jumlahHobi'),
                    const _HobbyDropdown(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBackground extends StatelessWidget {
  const _AppBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('asset/bg_app.jpg', fit: BoxFit.cover),
        Container(color: const Color.fromRGBO(255, 255, 255, 0.72)),
        child,
      ],
    );
  }
}

class _HobbyDropdown extends StatefulWidget {
  const _HobbyDropdown();

  @override
  State<_HobbyDropdown> createState() => _HobbyDropdownState();
}

class _HobbyDropdownState extends State<_HobbyDropdown> {
  static const List<String> _hobbies = ['Membaca', 'Menulis', 'Berenang'];
  String _selectedHobby = _hobbies.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedHobby,
      items: _hobbies
          .map((hobby) => DropdownMenuItem(value: hobby, child: Text(hobby)))
          .toList(),
      onChanged: (hobby) {
        if (hobby != null) {
          setState(() => _selectedHobby = hobby);
        }
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _loginError;

  void _login() {
    final isValid = _formKey.currentState!.validate();
    setState(() {
      _loginError = isValid
          ? 'Login gagal. Periksa username dan password Anda.'
          : 'Username dan password wajib diisi.';
    });
  }

  void _showPasswordHelp() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Lupa Password'),
        content: const Text(
          'Fitur reset password belum tersedia. Silakan hubungi administrator aplikasi.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: _AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Username wajib diisi'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Password wajib diisi'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: _login,
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    ),
                    if (_loginError != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _loginError!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _showPasswordHelp,
                        icon: const Icon(Icons.help_outline),
                        label: const Text('Lupa Password'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
