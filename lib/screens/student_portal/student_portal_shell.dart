import 'package:flutter/material.dart';
import '../../l10n/app_locale.dart';
import '../../l10n/portal_strings.dart';
import '../../widgets/app_header.dart';
import 'dashboard_screen.dart';
import 'financial_services_screen.dart';
import 'transaction_statement_screen.dart';
import 'profile_screen.dart';

/// Allows dashboard (and other children) to switch the portal tab (e.g. to Statement).
class StudentPortalScope extends InheritedWidget {
  const StudentPortalScope({
    super.key,
    required this.switchToTab,
    required super.child,
  });

  final void Function(int index) switchToTab;

  static StudentPortalScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StudentPortalScope>();
  }

  @override
  bool updateShouldNotify(StudentPortalScope oldWidget) =>
      switchToTab != oldWidget.switchToTab;
}

class StudentPortalShell extends StatefulWidget {
  const StudentPortalShell({super.key});

  @override
  State<StudentPortalShell> createState() => _StudentPortalShellState();
}

class _StudentPortalShellState extends State<StudentPortalShell> {
  int _currentIndex = 0;

  void _switchToTab(int index) {
    if (index != _currentIndex) setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return StudentPortalScope(
      switchToTab: _switchToTab,
      child: ListenableBuilder(
        listenable: AppLocale.instance,
        builder: (context, _) {
          final s = PortalStrings(isMalay: AppLocale.instance.isMalay);
          final titles = [s.studentPortal, s.financialServices, s.penyataTransaksi, s.tabProfile];
          final bodies = [
            const DashboardScreenBody(),
            const FinancialServicesScreen(),
            const TransactionStatementScreen(),
            const ProfileScreen(),
          ];
          return Scaffold(
          backgroundColor: const Color(0xFFF8F5FF),
          appBar: AppHeader(
            title: titles[_currentIndex],
            showBack: false,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _langChip('EN', !AppLocale.instance.isMalay),
                  const SizedBox(width: 6),
                  _langChip('BM', AppLocale.instance.isMalay),
                ],
              ),
            ),
            onClose: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (route) => false,
              );
            },
          ),
          body: bodies[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _navItem(0, Icons.home_rounded, s.tabHome)),
                    Expanded(child: _navItem(1, Icons.account_balance_wallet_rounded, s.tabFinancial)),
                    Expanded(child: _navItem(2, Icons.receipt_long_rounded, s.tabTransaction)),
                    Expanded(child: _navItem(3, Icons.person_rounded, s.tabProfile)),
                  ],
                ),
              ),
            ),
          ),
        );
        },
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final selected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF6A1B9A).withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: selected ? const Color(0xFF6A1B9A) : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? const Color(0xFF6A1B9A) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _langChip(String label, bool isSelected) {
    return Material(
      color: isSelected ? const Color(0xFF6A1B9A) : Colors.grey[200],
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () => AppLocale.instance.setMalay(label == 'BM'),
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
