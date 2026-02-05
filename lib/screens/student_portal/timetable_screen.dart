import 'package:flutter/material.dart';
import '../../widgets/app_header.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  String selectedSemester = 'Semester 1 2024/2025';
  bool isDayView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: const AppHeader(title: 'Timetable'),
      body: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFE8D5FF).withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Semester Selector
                _buildSemesterSelector(),
                const SizedBox(height: 16),
                // Programme Name
                _buildProgrammeInfo(),
                const SizedBox(height: 16),
                // Day/Week Toggle
                _buildViewToggle(),
                const SizedBox(height: 20),
                // Time Grid Schedule
                _buildTimeGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            const Color(0xFFFFF5FF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF6A1B9A).withOpacity(0.2),
          width: 2,
        ),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF6A1B9A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_month,
              color: Color(0xFF6A1B9A),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButton<String>(
              value: selectedSemester,
              isExpanded: true,
              underline: const SizedBox(),
              style: const TextStyle(
                color: Color(0xFF424242),
                fontWeight: FontWeight.w600,
              ),
              items: [
                'Semester 1 2024/2025',
                'Semester 2 2024/2025',
                'Semester 3 2024/2025',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedSemester = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgrammeInfo() {
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
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A1B9A).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF6A1B9A).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6A1B9A),
                      const Color(0xFF9C27B0),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6A1B9A).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 24),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bachelor of Computer Science',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF424242),
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'CS110 - Faculty of Computer Science',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewToggle() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            const Color(0xFFFFF5FF),
          ],
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
          Expanded(
            child: _buildToggleButton('Day', isDayView, () {
              setState(() => isDayView = true);
            }),
          ),
          Expanded(
            child: _buildToggleButton('Week', !isDayView, () {
              setState(() => isDayView = false);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    const Color(0xFF6A1B9A),
                    const Color(0xFF9C27B0),
                  ],
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF6A1B9A).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF757575),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 15,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeGrid() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    final timeSlots = [
      '8:00', '9:00', '10:00', '11:00', '12:00',
      '1:00', '2:00', '3:00', '4:00', '5:00'
    ];

    // Sample class data
    final classes = <Map<String, dynamic>>[
      {
        'day': 'Mon',
        'time': '9:00',
        'subject': 'Data Structures',
        'room': 'CS101',
        'lecturer': 'Dr. Ahmad',
        'color': const Color(0xFFB2DFDB),
      },
      {
        'day': 'Tue',
        'time': '10:00',
        'subject': 'Database Systems',
        'room': 'CS205',
        'lecturer': 'Dr. Siti',
        'color': const Color(0xFFB3E5FC),
      },
      {
        'day': 'Wed',
        'time': '2:00',
        'subject': 'Web Development',
        'room': 'LAB1',
        'lecturer': 'Dr. Ali',
        'color': const Color(0xFFFFE0B2),
      },
    ];

    if (isDayView) {
      // Day view - show single day schedule
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
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6A1B9A).withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: timeSlots.map((time) {
            final classForTime = classes.firstWhere(
              (c) => c['time'] == time,
              orElse: () => <String, dynamic>{},
            );
            return _buildTimeSlot(time, classForTime);
          }).toList(),
        ),
      );
    } else {
      // Week view - show grid
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
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6A1B9A).withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header row
            Row(
              children: [
                const SizedBox(width: 60),
                ...days.map((day) => Expanded(
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF424242),
                        ),
                      ),
                    )),
              ],
            ),
            const Divider(),
            // Time slots
            ...timeSlots.map((time) => _buildWeekTimeRow(time, days, classes)),
          ],
        ),
      );
    }
  }

  Widget _buildTimeSlot(String time, Map classData) {
    final hasClass = classData.isNotEmpty;
    return InkWell(
      onTap: hasClass
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassDetailsScreen(
                    subject: classData['subject'] as String,
                    time: classData['time'] as String,
                    room: classData['room'] as String,
                    lecturer: classData['lecturer'] as String,
                  ),
                ),
              );
            }
          : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: hasClass
              ? LinearGradient(
                  colors: [
                    (classData['color'] as Color),
                    (classData['color'] as Color).withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: hasClass ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hasClass
                ? Colors.transparent
                : const Color(0xFFE0E0E0).withOpacity(0.5),
            width: 1.5,
          ),
          boxShadow: hasClass
              ? [
                  BoxShadow(
                    color: (classData['color'] as Color).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: hasClass ? Colors.white : const Color(0xFF757575),
                ),
              ),
            ),
            if (hasClass) ...[
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classData['subject'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${classData['room']} • ${classData['lecturer']}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWeekTimeRow(String time, List<String> days, List<Map> classes) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 60,
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF757575),
                ),
              ),
            ),
            ...days.map((day) {
              final classForSlot = classes.firstWhere(
                (c) => c['day'] == day && c['time'] == time,
                orElse: () => <String, dynamic>{},
              );
              final hasClass = classForSlot.isNotEmpty;
              return Expanded(
                child: InkWell(
                  onTap: hasClass
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassDetailsScreen(
                                subject: classForSlot['subject'] as String,
                                time: classForSlot['time'] as String,
                                room: classForSlot['room'] as String,
                                lecturer: classForSlot['lecturer'] as String,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: hasClass
                          ? (classForSlot['color'] as Color)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: hasClass
                            ? Colors.transparent
                            : const Color(0xFFE0E0E0),
                      ),
                    ),
                    child: hasClass
                        ? Column(
                            children: [
                              Text(
                                classForSlot['subject'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                classForSlot['room'] as String,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              );
            }),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

// Class Details Screen
class ClassDetailsScreen extends StatelessWidget {
  final String subject;
  final String time;
  final String room;
  final String lecturer;

  const ClassDetailsScreen({
    super.key,
    required this.subject,
    required this.time,
    required this.room,
    required this.lecturer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: const AppHeader(title: 'Class Details'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Info Card
            _buildInfoCard(
              icon: Icons.book,
              title: 'Subject',
              value: subject,
            ),
            const SizedBox(height: 16),
            // Time Card
            _buildInfoCard(
              icon: Icons.access_time,
              title: 'Time',
              value: time,
            ),
            const SizedBox(height: 16),
            // Lecturer Card
            _buildInfoCard(
              icon: Icons.person,
              title: 'Lecturer',
              value: lecturer,
            ),
            const SizedBox(height: 16),
            // Room Card with Map Button
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB2DFDB).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Color(0xFF6A1B9A),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Room Location',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF757575),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          room,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF424242),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Open map
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opening map...')),
                      );
                    },
                    icon: const Icon(Icons.map, size: 18),
                    label: const Text('Map'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A1B9A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Add to Calendar CTA
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to calendar!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A1B9A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text(
                      'Add to Calendar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFB2DFDB).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF6A1B9A)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
