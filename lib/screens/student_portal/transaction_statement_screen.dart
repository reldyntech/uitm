import 'package:flutter/material.dart';
import '../../l10n/app_locale.dart';
import '../../l10n/portal_strings.dart';

class TransactionStatementScreen extends StatelessWidget {
  const TransactionStatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final s = PortalStrings(isMalay: AppLocale.instance.isMalay);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFilterCard(s),
              const SizedBox(height: 24),
              Text(
                s.transactionHistory,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 16),
              _buildTransactionList(s),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterCard(PortalStrings s) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.filterBy,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF757575),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _filterChip(label: '2025'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _filterChip(label: '2024'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _filterChip(label: s.date, icon: Icons.calendar_today),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _filterChip({required String label, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: const Color(0xFF6A1B9A)),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF424242),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(PortalStrings s) {
    final transactions = [
      _TransactionItem(
        date: '10 Dec 2025',
        description: 'Tuition Fee - Semester 1',
        amount: -2450.00,
      ),
      _TransactionItem(
        date: '05 Dec 2025',
        description: 'Credit - PTPTN',
        amount: 3000.00,
      ),
      _TransactionItem(
        date: '01 Dec 2025',
        description: 'Library Fee',
        amount: -50.00,
      ),
      _TransactionItem(
        date: '28 Nov 2025',
        description: 'Registration Fee',
        amount: -250.00,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    s.date,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    s.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    s.amount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF757575),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...transactions.map(
            (t) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      t.date,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      t.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${t.amount >= 0 ? "RM " : "-RM "}${t.amount.abs().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: t.amount >= 0
                          ? const Color(0xFF2E7D32)
                          : const Color(0xFFC62828),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem {
  final String date;
  final String description;
  final double amount;

  _TransactionItem({
    required this.date,
    required this.description,
    required this.amount,
  });
}
