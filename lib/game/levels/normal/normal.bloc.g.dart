// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'normal.bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NormalGameBloc on _NormalGameBloc, Store {
  final _$pauseAtom = Atom(name: '_NormalGameBloc.pause');

  @override
  bool get pause {
    _$pauseAtom.context.enforceReadPolicy(_$pauseAtom);
    _$pauseAtom.reportObserved();
    return super.pause;
  }

  @override
  set pause(bool value) {
    _$pauseAtom.context.conditionallyRunInAction(() {
      super.pause = value;
      _$pauseAtom.reportChanged();
    }, _$pauseAtom, name: '${_$pauseAtom.name}_set');
  }

  final _$scoreAtom = Atom(name: '_NormalGameBloc.score');

  @override
  int get score {
    _$scoreAtom.context.enforceReadPolicy(_$scoreAtom);
    _$scoreAtom.reportObserved();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.context.conditionallyRunInAction(() {
      super.score = value;
      _$scoreAtom.reportChanged();
    }, _$scoreAtom, name: '${_$scoreAtom.name}_set');
  }

  final _$updateDifficultAtom = Atom(name: '_NormalGameBloc.updateDifficult');

  @override
  bool get updateDifficult {
    _$updateDifficultAtom.context.enforceReadPolicy(_$updateDifficultAtom);
    _$updateDifficultAtom.reportObserved();
    return super.updateDifficult;
  }

  @override
  set updateDifficult(bool value) {
    _$updateDifficultAtom.context.conditionallyRunInAction(() {
      super.updateDifficult = value;
      _$updateDifficultAtom.reportChanged();
    }, _$updateDifficultAtom, name: '${_$updateDifficultAtom.name}_set');
  }

  final _$_NormalGameBlocActionController =
      ActionController(name: '_NormalGameBloc');

  @override
  void pauseGame({@required bool pause}) {
    final _$actionInfo = _$_NormalGameBlocActionController.startAction();
    try {
      return super.pauseGame(pause: pause);
    } finally {
      _$_NormalGameBlocActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateScore({@required int score}) {
    final _$actionInfo = _$_NormalGameBlocActionController.startAction();
    try {
      return super.updateScore(score: score);
    } finally {
      _$_NormalGameBlocActionController.endAction(_$actionInfo);
    }
  }
}
