import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Biodata Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const FormBiodataPage(),
    );
  }
}

// Halaman dibuat StatefulWidget agar bisa memakai setState
// (checkbox berubah) dan menyimpan controller.
class FormBiodataPage extends StatefulWidget {
  const FormBiodataPage({super.key});

  @override
  State<FormBiodataPage> createState() => _FormBiodataPageState();
}

class _FormBiodataPageState extends State<FormBiodataPage> {
  static const Color biru = Color(0xFF2563EB);
  static const Color biruTua = Color(0xFF1E3A8A);

  final _formKey = GlobalKey<FormState>();
  final namaCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final hpCtrl = TextEditingController();
  bool setuju = false;

  // Controller wajib di-dispose agar tidak memory leak
  @override
  void dispose() {
    namaCtrl.dispose();
    emailCtrl.dispose();
    hpCtrl.dispose();
    super.dispose();
  }

  void _simpan() {
    final messenger = ScaffoldMessenger.of(context);

    // Jalankan semua validator; berhenti jika ada yang salah
    if (!_formKey.currentState!.validate()) return;

    // Checkbox "setuju syarat" harus dicentang
    if (!setuju) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Centang "Setuju syarat & ketentuan" dulu ya.'),
        ),
      );
      return;
    }

    // Data valid -> tampilkan ringkasan lewat SnackBar
    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          'Data berhasil disimpan\n'
              'Nama: ${namaCtrl.text.trim()}\n'
              'Email: ${emailCtrl.text.trim()}\n'
              'No. HP: ${hpCtrl.text.trim()}',
        ),
      ),
    );
  }

  InputDecoration _dekorasi(String label, IconData ikon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(ikon, color: biru),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: biru, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruTua,
        foregroundColor: Colors.white,
        title: const Text('Form Biodata Mahasiswa'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            // SingleChildScrollView: keyboard tidak menutupi input
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Isi Biodata Anda',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: biruTua,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lengkapi data berikut lalu tekan tombol Simpan.',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Mahasiswa Informatika - UMSIDA',
                    style: TextStyle(
                      fontSize: 14,
                      color: biru,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Kartu identitas (gaya dari kode biodata sebelumnya)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x332563EB),
                          blurRadius: 12,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white70,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/foto.jpg',
                              width: 76,
                              height: 76,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: biru,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mohammad Ali Ridho Kurniawan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'NIM: 241080200044',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Prodi: Informatika',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Kartu form
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.edit_note, color: biru, size: 26),
                              SizedBox(width: 8),
                              Text(
                                'Data Diri',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: biruTua,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // 1. Nama
                          TextFormField(
                            controller: namaCtrl,
                            textCapitalization: TextCapitalization.words,
                            decoration:
                            _dekorasi('Nama', Icons.person_outline),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Nama wajib diisi';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),

                          // 2. Email (harus mengandung '@')
                          TextFormField(
                            controller: emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                            _dekorasi('Email', Icons.email_outlined),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'Email wajib diisi';
                              }
                              if (!v.contains('@')) {
                                return "Email harus mengandung '@'";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),

                          // 3. No. HP (minimal 10 digit, hanya angka)
                          TextFormField(
                            controller: hpCtrl,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration:
                            _dekorasi('No. HP', Icons.phone_outlined),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'No. HP wajib diisi';
                              }
                              if (v.trim().length < 10) {
                                return 'No. HP minimal 10 digit';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),

                          // Checkbox setuju syarat
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: biru,
                            title: const Text('Setuju syarat & ketentuan'),
                            value: setuju,
                            onChanged: (v) =>
                                setState(() => setuju = v ?? false),
                          ),
                          const SizedBox(height: 8),

                          // Tombol Simpan
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: biru,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _simpan,
                              icon: const Icon(Icons.save),
                              label: const Text('Simpan'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Dibuat dengan Flutter | Praktikum UMSIDA',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
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