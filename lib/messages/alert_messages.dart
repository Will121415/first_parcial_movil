import 'package:flutter/material.dart';

messageResponde(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text('Mensaje Informativo...!'),
            content: Text('El perfil $name'),
          ));
}
