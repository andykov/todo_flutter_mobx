// State
import 'package:mobx/mobx.dart';

// Генерация кода
part 'counter.g.dart';

// смешиваем наш класс с сгенерированным классом
class Counter = _Counter with _$Counter;

// with Store говорит что нужно соблюдать все @анотации
// чтобы наблюдать за состоянием и делать с ним что-то
abstract class _Counter with Store {
  // Назначение наблюдаемой переменной
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }
}
