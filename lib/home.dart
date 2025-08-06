import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> iuranList = [
    {
      'nama': 'Budi',
      'minggu': 'Minggu 1',
      'tanggal': '01/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
    {
      'nama': 'Budi',
      'minggu': 'Minggu 2',
      'tanggal': '08/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
    {
      'nama': 'Budi',
      'minggu': 'Minggu 3',
      'tanggal': '15/08/2025',
      'jumlah': 10000,
      'status': 'Belum Lunas'
    },
    {
      'nama': 'Jamal',
      'minggu': 'Minggu 1',
      'tanggal': '01/08/2025',
      'jumlah': 10000,
      'status': 'Belum Lunas'
    },
    {
      'nama': 'Jamal',
      'minggu': 'Minggu 2',
      'tanggal': '08/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
    {
      'nama': 'Jamal',
      'minggu': 'Minggu 3',
      'tanggal': '15/08/2025',
      'jumlah': 10000,
      'status': 'Belum Lunas'
    },
    {
      'nama': 'Rista',
      'minggu': 'Minggu 1',
      'tanggal': '01/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
    {
      'nama': 'Rista',
      'minggu': 'Minggu 2',
      'tanggal': '08/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
    {
      'nama': 'Rista',
      'minggu': 'Minggu 3',
      'tanggal': '15/08/2025',
      'jumlah': 10000,
      'status': 'Lunas'
    },
  ];
  late List<Widget> _pages = [
    Center(
      child: ListView(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.attach_money_rounded,
                  color: Colors.green, size: 32),
              title: Text(
                'Total Iuran Bulan Ini',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Rp 2.000.000',
                  style: TextStyle(fontSize: 18, color: Colors.green[700])),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.people_rounded, color: Colors.blue, size: 32),
              title: Text(
                'Jumlah Warga',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('120',
                  style: TextStyle(fontSize: 18, color: Colors.blue[700])),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.blueGrey[50],
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.report_rounded, color: Colors.red, size: 32),
              title: Text(
                'Keluhan Baru',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('3',
                  style: TextStyle(fontSize: 18, color: Colors.red[700])),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Data Warga',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    leading:
                        const Icon(Icons.person_rounded, color: Colors.blue),
                    title: const Text('Budi Santoso'),
                    subtitle: const Text('Alamat: Jl. Melati No. 10'),
                    trailing: Chip(
                      label: const Text('Lunas'),
                      backgroundColor: Colors.green[100],
                      labelStyle: const TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading:
                        const Icon(Icons.person_rounded, color: Colors.blue),
                    title: const Text('Jamal'),
                    subtitle: const Text('Alamat: Jl. Mawar No. 5'),
                    trailing: Chip(
                      label: const Text('Belum Lunas'),
                      backgroundColor: Colors.red[100],
                      labelStyle: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading:
                        const Icon(Icons.person_rounded, color: Colors.blue),
                    title: const Text('Rista'),
                    subtitle: const Text('Alamat: Jl. Kenanga No. 3'),
                    trailing: Chip(
                      label: const Text('Lunas'),
                      backgroundColor: Colors.green[100],
                      labelStyle: const TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 16,
          columns: const [
            DataColumn(label: Text('Nama Warga')),
            DataColumn(label: Text('Minggu')),
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Jumlah')),
            DataColumn(label: Text('Status')),
          ],
          rows: iuranList.map<DataRow>((data) {
            return DataRow(cells: [
              DataCell(Text(data['nama'])),
              DataCell(Text(data['minggu'])),
              DataCell(Text(data['tanggal'])),
              DataCell(Text('Rp ${data['jumlah']}')),
              DataCell(
                Text(
                  data['status'],
                  style: TextStyle(
                    color:
                        data['status'] == 'Lunas' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: KeluhanPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Iuran Warga'),
        backgroundColor: const Color.fromARGB(255, 56, 62, 67),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(
          milliseconds: 300,
        ),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Data Warga',
          ),
          NavigationDestination(
            icon: Icon(Icons.attach_money_outlined),
            selectedIcon: Icon(Icons.attach_money_rounded),
            label: 'Data Iuran',
          ),
          NavigationDestination(
            icon: Icon(Icons.report_outlined),
            selectedIcon: Icon(Icons.report_rounded),
            label: 'Keluhan',
          ),
        ],
      ),
    );
  }
}

class KeluhanPage extends StatelessWidget {
  const KeluhanPage({super.key});

  final List<Map<String, String>> keluhanList = const [
    {
      'nama': 'Budi Santoso',
      'keluhan': 'Susah buat login.',
    },
    {
      'nama': 'jamal',
      'keluhan':
          'saya kan sudah bayar iuran bulan ini tetapi mengapa belum ada tanda lunas nya.',
    },
    {
      'nama': 'Rista',
      'keluhan': 'Bug nya banyak banget, tolong diperbaiki.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Daftar Keluhan Masuk',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: keluhanList.length,
            itemBuilder: (context, index) {
              final keluhan = keluhanList[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: ListTile(
                  leading: const Icon(Icons.report_rounded, color: Colors.red),
                  title: Text(keluhan['keluhan'] ?? ''),
                  subtitle: Text('Dari: ${keluhan['nama']}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
