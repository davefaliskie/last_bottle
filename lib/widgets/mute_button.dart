import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';

class MuteButton extends ConsumerStatefulWidget {
  const MuteButton({
    super.key,
    this.currentSong,
  });

  // currentSong is the song file for the background song to play on unMute
  final String? currentSong;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MuteButtonState();
}

class _MuteButtonState extends ConsumerState<MuteButton> {
  @override
  Widget build(BuildContext context) {
    bool playSound = ref.watch(hiveRepositoryProvider).playSound;

    return IconButton(
      onPressed: () {
        // playSound in hive won't react to the update, so using setState
        // in this widget for instant change, then on rebuild playSound will update
        if (ref.read(hiveRepositoryProvider).playSound == true) {
          // we will now mute
          FlameAudio.bgm.stop();
          setState(() => playSound = false);
        } else {
          // we will now play
          if (widget.currentSong != null) {
            FlameAudio.bgm.play(widget.currentSong!, volume: 0.1);
          }
          setState(() => playSound = true);
        }
        ref.read(hiveRepositoryProvider).togglePlaySound();
      },
      icon: playSound
          ? const Icon(Icons.music_note_rounded)
          : const Icon(Icons.music_off_rounded),
    );
  }
}
