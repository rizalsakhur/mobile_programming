import 'package:flutter/material.dart';

// Halaman praktik berisi contoh kode dan hasil dari setiap control flow.
class ControlFlowPage extends StatefulWidget {
  const ControlFlowPage({super.key});

  @override
  State<ControlFlowPage> createState() => _ControlFlowPageState();
}

// Mengelola nilai interaktif pada contoh If dan Else.
class _ControlFlowPageState extends State<ControlFlowPage> {
  // Nilai awal kondisi libur pada contoh If dan Else.
  bool _isHoliday = true;

  @override
  Widget build(BuildContext context) {
    // Menjalankan percabangan If dan Else untuk menentukan teks hasil.
    final libur = _isHoliday;
    final String ifElseOutput;
    if (libur == true) {
      ifElseOutput = 'Hari ini Libur';
    } else {
      ifElseOutput = 'Hari ini Tidak Libur';
    }

    // Menjalankan contoh for dan menampung angka yang akan ditampilkan.
    final forOutput = <String>[];
    for (var angka = 1; angka <= 5; angka++) {
      forOutput.add('$angka');
    }

    // Menjalankan contoh for-in dan forEach pada sebuah List.
    final angkaList = [1, 2, 3];
    final forInOutput = <String>[];
    for (final item in angkaList) {
      forInOutput.add('$item');
    }
    final forEachOutput = <String>[];

    // Fungsi bernama ini dipanggil oleh forEach untuk menampung setiap item.
    void simpanHasilForEach(int item) {
      forEachOutput.add('$item');
    }

    angkaList.forEach(simpanHasilForEach);

    // Menjalankan contoh while dan menampung hasil perulangannya.
    final whileOutput = <String>[];
    var angkaWhile = 1;
    while (angkaWhile <= 5) {
      whileOutput.add('$angkaWhile');
      angkaWhile++;
    }

    // Menjalankan contoh do-while, yang memeriksa kondisi setelah perintah.
    final doWhileOutput = <String>[];
    var angkaDoWhile = 1;
    do {
      doWhileOutput.add('$angkaDoWhile');
      angkaDoWhile++;
    } while (angkaDoWhile <= 5);

    // Menjalankan contoh break untuk menghentikan loop saat angka mencapai 4.
    final breakOutput = <String>[];
    for (var angka = 1; angka <= 5; angka++) {
      if (angka == 4) break;
      breakOutput.add('$angka');
    }

    // Menjalankan contoh continue untuk melewati angka 3.
    final continueOutput = <String>[];
    for (var angka = 1; angka <= 5; angka++) {
      if (angka == 3) continue;
      continueOutput.add('$angka');
    }

    // Menjalankan contoh switch-case untuk menentukan keterangan nilai B.
    const nilai = 'C';
    late final String switchOutput;
    switch (nilai) {
      case 'A':
        switchOutput = 'Sangat Baik';
        break;
      case 'B':
        switchOutput = 'Baik';
        break;
      case 'C':
        switchOutput = 'Cukup';
        break;
      default:
        switchOutput = 'Nilai tidak valid';
    }

    // Menyusun tampilan halaman praktik dan seluruh contoh control flow.
    return Scaffold(
      appBar: AppBar(title: const Text('Praktik Control Flow')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('asset/bg_app.jpg', fit: BoxFit.cover),
          Container(color: const Color.fromRGBO(255, 255, 255, 0.88)),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minggu 1',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Control Flow',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _PracticeSection(
                  title: 'If dan Else',
                  explanation:
                      'If Else merupakan struktur kontrol yang memungkinkan '
                      'eksekusi kode berdasarkan kondisi yang diberikan.',
                  // Contoh coding untuk penerapan If dan Else.
                  code:
                      '''// Contoh coding untuk penerapan If dan Else
var libur = $_isHoliday;
if (libur == true) {
  print("Hari ini Libur");
} else {
  print("Hari ini Tidak Libur");
}''',
                  resultLabel: 'Hasil praktik:',
                  result: ifElseOutput,
                  control: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('libur'),
                    value: _isHoliday,
                    onChanged: (value) => setState(() => _isHoliday = value),
                  ),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'For',
                  explanation:
                      'For mengulang perintah selama kondisi perulangan '
                      'bernilai benar.',
                  // Contoh coding untuk penerapan perulangan For.
                  code: '''// Contoh coding untuk penerapan For
for (int angka = 1; angka <= 5; angka++) {
  print(angka);
}''',
                  resultLabel: 'Hasil praktik:',
                  result: forOutput.join('\n'),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'For-in dan forEach',
                  explanation:
                      'Perulangan for-in dan forEach digunakan untuk mengakses '
                      'setiap elemen dalam sebuah List.',
                  // Contoh coding untuk penerapan perulangan for-in dan forEach.
                  code: '''// Contoh coding untuk penerapan for-in dan forEach
final angka = [1, 2, 3];
for (final item in angka) {
  print(item);
}

angka.forEach((item) => print(item));''',
                  resultLabel: 'Hasil praktik:',
                  result:
                      'for-in:\n${forInOutput.join('\n')}\n\n'
                      'forEach:\n${forEachOutput.join('\n')}',
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'While',
                  explanation:
                      'While mengulang perintah selama kondisi bernilai benar. '
                      'Kondisi diperiksa sebelum perintah dijalankan.',
                  // Contoh coding untuk penerapan perulangan while.
                  code: '''// Contoh coding untuk penerapan while
var angka = 1;
while (angka <= 5) {
  print(angka);
  angka++;
}''',
                  resultLabel: 'Hasil praktik:',
                  result: whileOutput.join('\n'),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'Do-while',
                  explanation:
                      'Do-while menjalankan perintah terlebih dahulu, '
                      'kemudian memeriksa kondisi perulangan.',
                  // Contoh coding untuk penerapan perulangan do-while.
                  code: '''// Contoh coding untuk penerapan do-while
var hitung = 1;
do {
  print(hitung);
  hitung++;
} while (hitung <= 5);''',
                  resultLabel: 'Hasil praktik:',
                  result: doWhileOutput.join('\n'),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'Break',
                  explanation:
                      'Break menghentikan perulangan ketika kondisi yang '
                      'ditentukan terpenuhi.',
                  // Contoh coding untuk menghentikan perulangan dengan break.
                  code: '''// Contoh coding untuk penerapan break
for (var i = 1; i <= 5; i++) {
  if (i == 4) break;
  print(i);
}''',
                  resultLabel: 'Hasil praktik:',
                  result: breakOutput.join('\n'),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'Continue',
                  explanation:
                      'Continue melewati sisa perintah pada iterasi saat ini '
                      'dan melanjutkan ke iterasi berikutnya.',
                  // Contoh coding untuk melewati iterasi dengan continue.
                  code: '''// Contoh coding untuk penerapan continue
for (var i = 1; i <= 5; i++) {
  if (i == 3) continue;
  print(i);
}''',
                  resultLabel: 'Hasil praktik:',
                  result: continueOutput.join('\n'),
                ),
                const SizedBox(height: 12),
                _PracticeSection(
                  title: 'Switch-case',
                  explanation:
                      'Switch-case menjalankan perintah sesuai dengan nilai '
                      'yang cocok pada salah satu case.',
                  // Contoh coding untuk memilih hasil dengan switch-case.
                  code: '''// Contoh coding untuk penerapan switch-case
switch (nilai) {
  case 'A':
    print('Sangat Baik');
    break;
  case 'B':
    print('Baik');
    break;
  default:
    print('Nilai tidak valid');
}''',
                  resultLabel: 'Hasil praktik untuk nilai = $nilai:',
                  result: switchOutput,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget kartu yang menampilkan penjelasan, kode contoh, kontrol, dan hasil.
class _PracticeSection extends StatelessWidget {
  const _PracticeSection({
    required this.title,
    required this.explanation,
    required this.code,
    required this.resultLabel,
    required this.result,
    this.control,
  });

  final String title;
  final String explanation;
  final String code;
  final String resultLabel;
  final String result;
  final Widget? control;

  @override
  Widget build(BuildContext context) {
    // Tampilkan setiap bagian praktik dalam satu kartu.
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Penjelasan: $explanation',
              style: const TextStyle(height: 1.4),
            ),
            if (control != null) ...[const SizedBox(height: 8), control!],
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SelectableText(
                code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              resultLabel,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                result,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
