import 'dart:math';

import 'package:logger/logger.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailService {
  static final EmailService _instance = EmailService._internal();

  factory EmailService() => _instance;

  EmailService._internal();
  String GenerateOtpCode() {
    Random random = Random();
    int randomNumber =
        random.nextInt(9000) + 1000; // Tạo số ngẫu nhiên từ 100000 đến 999999
    return randomNumber.toString();
  }

  final String username = "nghiazorovn2304@gmail.com";
  final String password = "vybg nvyj duqa uafy";

  Future<void> sendOtpEmail(String toEmail, String otp) async {
    final smtpServer = gmail(username, password);
    Logger().i('debug sent email');

    final message = Message()
      ..from = Address(username, 'HealthyCare Service')
      ..recipients.add(toEmail)
      ..subject = '$otp là mã xác minh cho ứng dụng HealthyCare Service của bạn'
      ..html = '''
        <p>Xin chào bạn,
Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu của bạn.
Nhập mã đặt lại mật khẩu sau đây: </p>
<p><strong>$otp</strong></p>
        <p>Cảm ơn vì đã sử dụng dịch vụ.</p>
''';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } catch (e) {
      print('Error while sending email: $e');
    }
  }
  // Future<void> sendOtpEmail({required String toEmail, String? otp}) async {
  //   final Email email = Email(
  //     body: 'Your OTP is: $otp\n\nUse this code to reset your password.',
  //     subject: 'Password Reset Request',
  //     recipients: [toEmail],
  //     isHTML: false,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //     print('Email sent successfully');
  //   } catch (e) {
  //     print('Error while sending email: $e');
  //   }
  // }
}
