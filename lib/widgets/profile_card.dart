import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: CircleAvatar(child: Text('D')),
              title: Text('Bùi Quang Duy'), // Thay thông tin của bạn
              subtitle: Text('MSSV: 2201234567'), // Thay MSSV của bạn
            ),
            const Divider(height: 1),
            const ListTile(
              leading: Icon(Icons.class_outlined),
              title: Text('Lớp'),
              subtitle: Text('CNTT – LTDD'),
            ),
            const ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text('Email'),
              subtitle: Text('2201234567@vhu.edu.vn'), // Thay Email của bạn
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                children: const [
                  Expanded(child: StatBox(label: 'Lab đã nộp', value: '1')),
                  SizedBox(width: 12),
                  Expanded(child: StatBox(label: 'Điểm TB lab', value: '8.5')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  const StatBox({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: scheme.primary,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: scheme.outline)),
        ],
      ),
    );
  }
}