import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3), // Beige background
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;
            final rectangleHeight = availableHeight * 0.5;
            
            return Stack(
              children: [
                // Superhero Illustration - behind the rectangle, fills height from Discover section to rectangle
                Positioned(
                  top: 120, // Approximate position after header and discover text
                  right: 20,
                  bottom: availableHeight * 0.5 - 60, // Until rectangle starts
                  child: Image.asset(
                    'assets/images/superhero.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.transparent,
                        child: const Icon(Icons.self_improvement, size: 120, color: Color(0xFFD81B60)),
                      );
                    },
                  ),
                ),
                // Background rectangle covering bottom half of the screen, moved up (in front of superhero)
                Positioned(
                  top: availableHeight * 0.5 - 60, // Position at middle minus 60px to move up
                  left: 0,
                  right: 0,
                  bottom: -60, // Extend 60px below bottom to maintain coverage
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/Rectangle 1276.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container();
                      },
                    ),
                  ),
                ),
                // Top content (Header and Discover)
                Column(
                  children: [
                    // Top Header
                    _buildHeader(),
                    const SizedBox(height: 24),
                    // Discover Section - Page Title
                    _buildDiscoverSection(),
                  ],
                ),
                // Cards Grid positioned right below where rectangle starts (at middle of available height)
                Positioned(
                  top: availableHeight * 0.5,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildCardsGrid(context),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Profile Picture
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.person, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Greeting Text
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFE91E63), // Lighter pink
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Farhan!',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC2185B), // Darker pink
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Notification Bell
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 28),
                color: Colors.grey.shade700,
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '12',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Discover',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
              ),
            ),
          ),
          const Spacer(),
          // Space reserved for superhero (now positioned separately)
          const SizedBox(width: 150),
        ],
      ),
    );
  }

  Widget _buildCardsGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          _buildNestCard(),
          _buildUitmCard(context),
          _buildTermDepositCard(),
          _buildCard(
            title: 'Microtakaful',
            backgroundColor: const Color(0xFFFFE0E6),
            illustration: 'assets/images/4.png',
            icon: Icons.two_wheeler,
          ),
        ],
      ),
    );
  }

  Widget _buildNestCard() {
    return InkWell(
      onTap: () {
        // Handle Nest card tap
      },
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Tile image filling entire tile
            Positioned.fill(
              child: Image.asset(
                'assets/images/1.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFB2DFDB),
                    child: const Icon(Icons.view_in_ar, size: 60, color: Colors.black54),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUitmCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/dashboard');
      },
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Tile image filling entire tile
            Positioned.fill(
              child: Image.asset(
                'assets/images/2.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFB3E5FC),
                    child: const Icon(
                      Icons.business_center,
                      size: 60,
                      color: Color(0xFF616161),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermDepositCard() {
    return InkWell(
      onTap: () {
        // Handle Term Deposit-i card tap
      },
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Tile image filling entire tile
            Positioned.fill(
              child: Image.asset(
                'assets/images/3.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF5E6D3),
                    child: const Icon(Icons.handshake, size: 60, color: Colors.black54),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required Color backgroundColor,
    required String illustration,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        // Handle card tap
      },
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Image filling entire tile
            Positioned.fill(
              child: Image.asset(
                illustration,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: backgroundColor,
                    child: Icon(icon, size: 60, color: Colors.black54),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', false),
              _buildNavItem(Icons.favorite, 'Discover', true),
              _buildNavItem(Icons.account_balance_wallet_outlined, 'Pocket', false),
              _buildNavItem(Icons.pie_chart_outline, 'Budget', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFD81B60) : Colors.grey.shade400,
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFFD81B60) : Colors.grey.shade400,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
