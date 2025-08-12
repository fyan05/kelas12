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
  final String namaWarga = "Budi";
  final int jumlahTagihan = 15000;
  final String jatuhTempo = "19-08-2025";
  final bool sudahLunas = false;
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
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Warga: $namaWarga",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Jumlah Tagihan: Rp $jumlahTagihan",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text("Jatuh Tempo: $jatuhTempo", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Row(
                children: [
                  Text("Status: ", style: TextStyle(fontSize: 16)),
                  Text(
                    sudahLunas ? "Lunas" : "Belum Lunas",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: sudahLunas ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (!sudahLunas)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi bayar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pembayaran diproses...")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Bayar Sekarang",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 16,
          columns: const [
            DataColumn(label: Text('Minggu')),
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Jumlah')),
            DataColumn(label: Text('Status')),
          ],
          rows: iuranList.map<DataRow>((data) {
            return DataRow(cells: [
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
    Column(children: [
      Container(
        height: 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Budi Santoso',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'john.doe@email.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            icon: Icons.phone,
            title: 'Nomor Telepon',
            value: '+62 812-3456-7890',
            color: Colors.blue,
          ),
          _buildInfoCard(
            icon: Icons.home,
            title: 'Alamat',
            value: 'Jl. Raya No. 123, Kampung Lebak Gede',
            color: Colors.green,
          ),
          _buildInfoCard(
            icon: Icons.credit_card,
            title: 'Nomor Rumah',
            value: 'A-15',
            color: Colors.orange,
          ),
          _buildInfoCard(
            icon: Icons.calendar_today,
            title: 'Bergabung Sejak',
            value: 'Januari 2023',
            color: Colors.purple,
          ),
          const SizedBox(height: 24),
        ]),
      ),
    ]),
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
            icon: Icon(Icons.wallet_travel_outlined),
            selectedIcon: Icon(Icons.wallet_travel_rounded),
            label: 'Payment',
          ),
          NavigationDestination(
            icon: Icon(Icons.attach_money_outlined),
            selectedIcon: Icon(Icons.attach_money_rounded),
            label: 'Riwayat Pembayaran',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoCard({
  required IconData icon,
  required String title,
  required String value,
  required Color color,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStatCard({
  required String title,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return Expanded(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildActionButton({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Color? color,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      leading: Icon(icon, color: color ?? Colors.blue),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}
