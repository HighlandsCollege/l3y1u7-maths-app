import 'package:flutter/material.dart';

void navigate(BuildContext ctx, Widget route) {
  Navigator.push(
    ctx,
    PageRouteBuilder(
      pageBuilder: (context, _, __) => route,
      transitionDuration: Duration(seconds: 0),
    ),
  );
}
