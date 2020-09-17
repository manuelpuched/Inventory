import 'package:flutter/material.dart';

class User {
  var name;
  var email;
  var id;
  var isVerified;

  User({
    Key key,
    this.name,
    @required this.email,
    @required this.id,
    @required this.isVerified
  });

}