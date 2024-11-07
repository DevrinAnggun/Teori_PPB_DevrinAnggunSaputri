import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Buat instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pengaturan inisialisasi untuk Android
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Pengaturan inisialisasi untuk iOS
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  // Menggabungkan semua pengaturan platform
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  // Inisialisasi plugin dengan pengaturan
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  runApp(MyApp());
}

// Langkah 4 - Fungsi untuk menampilkan notifikasi
Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // ID unik untuk channel
    'your_channel_name', // Nama channel
    channelDescription: 'your_channel_description', // Deskripsi channel
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0, // ID notifikasi
    'Hello!', // Judul notifikasi
    'This is a local notification.', // Isi notifikasi
    platformChannelSpecifics,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotificationScreen(),
    );
  }
}

// Langkah 5: Buat UI dengan Tombol untuk Menampilkan Notifikasi
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications")),
      body: Center(
        child: ElevatedButton(
          onPressed:
              showNotification, // Memanggil fungsi notifikasi saat tombol ditekan
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
