class UserModel {
  String? name, email, password;
  bool? login;
  UserModel({this.name, this.email, this.password,this.login});
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      name = map['name'];
      email = map['email'];
      password = map['password'];
      login = map['login'];
    }
  }

  toJson() {
    return {'name': name, 'email': email, 'password': password, 'login': login};
  }

  //for call in controller
    /*
  Future getName1() async {
    String? value = prefsFile!.getString('userModel');
    UserModel usermodel = value == null ? UserModel(): UserModel.fromJson(json.decode(value!));
    setState(() {
      name = usermodel.name; 
      email = usermodel.email;
    });
  }*/

  /*  static Future savePrefs1({email, password, name, login}) async {
    prefs!.setString(
        'userModel',
        jsonEncode(UserModel(
                name: name, email: email, password: password, login: login)
            .toJson()));
    print(prefs!.getString('userModel'));
  }
*/
}
