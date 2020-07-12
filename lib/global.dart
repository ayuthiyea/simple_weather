/*
*   @file       global.dart
*   @project    Simple weather
*   @purpose    Singletone to store global variables
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear
*/

class Global {
  static final Global _global = new Global._internal();

  /*
  *   Constructor 
  */
  factory Global() {
    return _global;
  }

  /*
  *   Clear all variables
  *
  *   @return       void
  */
  clearAll() {
  }

  Global._internal();
}

Global global = Global();