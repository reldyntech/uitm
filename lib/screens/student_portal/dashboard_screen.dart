import 'package:flutter/material.dart';
import '../../l10n/app_locale.dart';
import '../../l10n/portal_strings.dart';
import '../../widgets/app_header.dart';
import 'student_portal_shell.dart';

/// Body content only (used inside [StudentPortalShell] or with [DashboardScreen]).
class DashboardScreenBody extends StatelessWidget {
  const DashboardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final s = PortalStrings(isMalay: AppLocale.instance.isMalay);
        return Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8D5FF).withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5F5).withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardScreen._buildGreetingHeader(s),
                  const SizedBox(height: 24),
                  DashboardScreen._buildAnnouncementsSection(context, s),
                  const SizedBox(height: 24),
                  DashboardScreen._buildQuickAccessCards(context, s),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AnnouncementsCarousel extends StatefulWidget {
  const _AnnouncementsCarousel({required this.s, required this.items});

  final PortalStrings s;
  final List<(String, String, String, String)> items;

  @override
  State<_AnnouncementsCarousel> createState() => _AnnouncementsCarouselState();
}

class _AnnouncementsCarouselState extends State<_AnnouncementsCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const List<Color> _bannerColors = [
    Color(0xFFE8F5E9), // light green
    Color(0xFFE3F2FD), // light blue
    Color(0xFFF3E5F5), // light purple
  ];

  static const List<Color> _bannerTagColors = [
    Color(0xFF2E7D32),
    Color(0xFF1565C0),
    Color(0xFF7B1FA2),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.s;
    final items = widget.items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.campaign_rounded,
                      color: Color(0xFF6A1B9A),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    s.announcements,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF424242),
                    ),
                  ),
                ],
              ),
              Text(
                s.viewAll,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6A1B9A),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              final (headline, body, date, tag) = items[index];
              final bgColor = _bannerColors[index % _bannerColors.length];
              final tagColor = _bannerTagColors[index % _bannerTagColors.length];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: tagColor.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (tag.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: tagColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ),
                            Text(
                              headline,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF424242),
                                height: 1.25,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              body,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF616161),
                                height: 1.35,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              date,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.campaign_rounded,
                        color: tagColor.withOpacity(0.6),
                        size: 40,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (i) {
              final selected = _currentPage == i;
              final tagColor = _bannerTagColors[i % _bannerTagColors.length];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: selected ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: selected ? tagColor : const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final s = PortalStrings(isMalay: AppLocale.instance.isMalay);
        return Scaffold(
          backgroundColor: const Color(0xFFF8F5FF),
          appBar: AppHeader(
            title: s.studentPortal,
            showBack: false,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _langChip(context, 'EN', !AppLocale.instance.isMalay),
                  const SizedBox(width: 6),
                  _langChip(context, 'BM', AppLocale.instance.isMalay),
                ],
              ),
            ),
            onClose: () => Navigator.of(context).pop(),
          ),
          body: const DashboardScreenBody(),
        );
      },
    );
  }

  Widget _langChip(BuildContext context, String label, bool isSelected) {
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

  static Widget _buildGreetingHeader(PortalStrings s) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            const Color(0xFFFFF5FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A1B9A).withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6A1B9A),
                  const Color(0xFF9C27B0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${s.hi} Farhan,',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  s.welcomeToPortal,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildAnnouncementsSection(BuildContext context, PortalStrings s) {
    // (headline, body, date, tag)
    final items = [
      (
        s.isMalay ? 'Pendaftaran kursus semester baru' : 'New semester course registration',
        s.isMalay
            ? 'Dibuka sehingga 15 Mac. Daftar sekarang melalui portal.'
            : 'Open until 15 March. Register now via the portal.',
        '4 Feb 2025',
        s.bannerTagNew,
      ),
      (
        s.isMalay ? 'Bayar yuran dengan mudah' : 'Pay fees easily',
        s.isMalay
            ? 'Yuran pengajian boleh dibayar melalui portal atau Be MyUiTM.'
            : 'Tuition fees can be paid via the portal or Be MyUiTM.',
        '1 Feb 2025',
        s.bannerTagRecommended,
      ),
      (
        s.isMalay ? 'Jadual peperiksaan akhir' : 'Final exam timetable',
        s.isMalay
            ? 'Jadual peperiksaan akhir semester telah dikeluarkan.'
            : 'Final semester exam timetable has been released.',
        '28 Jan 2025',
        s.bannerTagImportant,
      ),
    ];
    return _AnnouncementsCarousel(s: s, items: items);
  }

  static Widget _buildQuickAccessCards(BuildContext context, PortalStrings s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.quickAccess,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF424242),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.bilPelajar,
              icon: Icons.receipt_long,
              color: const Color(0xFF81C784),
              onTap: () {
                StudentPortalScope.of(context)?.switchToTab(1);
              },
            ),
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.skimKhidmatPelajar,
              icon: Icons.volunteer_activism,
              color: const Color(0xFF64B5F6),
              onTap: () {},
            ),
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.penyataTransaksi,
              icon: Icons.account_balance_wallet,
              color: const Color(0xFFFFD54F),
              onTap: () {
                StudentPortalScope.of(context)?.switchToTab(2);
              },
            ),
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.timetable,
              icon: Icons.calendar_today,
              color: const Color(0xFFB2DFDB),
              onTap: () => Navigator.pushNamed(context, '/timetable'),
            ),
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.myResults,
              icon: Icons.assessment,
              color: const Color(0xFFE1BEE7),
              onTap: () => Navigator.pushNamed(context, '/results'),
            ),
            DashboardScreen._buildQuickAccessCard(
              context,
              title: s.bookFacilities,
              icon: Icons.meeting_room,
              color: const Color(0xFFFFCC80),
              onTap: () => Navigator.pushNamed(context, '/facilities'),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildQuickAccessCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative background shape
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF424242),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Icon with decorative ring
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                color,
                                color.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(icon, color: Colors.white, size: 24),
                        ),
                      ],
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
}
