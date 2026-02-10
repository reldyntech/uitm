/// Bilingual strings for MyUiTM Student Portal (English & Malay)
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
  String get appName => 'MyUiTM';
  String get studentPortal => isMalay ? 'Portal Pelajar' : 'Student Portal';

  // Intro carousel (welcome)
  String get introSlide1Title => isMalay ? 'Bayar dengan mudah' : 'Make payment easily';
  String get introSlide1Subtitle =>
      isMalay ? 'Selesaikan yuran dan bil pelajar anda dengan pantas dan selamat melalui aplikasi.' : 'Settle your fees and student bills quickly and securely through the app.';
  String get introSlide2Title => isMalay ? 'Lihat keputusan' : 'View your results';
  String get introSlide2Subtitle =>
      isMalay ? 'Akses keputusan peperiksaan dan penyata transaksi anda bila-bila masa.' : 'Access your exam results and transaction statements anytime.';
  String get introSlide3Title => isMalay ? 'Akses perkhidmatan' : 'Access all services';
  String get introSlide3Subtitle =>
      isMalay ? 'Jadual waktu, tempah kemudahan, bantuan kewangan dan banyak lagi dalam satu aplikasi.' : 'Timetable, book facilities, financial aid and more – all in one app.';
  String get getStarted => isMalay ? 'Mulakan' : 'Get Started';
  String get skip => isMalay ? 'Langkau' : 'Skip';

  // Account activation (post sign-in)
  String get welcomeToUitmPlus => isMalay ? 'Selamat datang ke MyUiTM' : 'Welcome to MyUiTM';
  String get activateAccountSubtitle =>
      isMalay ? 'Aktifkan akaun anda dengan pengesahan eKYC (imbas kad pengenalan depan & belakang).' : 'Activate your account with eKYC verification (scan your IC front & back).';
  String get activateAccount => isMalay ? 'Aktifkan Akaun' : 'Activate Account';
  String get ekycVerification => isMalay ? 'Pengesahan eKYC' : 'eKYC Verification';
  String get scanIcFront => isMalay ? 'Imbas Kad Pengenalan (Depan)' : 'Scan IC (Front)';
  String get scanIcBack => isMalay ? 'Imbas Kad Pengenalan (Belakang)' : 'Scan IC (Back)';
  String get scanFrontHint => isMalay ? 'Letakkan bahagian depan kad pengenalan dalam bingkai' : 'Place the front of your IC within the frame';
  String get scanBackHint => isMalay ? 'Letakkan bahagian belakang kad pengenalan dalam bingkai' : 'Place the back of your IC within the frame';
  String get capture => isMalay ? 'Ambil Gambar' : 'Capture';
  String get next => isMalay ? 'Seterusnya' : 'Next';
  String get accountActivated => isMalay ? 'Akaun Berjaya Diaktifkan' : 'Account Successfully Activated';
  String get accountActivatedSubtitle =>
      isMalay ? 'Anda kini boleh menggunakan semua perkhidmatan MyUiTM.' : 'You can now use all MyUiTM services.';
  String get continueToPortal => isMalay ? 'Terus ke Portal' : 'Continue to Portal';

  // Be MyUiTM – link student flow
  String get welcomeToBeUitm => isMalay ? 'Selamat datang ke Be MyUiTM' : 'Welcome to Be MyUiTM';
  String get linkStudentSubtitle =>
      isMalay ? 'Sambungkan ID pelajar anda dan lengkapkan eKYC untuk menggunakan perkhidmatan MyUiTM.' : 'Link your student ID and complete eKYC to use MyUiTM services.';
  String get linkStudentAccount => isMalay ? 'Sambung Akaun Pelajar' : 'Link Student Account';
  String get enterStudentIdToLink => isMalay ? 'Masukkan ID Pelajar untuk disambungkan' : 'Enter your Student ID to link';
  String get linkAndContinue => isMalay ? 'Sambung & Seterusnya' : 'Link & Continue';
  String get accountLinkedSuccess => isMalay ? 'Akaun Berjaya Disambungkan' : 'Account Successfully Linked';
  String get accountLinkedSubtitle =>
      isMalay ? 'Anda kini boleh menggunakan perkhidmatan Be MyUiTM.' : 'You can now use Be MyUiTM services.';
  String get continueToDashboard => isMalay ? 'Terus ke Papan Pemuka' : 'Continue to Dashboard';
  String get dataSharingConsent =>
      isMalay
          ? 'Saya dengan ini bersetuju dan memberi kuasa untuk mendedahkan data peribadi saya kepada MyUiTM dan bersetuju bahawa data peribadi saya akan diproses mengikut notis privasi MyUiTM.'
          : 'I hereby consent and authorise the disclosure of my personal data to MyUiTM and agree that my personal data will be processed in accordance with MyUiTM\'s privacy notice.';

  // Student Portal Landing
  String get quickAccess => isMalay ? 'Akses Pantas' : 'Quick Access';
  String get hi => isMalay ? 'Hi' : 'Hi';
  String get welcomeToPortal => isMalay ? 'Selamat datang ke Portal Pelajar' : 'Welcome to Student Portal';
  String get announcements => isMalay ? 'Pengumuman' : 'Announcements';
  String get viewAll => isMalay ? 'Lihat Semua' : 'View All';
  String get bannerTagNew => isMalay ? 'BAHARU' : 'NEW';
  String get bannerTagImportant => isMalay ? 'PENTING' : 'IMPORTANT';
  String get bannerTagRecommended => isMalay ? 'DISYORKAN' : 'RECOMMENDED';

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
  String get changePassword => isMalay ? 'Tukar Kata Laluan' : 'Change Password';
  String get currentPassword => isMalay ? 'Kata Laluan Semasa' : 'Current Password';
  String get newPassword => isMalay ? 'Kata Laluan Baharu' : 'New Password';
  String get confirmNewPassword =>
      isMalay ? 'Sahkan Kata Laluan Baharu' : 'Confirm New Password';
  String get saveChanges => isMalay ? 'Simpan Perubahan' : 'Save Changes';
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
