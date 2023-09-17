// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';

// APP CONSTANTS
const APP_CODE = "";
const APP_NAME = "";
const BACKEND_ROOT = "";
const BACKEND_API = "$BACKEND_ROOT/api/";

// STORAGES KEYs
const STORAGE_KEY = kDebugMode ? "$APP_CODE-STORE" : "$APP_CODE-LOCAL_STORE_PROD";
const THEME_KEY = kDebugMode ? "ThemeMode" : "$APP_CODE-THEME_MODE_PROD";
const ACCESS_TOKEN = kDebugMode ? "$APP_CODE-USER-ACCESS-TOKEN" : "$APP_CODE-USER_ACCESS_TOKEN_PROD";
const USER_INFOS = kDebugMode ? "$APP_CODE-USER-INFOS" : "$APP_CODE-USER_INFOS_PROD";
const IS_FIRST_OPEN_APP_KEY =
    kDebugMode ? "$APP_CODE-FIRST-OPEN-APP" : "$APP_CODE-FIRST_OPEN_APP_PROD";