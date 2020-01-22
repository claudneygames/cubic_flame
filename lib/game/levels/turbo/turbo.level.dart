import 'dart:math';
import 'dart:ui';

import 'package:cubic_flame/game/levels/turbo/turbo.bloc.dart';
import 'package:cubic_flame/game/objects/enemy.object.dart';
import 'package:cubic_flame/game/objects/player.object.dart';
import 'package:flame/game.dart';
import 'package:flame/time.dart';
import 'package:flutter/material.dart';

class TurboLevel extends BaseGame {
  final Size screenSize;
  Random random;
  TurboGameBloc bloc;

  /// Player
  PlayerObject player;
  bool demo;

  ///Enemies
  List<EnemyObject> enemies = [];
  // TODO: Adicionar a speed dentro do objeto do enemy
  double enemySpeed = 470;
  Timer enemyTimerCreator;
  double spawnCount = 1;

  bool pauseGame = false;
  bool justResumed = false;

  TurboLevel({
    @required this.screenSize,
    @required this.demo,
    @required this.bloc,
  }) {
    bloc.updateDifficultRegister(this);
    bloc.pauseGameRegister(this);

    random = Random();

    /// Instanciando o player
    player = PlayerObject(
      positionX: screenSize.width / 2,
      positionY: screenSize.height / 2,
      size: Size(screenSize.width * .1, screenSize.height * .057),
      color: Colors.white,
    );

    enemyTimerCreator = Timer(
      spawnCount,
      repeat: true,
      callback: () => createEnemy(),
    );

    enemyTimerCreator.start();
  }

  void pause(bool pause) {
    if (pause) {
      enemyTimerCreator.stop();
    } else {
      enemyTimerCreator = Timer(
        spawnCount,
        repeat: true,
        callback: () => createEnemy(),
      );
      enemyTimerCreator.start();
      justResumed = true;
    }

    pauseGame = pause;
  }

  void updateDifficult() {
    enemyTimerCreator = Timer(
      .15,
      repeat: true,
      callback: () => createEnemy(),
    );

    enemyTimerCreator.start();

    print(enemySpeed);
    print(spawnCount);
  }

  void createEnemy() {
    enemies.add(
      EnemyObject(
        positionX: (screenSize.width - 70) * random.nextDouble(),
        positionY: 0,
        size: Size(screenSize.width * .12, screenSize.height * .067),
        color: Colors.red,
        speed: enemySpeed,
      ),
    );
  }

  /// Função para mover o player quando chamada
  void onPlayerMove(Offset delta) {
    player.move(delta: delta, screenSize: screenSize);
  }

  @override
  void update(double dt) async {
    if (!bloc.pause) {
      if (justResumed) {
        dt = 0;
        justResumed = false;
      }

      if (player.dead) {
        player.dead = false;
      }

      if (demo) {
        player.checkMapLimit(screenSize: screenSize);
      }

      enemies.forEach((enemy) {
        if (player.checkColision(enemy)) {
          enemies = [];
        }
      });

      enemyTimerCreator.update(dt);

      /// Movendo o inimigo
      enemies.forEach((enemy) {
        enemy.move(delta: dt);
      });

      /// Removendo o inimigo quando sai da tela
      enemies.removeWhere((enemy) {
        return enemy.checkDeath(screenSize: screenSize, bloc: bloc);
      });
    }
  }

  /// Função para renderizar os objetos na tela
  @override
  void render(Canvas canvas) {
    if (demo) {
      player.render(canvas);
    }

    enemies.forEach((enemy) {
      enemy.render(canvas);
    });
  }
}