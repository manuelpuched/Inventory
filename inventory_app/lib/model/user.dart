import 'package:flutter/material.dart';

class User {
  var name;
  var email;
  var id;
  var isVerified;

  User({
    Key key,
    this.name,
    this.email,
    this.id,
    this.isVerified
  });

}