import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  // Реагирование на изменение стейта
  _LoginStore() {
    autorun((_) {
      print('_reaction_ email: ' + email);
      print('_reaction_ password: ' + password);
    });
  }

  // Наблюдение за полями
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;
}
