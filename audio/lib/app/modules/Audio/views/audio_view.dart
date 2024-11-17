import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/audio_controller.dart';
import '../widgets/audio_widgets.dart';  // Mengimpor file yang berisi semua widget audio

class AudioView extends GetView<AudioController> {
  const AudioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        backgroundColor: Color.fromARGB(255, 248, 182, 89), // Warna emas kuning
      ),
      body: Container(
        color: Colors.white, // Warna latar belakang putih
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menampilkan daftar pilihan audio
            const AudioListView(),

            const SizedBox(height: 20),

            // Slider untuk mengontrol posisi audio
            const AudioProgressSlider(),

            const SizedBox(height: 20),

            // Menampilkan waktu yang sudah diputar dan durasi total
            const AudioDurationDisplay(),

            const SizedBox(height: 20),

            // Tombol untuk mengontrol pemutaran audio (Play, Pause/Resume, Stop)
            const AudioControlWidget(),
          ],
        ),
      ),
    );
  }
}
