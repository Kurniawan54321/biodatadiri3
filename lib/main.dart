
import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Ali',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
        fontFamily: 'Roboto',
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkColor = Color(0xFF172554);
  static const Color mutedColor = Color(0xFF64748B);

  final String nama = 'Mohammad Ali Ridho Kurniawan';
  final String nim = '241080200044';
  final String prodi = 'Informatika';
  final String semester = '5';
  final String kota = 'Sidoarjo';
  final String hobi = 'Olahraga';
  final String deskripsi =
      'Saya merupakan orang yang sangat menghargai waktu. '
      'Saya berusaha menggunakan waktu dengan baik untuk '
      'belajar, mengembangkan kemampuan, dan menyelesaikan '
      'tanggung jawab.';

  final List<String> keahlian = const [
    'HTML',
    'PHP',
    'CSS',
    'PYTHON',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool layarLebar = constraints.maxWidth >= 750;
            final double padding = constraints.maxWidth < 400 ? 16 : 24;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTopBar(),
                      const SizedBox(height: 24),
                      _buildProfileHeader(layarLebar),
                      const SizedBox(height: 24),
                      if (layarLebar)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: _buildPersonalInfo(),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  _buildAbout(),
                                  const SizedBox(height: 20),
                                  _buildSkills(),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _buildPersonalInfo(),
                            const SizedBox(height: 20),
                            _buildAbout(),
                            const SizedBox(height: 20),
                            _buildSkills(),
                          ],
                        ),
                      const SizedBox(height: 24),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.person_outline,
            color: Colors.white,
            size: 25,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BIODATA PRIBADI',
                style: TextStyle(
                  color: darkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Mahasiswa Informatika',
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.verified_user_outlined,
          color: primaryColor,
          size: 23,
        ),
      ],
    );
  }

  Widget _buildProfileHeader(bool layarLebar) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1D4ED8),
            Color(0xFF3B82F6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: layarLebar
          ? Row(
        children: [
          _buildAvatar(90),
          const SizedBox(width: 24),
          Expanded(child: _buildProfileText()),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(78),
          const SizedBox(height: 18),
          _buildProfileText(),
        ],
      ),
    );
  }

  Widget _buildAvatar(double size) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.8),
          width: 2,
        ),
      ),
      child: Text(
        'AR',
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProfileText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Halo, saya',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          nama,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.17),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            'NIM: $nim',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfo() {
    return _buildCard(
      title: 'Informasi Pribadi',
      icon: Icons.badge_outlined,
      child: Column(
        children: [
          _infoRow(
            Icons.person_outline,
            'Nama Lengkap',
            nama,
          ),
          _infoRow(
            Icons.numbers,
            'NIM',
            nim,
          ),
          _infoRow(
            Icons.school_outlined,
            'Program Studi',
            prodi,
          ),
          _infoRow(
            Icons.menu_book_outlined,
            'Semester',
            semester,
          ),
          _infoRow(
            Icons.location_on_outlined,
            'Kota Asal',
            kota,
          ),
          _infoRow(
            Icons.sports_soccer_outlined,
            'Hobi',
            hobi,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
      IconData icon,
      String label,
      String value, {
        bool isLast = false,
      }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : 18,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: mutedColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return _buildCard(
      title: 'Tentang Saya',
      icon: Icons.person_search_outlined,
      child: Text(
        deskripsi,
        style: const TextStyle(
          color: Color(0xFF475569),
          fontSize: 14,
          height: 1.8,
        ),
      ),
    );
  }

  Widget _buildSkills() {
    return _buildCard(
      title: 'Keahlian',
      icon: Icons.code,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bahasa dan teknologi yang saya pelajari:',
            style: TextStyle(
              color: mutedColor,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: keahlian.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFDBEAFE),
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE8EDF5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: primaryColor,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: darkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          const Divider(color: Color(0xFFE2E8F0)),
          const SizedBox(height: 12),
          const Text(
            'Dibuat dengan Flutter',
            style: TextStyle(
              color: mutedColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Praktikum Flutter • Informatika UMSIDA',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mutedColor.withOpacity(0.8),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
