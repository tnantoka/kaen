import 'dart:async';
import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kaen/games/base_game.dart';

class AdmobGame extends BaseGame {
  var result = TextComponent();
  var button = ButtonComponent();
  var status = '';
  RewardedAd? rewardedAd;

  final adUnitId = 'ca-app-pub-3940256099942544/1712485313';

  @override
  Future<void> onLoad() async {
    grid = false;
    super.onLoad();

    button = ButtonComponent(
      position: Vector2(size.x * 0.5, size.y * 0.5),
      onPressed: () => showAd(),
      button: TextComponent(
        text: 'Loading...',
      ),
      anchor: Anchor.center,
    );
    await add(button);

    result = TextComponent(
      text: '',
      position: Vector2(size.x * 0.5, size.y * 0.6),
      anchor: Anchor.center,
    );
    await add(result);

    if (!kIsWeb && Platform.isIOS) {
      loadAd();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    result.text = status;
    if (rewardedAd != null) {
      (button.button as TextComponent).text = 'Show Ad';
    }
  }

  void loadAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  void showAd() {
    if (rewardedAd == null) {
      return;
    }

    rewardedAd?.show(
      onUserEarnedReward: (ad, reward) => {
        status = 'You earned ${reward.amount} ${reward.type}!',
      },
    );
  }
}
