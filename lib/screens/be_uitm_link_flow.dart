import 'package:flutter/material.dart';
import '../l10n/app_locale.dart';
import '../l10n/portal_strings.dart';

/// Be MyUiTM flow: Intro carousel → Welcome → Link Student ID → eKYC → Success → Dashboard.
class BeUitmLinkFlow extends StatefulWidget {
  const BeUitmLinkFlow({super.key});

  @override
  State<BeUitmLinkFlow> createState() => _BeUitmLinkFlowState();
}

class _BeUitmLinkFlowState extends State<BeUitmLinkFlow> {
  int _step = 0; // 0: intro, 1: welcome, 2: link id, 3: scan front, 4: scan back, 5: success
  int _introPage = 0;
  bool _consentChecked = false;
  final _studentIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PageController _introPageController = PageController();

  void _onStudentIdChanged() => setState(() {});

  @override
  void initState() {
    super.initState();
    _studentIdController.addListener(_onStudentIdChanged);
  }

  @override
  void dispose() {
    _studentIdController.removeListener(_onStudentIdChanged);
    _studentIdController.dispose();
    _introPageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_step == 0) {
      setState(() => _step = 1);
    } else if (_step == 1) {
      setState(() => _step = 2);
    } else if (_step == 2) {
      if ((_formKey.currentState?.validate() ?? false) && _consentChecked) {
        setState(() => _step = 3);
      }
    } else if (_step == 3) {
      setState(() => _step = 4);
    } else if (_step == 4) {
      setState(() => _step = 5);
    } else if (_step == 5) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/dashboard',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final s = PortalStrings(isMalay: AppLocale.instance.isMalay);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SafeArea(
              child: _step == 0
                  ? _buildIntroCarousel(s)
                  : _step == 1
                      ? _buildWelcome(s)
                      : _step == 2
                          ? _buildLinkStudentId(s)
                          : _step == 3
                              ? _buildScanFront(s)
                              : _step == 4
                                  ? _buildScanBack(s)
                                  : _buildSuccess(s),
            ),
          ),
        );
      },
    );
  }

  static const List<String> _introImages = [
    'assets/images/Group 4356.png',
    'assets/images/Group 4635.png',
    'assets/images/Group 4636.png',
  ];

  Widget _buildIntroCarousel(PortalStrings s) {
    final titles = [s.introSlide1Title, s.introSlide2Title, s.introSlide3Title];
    final subtitles = [
      s.introSlide1Subtitle,
      s.introSlide2Subtitle,
      s.introSlide3Subtitle,
    ];
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Image.asset(
                      'assets/images/LogoUiTM.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  TextButton(
                    onPressed: _nextStep,
                    child: Text(
                      s.skip,
                      style: const TextStyle(
                        color: Color(0xFF6A1B9A),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _introPageController,
                itemCount: 3,
                onPageChanged: (i) => setState(() => _introPage = i),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          height: 220,
                          alignment: Alignment.center,
                          child: Image.asset(
                            _introImages[index],
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.link_rounded,
                              size: 120,
                              color: const Color(0xFF6A1B9A).withOpacity(0.3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF424242),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          subtitles[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  final selected = _introPage == i;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: selected ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color(0xFF6A1B9A)
                          : const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_introPage >= 2) {
                      _nextStep();
                    } else {
                      _introPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    _introPage >= 2 ? s.getStarted : s.next,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF424242), size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcome(PortalStrings s) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              SizedBox(
                width: 250,
                height: 100,
                child: Image.asset(
                  'assets/images/LogoUiTM.png',
                  fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.link_rounded,
                  size: 80,
                  color: const Color(0xFF757575),
                ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                s.welcomeToBeUitm,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                s.linkStudentSubtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF757575),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A1B9A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    s.linkStudentAccount,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF424242), size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }

  Widget _buildLinkStudentId(PortalStrings s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF424242), size: 22),
                onPressed: () => setState(() => _step = 1),
              ),
              const Spacer(),
              SizedBox(
                width: 120,
                height: 48,
                child: Image.asset(
                  'assets/images/LogoUiTM.png',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
              const Spacer(),
              const SizedBox(width: 48),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  s.enterStudentIdToLink,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _studentIdController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Color(0xFF424242), fontSize: 16),
                    decoration: InputDecoration(
                      hintText: s.studentIdHint,
                      hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                      ),
                      labelText: s.studentId,
                      labelStyle: const TextStyle(color: Color(0xFF757575)),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return s.isMalay ? 'Sila masukkan ID Pelajar' : 'Please enter Student ID';
                      }
                      if (v.trim().length < 8) {
                        return s.isMalay ? 'ID Pelajar tidak sah' : 'Invalid Student ID';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _consentChecked,
                        onChanged: (v) => setState(() => _consentChecked = v ?? false),
                        activeColor: const Color(0xFF6A1B9A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          s.dataSharingConsent,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 24),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _studentIdController.text.trim().length >= 8 && _consentChecked
                    ? _nextStep
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A1B9A),
                  disabledBackgroundColor: const Color(0xFFE0E0E0),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: const Color(0xFF9E9E9E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  s.linkAndContinue,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScanFrame(PortalStrings s, bool isFront) {
    final hint = isFront ? s.scanFrontHint : s.scanBackHint;
    final label = isFront ? s.scanIcFront : s.scanIcBack;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            s.ekycVerification,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF424242),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF757575),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
                width: 3,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isFront ? Icons.credit_card : Icons.credit_card_rounded,
                      size: 80,
                      color: const Color(0xFFBDBDBD),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        hint,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _nextStep,
              icon: const Icon(Icons.camera_alt_rounded, size: 22),
              label: Text(s.capture),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanFront(PortalStrings s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF424242), size: 22),
              onPressed: () => setState(() => _step = 2),
            ),
          ),
        ),
        Expanded(child: _buildScanFrame(s, true)),
      ],
    );
  }

  Widget _buildScanBack(PortalStrings s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF424242), size: 22),
              onPressed: () => setState(() => _step = 3),
            ),
          ),
        ),
        Expanded(child: _buildScanFrame(s, false)),
      ],
    );
  }

  Widget _buildSuccess(PortalStrings s) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              size: 88,
              color: Color(0xFF4CAF50),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            s.accountLinkedSuccess,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF424242),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            s.accountLinkedSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFF757575),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
              ),
              child: Text(
                s.continueToDashboard,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
