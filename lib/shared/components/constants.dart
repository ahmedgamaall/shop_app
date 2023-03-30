import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

void signOut(context) => CacheHelper.removeDate(key: 'token').then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
      }
    });

String? token = '';