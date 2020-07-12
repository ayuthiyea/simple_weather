/*
*   @file       parsed_response.dart
*   @project    Simple weather
*   @purpose    Generic response
*   @author     Athear Sky on 07/12/20
*   @copyright  Athear Sky
*/

import 'package:meta/meta.dart';

class ParsedResponse<T> {
  final int code;
  final String message;
  final T result;
  final int nextPage;
  final int totalRecords;
  final String tag;

  /*
  *   Constructor
  *
  *   @param          code            int           HTTP response code
  *   @param          message         String        Message
  *   @param          result          Dynamic       Responose in desired format
  *   @param          nextPage        int           Next page
  *   @param          totalRecords    int           Total number of all records
  *   @param          tag             String        Tag to identify the ParsedResponse object. Default null.
  *
  *   @return                         Future<http.Response>
  */
  ParsedResponse({
    @required this.code,
    this.message,
    this.result,
    this.nextPage,
    this.totalRecords,
    this.tag,
  }) : assert(code != null);

  /*
  *   Check if network connection error
  *
  *   @return         bool
  */
  bool isNetworkConnectionError() => code == 503;

  /*
  *   Check if unauthorization error
  *
  *   @return         bool
  */
  bool isUnauthorizationError() => code == 401;

  /*
  *   Check if error
  *
  *   @return         bool
  */
  bool isError() => code > 300;

  /*
  *   Check if it is the last page
  *
  *   @return         bool
  */
  bool isLastPage() => nextPage == null;
}