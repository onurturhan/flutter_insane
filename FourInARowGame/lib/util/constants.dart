import 'package:flutter/foundation.dart';

const bool useLocalServer = false && kDebugMode;

const HOST = useLocalServer ? "192.168.0.87" : "fourinarow.ffactory.me";
const PORT = useLocalServer ? 40146 : 80;
const HOST_PORT = useLocalServer ? "$HOST:$PORT" : HOST;

const HTTP_PREFIX = "http" + (useLocalServer ? "" : "s");
const WS_PREFIX = "ws" + (useLocalServer ? "" : "s");
const HTTP_URL = HTTP_PREFIX + "://$HOST_PORT";

const WS_PATH = "$HOST_PORT/game/";

// const WS_URL = (useLocalServer ? "http" : "https") + "://$WS_PATH";

const String alphabet = "abcdefghijklmnopqrstuvwxyz";

const int QUEUE_CHECK_INTERVAL_MS = 250;

const int QUEUE_RESEND_TIMEOUT_MS = 700;

const int CHECK_CONN_INTERVAL_MS = 1000;

const int PROTOCOL_VERSION = 4;

const int STARTUP_DELAY_MS = 500;

const int QUICKCHAT_EMOJI_COUNT = 4;

const String LINKEDIN_PROFILE = "https://www.linkedin.com/in/filippo-orru/";

const List<String> ALLOWED_QUICKCHAT_EMOJIS = [
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "âēī¸",
  "đ",
  "đ¤",
  "đ¤",
  "đ",
  "đ",
  "đļ",
  "đ",
  "đ",
  "đŖ",
  "đĨ",
  "đŽ",
  "đ¤",
  "đ¯",
  "đĒ",
  "đĢ",
  "đ´",
  "đ",
  "đ¤",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ˛",
  "âšī¸",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ¤",
  "đĸ",
  "đ­",
  "đĻ",
  "đ§",
  "đ¨",
  "đŠ",
  "đŦ",
  "đ°",
  "đą",
  "đŗ",
  "đĩ",
  "đĄ",
  "đ ",
  "đ",
  "đ",
  "đē",
  "đ¸",
  "đš",
  "đģ",
  "đŧ",
  "đŊ",
  "đ",
  "đŋ",
  "đž",
  "đ",
  "đ",
  "đ",
  "đĒ",
  "âī¸",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ­",
  "đļ",
  "đē",
  "đĻ",
  "đą",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "đ",
  "â¨",
  "đ",
  "đ"
];

const bool SKIP_SPLASH_ANIM_ON_DEBUG = kDebugMode && false;
