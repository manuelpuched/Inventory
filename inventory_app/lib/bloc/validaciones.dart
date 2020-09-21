
class Validaciones {

  bool validarArroba(
      String value) {
    return (!value.contains('@') || !value.contains('.'));
  }

  bool validarCaracteresEspeciales(String value) {
    return (value.contains('<') ||
        value.contains('>') ||
        value.contains('!') ||
        value.contains('¡') ||
        value.contains('¿') ||
        value.contains('?') ||
        value.contains('»') ||
        value.contains('#') ||
        value.contains(r'$') ||
        value.contains('%') ||
        value.contains('&') ||
        value.contains('‘') ||
        value.contains(' ') ||
        value.contains('(') ||
        value.contains(')') ||
        value.contains('*') ||
        value.contains('+') ||
        value.contains('-') ||
        value.contains(',') ||
        value.contains('/') ||
        value.contains(r'\'));
  }

  bool validarLongitud(String value, int longitud) {
    return (value.length < longitud);
  }

  bool validarMinimoUnaMayuscula(
      String value) {
    for (var i = 0; i < value.length; i++) {
      if (value[i] == value[i].toUpperCase()) {
    return true;
    }
  }
    return false;
  }

  bool validarUnSoloArroba(String value) {
    int cont = 0;
    for (var i = 0; i < value.length; i++) {
      if (value.contains('@')) {
        cont += 1;
      }
      if (cont > 1) {
        return true;
      }
    }
  }

  bool validarSoloLetras(String value){
    return (value.contains('0') ||
        value.contains('1') ||
        value.contains('2') ||
        value.contains('3') ||
        value.contains('4') ||
        value.contains('5') ||
        value.contains('6') ||
        value.contains('7') ||
        value.contains('7') ||
        value.contains('8') ||
        value.contains('9'));
  }

}