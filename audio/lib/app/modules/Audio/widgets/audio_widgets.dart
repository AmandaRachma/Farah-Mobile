import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/audio_controller.dart';

// Widget untuk menampilkan durasi audio yang diputar dan total durasi
class AudioDurationDisplay extends StatelessWidget {
  const AudioDurationDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioController controller = Get.find();
    return Obx(() {
      return Text(
        '${_formatDuration(controller.position.value)} / ${_formatDuration(controller.duration.value)}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    });
  }

  // Fungsi untuk memformat durasi menjadi menit:detik
  String _formatDuration(Duration duration) {
    return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}

// Widget untuk slider kontrol progres audio
class AudioProgressSlider extends StatelessWidget {
  const AudioProgressSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioController controller = Get.find();
    return Obx(() {
      return Slider(
        min: 0.0,
        max: controller.duration.value.inSeconds.toDouble(),
        value: controller.position.value.inSeconds.toDouble(),
        onChanged: (value) {
          controller.seekAudio(Duration(seconds: value.toInt()));
        },
      );
    });
  }
}

// Widget untuk kontrol pemutaran audio (Play, Pause/Resume, Stop)
class AudioControlWidget extends StatelessWidget {
  const AudioControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioController controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol Pause atau Resume
        ElevatedButton(
          onPressed: controller.isPlaying.value
              ? controller.pauseAudio
              : controller.resumeAudio,
          child: Text(controller.isPlaying.value ? 'Pause' : 'Resume'),
        ),
        const SizedBox(width: 10),
        // Tombol Stop
        ElevatedButton(
          onPressed: controller.stopAudio,
          child: const Text('Stop'),
        ),
      ],
    );
  }
}

// Widget untuk menampilkan daftar audio yang dapat dipilih
class AudioListView extends StatelessWidget {
  const AudioListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudioController controller = Get.find();
    return Obx(() {
      return Column(
        children: controller.audioUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.selectedAudioUrl.value == url
                    ? Color.fromARGB(255, 212, 104, 15) // Golden Yellow
                    : const Color.fromARGB(255, 202, 150, 19),
              ),
              onPressed: () {
                controller.playAudio(url);
              },
              child: Text(
                'Play Audio ${controller.audioUrls.indexOf(url) + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
