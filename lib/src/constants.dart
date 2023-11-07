import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final kNoovoApisBase = dotenv.env['DEBUG_MODE'] == 'true'? dotenv.env['API_BASE_URL_DEV']: dotenv.env['API_BASE_URL_PROD'];
const kTncUrl = 'https://www.noovoleum.com/terms-and-conditions';
const kPolicyUrl = 'https://www.noovoleum.com/privacy-policy';

const kVersion = '1.2.2+20';

const kTimedPageRouteDuration = Duration(milliseconds: 500);
const kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
const kAllPadding = EdgeInsets.all(16.0);
const kTopRounded = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)));
const kAllRounded = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)));
const kRadius = 16.0;

// Assets
const kPlaneAnimation = 'anim/plane.json';
const kStarAnimation = 'anim/star.json';
const kGoogleIcon = 'svg/google_g_icon.svg';
const kGoogleMaps = 'svg/google_maps_old.svg';
const kUcoOutlined = 'svg/uco_outlined.svg';
const kUcoFlag = 'images/ucoflag.png';
const kUcoOfflineFlag = 'images/ucoofflineflag.png';
const kUcoPlannedFlag = 'images/ucoplannedflag.png';
const kUcoClosedFlag = 'images/ucoclosedflag.png';
const kUcoFullFlag = 'images/ucoofflineflag.png';
const kFillTheBoxAnimation = 'anim/fill_the_box.json';
const kUcoLogo = 'images/icon_circle_1024x1024.png';
const kEmpty = 'images/empty.png';
const kUcoBy = 'images/ucollect_by_noovoleum.png';
const kHourglassAnimation = 'anim/hourglass.json';
const kClockAnimation = 'anim/clock.json';
const kMaps = 'images/maps.png';

// Placeholder
const kUcoBoxImages = [
  'https://i.ibb.co/cxDr1pP/IMG-20230831-142214.jpg',
  'https://i.ibb.co/mvcjcRH/IMG-20230831-142319.jpg',
  'https://i.ibb.co/hmwKkFg/IMG-20230831-142428.jpg',
];
