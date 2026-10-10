import 'package:flutter/material.dart';

import 'pages/control_flow.dart';

// Fungsi utama aplikasi yang menjalankan widget MyApp.
void main() {
  runApp(const MyApp());
}

// Widget akar aplikasi: mengatur judul, tema, dan halaman pertama.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktik Mobile Programming',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1769AA)),
        useMaterial3: true,
      ),
      home: const CourseHomePage(),
    );
  }
}

// Halaman awal yang menampilkan daftar materi untuk minggu ini.
class CourseHomePage extends StatelessWidget {
  const CourseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Programming'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              'asset/logo_unhasy.png',
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: _AppBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 480,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daftar Materi Mobile Programming',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      leading: const CircleAvatar(
                        child: Icon(Icons.account_tree_outlined),
                      ),
                      title: const Text(
                        'Control Flow',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Minggu 1 · Materi dan praktik'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Buka halaman praktik saat materi Control Flow dipilih.
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const ControlFlowPage(),
                          ),
                        );
                      },
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

// Widget latar belakang yang dipakai bersama pada setiap halaman.
class _AppBackground extends StatelessWidget {
  const _AppBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('asset/bg_app.jpg', fit: BoxFit.cover),
        Container(color: const Color.fromRGBO(255, 255, 255, 0.88)),
        child,
      ],
    );
  }
}
