import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorMessage {
  static const errorMessage404 =
      'Erro 404. Tudo indica que esse recurso não existe mais no servidor... :(';
  static const errorMessage500 =
      'Erro 500. Tudo indica que o servidor está com problemas... :(\nQue tal tentar novamente mais tarde?';
  static const errorMessageUnknown =
      'Ah não, aconteceu um erro... :(\nVerifique se você está conectado à internet e tente novamente ou então volte mais tarde.';

  static Widget error(int errorCode) {
    final errorMessage = errorCode == 404
        ? errorMessage404
        : errorCode == 500
            ? errorMessage500
            : errorMessageUnknown;

    return Text(
      errorMessage,
      textAlign: TextAlign.center,
      style: GoogleFonts.sourceSansPro(
        color: Colors.white,
      ),
    );
  }
}
