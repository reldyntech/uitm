/// Bilingual strings for UiTM+ Student Portal (English & Malay)
class PortalStrings {
  final bool isMalay;

  PortalStrings({this.isMalay = false});

  // Login screen
  String get signIn => isMalay ? 'Log Masuk' : 'Sign In';
  String get signInSubtitle =>
      isMalay ? 'Masukkan butiran akaun anda untuk Log Masuk.' : 'Enter your account details to Sign in.';
  String get studentId => isMalay ? 'ID Pelajar' : 'Student ID';
  String get studentIdHint => isMalay ? 'cth. 2020123456' : 'e.g., 2020123456';
  String get password => isMalay ? 'Kata Laluan' : 'Password';
  String get passwordHint => isMalay ? 'Masukkan kata laluan' : 'Enter your password';
  String get forgotPassword => isMalay ? 'Lupa kata laluan?' : 'Forgot password?';
  String get welcomeBack => isMalay ? 'Selamat kembali!' : 'Welcome back!';
  String get appName => 'UiTM+';
  String get studentPortal => isMalay ? 'Portal Pelajar' : 'Student Portal';

  // Student Portal Landing
  String get quickAccess => isMalay ? 'Akses Pantas' : 'Quick Access';
  String get hi => isMalay ? 'Hi' : 'Hi';
  String get welcomeToPortal => isMalay ? 'Selamat datang ke Portal Pelajar' : 'Welcome to Student Portal';

  // Feature names (EN / BM)
  String get bilPelajar => isMalay ? 'Bil Pelajar' : 'Student Bill';
  String get skimKhidmatPelajar => isMalay ? 'Skim Khidmat Pelajar' : 'Student Service Scheme';
  String get penyataTransaksi => isMalay ? 'Penyata Transaksi' : 'Transaction Statement';
  String get timetable => isMalay ? 'Jadual Waktu' : 'Timetable';
  String get myResults => isMalay ? 'Keputusan Saya' : 'My Results';
  String get outstandingFees => isMalay ? 'Yuran Tertunggak' : 'Outstanding Fees';
  String get bookFacilities => isMalay ? 'Tempah Kemudahan' : 'Book Facilities';
  String get financialAid => isMalay ? 'Bantuan Kewangan' : 'Financial Aid';

  // Tab labels
  String get tabHome => isMalay ? 'Laman Utama' : 'Home';
  String get tabFinancial => isMalay ? 'Kewangan' : 'Financial';
  String get tabTransaction => isMalay ? 'Penyata' : 'Statement';
  String get tabProfile => isMalay ? 'Profil' : 'Profile';

  // Profile
  String get myProfile => isMalay ? 'Profil Saya' : 'My Profile';
  String get personalInfo => isMalay ? 'Maklumat Peribadi' : 'Personal Info';
  String get settings => isMalay ? 'Tetapan' : 'Settings';
  String get logout => isMalay ? 'Log Keluar' : 'Log Out';

  // Transaction Statement
  String get transactionHistory => isMalay ? 'Sejarah Transaksi' : 'Transaction History';
  String get filterBy => isMalay ? 'Tapis mengikut' : 'Filter by';
  String get date => isMalay ? 'Tarikh' : 'Date';
  String get description => isMalay ? 'Keterangan' : 'Description';
  String get amount => isMalay ? 'Jumlah' : 'Amount';
  String get balance => isMalay ? 'Baki' : 'Balance';

  // Financial Services
  String get financialServices => isMalay ? 'Perkhidmatan Kewangan' : 'Financial Services';
  String get studentFinancialServices => isMalay ? 'Perkhidmatan Kewangan Pelajar' : 'Student Financial Services';
  String get payNow => isMalay ? 'Bayar Sekarang' : 'Pay Now';
  String get viewBills => isMalay ? 'Lihat Bil' : 'View Bills';
  String get paymentHistory => isMalay ? 'Sejarah Pembayaran' : 'Payment History';
  String get totalOutstanding => isMalay ? 'Jumlah Tertunggak' : 'Total Outstanding';
  String get dueDate => isMalay ? 'Tarikh Luput' : 'Due Date';
  String get feeBreakdown => isMalay ? 'Butiran Yuran' : 'Fee Breakdown';
  String get recentPayments => isMalay ? 'Pembayaran Terkini' : 'Recent Payments';
  String get paymentMethods => isMalay ? 'Kaedah Pembayaran' : 'Payment Methods';
  String get quickActions => isMalay ? 'Tindakan Pantas' : 'Quick Actions';
}
