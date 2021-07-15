class User {
  int _id;
  String _name;
  String _email;
  String _password;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get email => _email;
  set email(value) => _email = value;

  get password => _password;
  set password(value) => _password = value;

  User({int id, String name = '', String email = '', String password = ''})
      : _id = id,
        _name = name,
        _email = email,
        _password = password;

  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            email: from.email,
            password: from.password);

  // User.fromJson(Map<String, dynamic> json)
  //     : _id = json['id'],
  //       _name = json['name'],
  //       _email = json['email'],
  //       _password = json['password'];

  // Map<String, dynamic> toJson() =>
  //     {'id': id, 'name': name, 'email': email, 'password': password};
}
