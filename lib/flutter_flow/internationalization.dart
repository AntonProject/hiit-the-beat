import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de', 'ja'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
    String? jaText = '',
  }) =>
      [enText, deText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'zyn6613l': {
      'en': 'Ready to HIIT the Beat!?',
      'de': 'Ready to HIIT the Beat?',
      'ja': 'Ready to HIIT the Beat!?',
    },
    'jpj2h32k': {
      'en': 'Specify the name',
      'de': 'Dein Name',
      'ja': '名前を指定してください',
    },
    'tl3nwgo4': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'c31rrmc2': {
      'en': 'New Seasons you can be interested in',
      'de': 'Neue Seasons, welche dich interessieren könnten',
      'ja': '興味を持てる新しい季節',
    },
    '6i91y6f5': {
      'en': 'See all',
      'de': 'Alle sehen',
      'ja': 'すべてを見る',
    },
    'jvnot9x8': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AuthPage
  {
    '96c5bviw': {
      'en': 'THIS ISN\'T JUST\n',
      'de': '',
      'ja': '',
    },
    'i7328muh': {
      'en': 'ANOTHER WORKOUT',
      'de': '',
      'ja': '',
    },
    'uctmduz2': {
      'en':
          'Strength. Coordination. Mobility. Control. Rhythm.\nAll at once. Led by music',
      'de':
          'Alles, was du brauchst, um fitter und beweglicher zu werden – und das mit Spaß! Erlebe das abwechslungsreiche Workout der Welt',
      'ja': '最高の潜在能力を発揮し、これまで以上に健康になるために必要なものすべて',
    },
    '0idktth0': {
      'en': 'Let´s Go!',
      'de': 'Let\'s go!',
      'ja': 'Let´s Go!',
    },
    '2om38dqf': {
      'en': 'Continue as a guest',
      'de': 'Weiter als Gast',
      'ja': 'ゲストとして続行',
    },
    'w1gkszh2': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // LoginPage
  {
    '0b03u0ly': {
      'en': 'Log in',
      'de': 'Einloggen',
      'ja': 'ログイン',
    },
    'ehfrnzwl': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'ja': 'Googleで続行',
    },
    'wq7qouzf': {
      'en': ' ',
      'de': ' ',
      'ja': '',
    },
    'k33phmp9': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'ja': 'Appleで続ける',
    },
    '7jtsjcbs': {
      'en': ' ',
      'de': ' ',
      'ja': '',
    },
    'hx3a7fwb': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'メール',
    },
    'ls0i1yda': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'h1zqnrh4': {
      'en': 'Password',
      'de': 'Passwort',
      'ja': 'パスワード',
    },
    'i14xpeae': {
      'en': '',
      'de': '',
      'ja': '',
    },
    's2ir1gfg': {
      'en': 'Wrong email or password',
      'de': 'Falsche E-Mail oder falsches Passwort',
      'ja': 'メールアドレスまたはパスワードが間違っています',
    },
    'lmk31nfw': {
      'en': 'Min 6 symbols',
      'de': 'Mindestens 6 Symbole',
      'ja': '最小6文字',
    },
    'kpmori2z': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
      'ja': '最大50個のシンボル',
    },
    'nms2mp58': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'k6i77tfl': {
      'en': 'Wrong email or password',
      'de': 'Falsche E-Mail oder falsches Passwort',
      'ja': 'メールアドレスまたはパスワードが間違っています',
    },
    'qlovy6lc': {
      'en': 'Min 6 symbols',
      'de': 'Mindestens 6 Symbole',
      'ja': '最小6文字',
    },
    'nwzovgo8': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
      'ja': '最大50個のシンボル',
    },
    'icy1o40j': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '65uwhj9e': {
      'en': 'Log in',
      'de': 'Einloggen',
      'ja': 'ログイン',
    },
    'um9xxlwd': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
      'ja': 'アカウントを削除しました',
    },
    '5a9zo0d2': {
      'en': 'Create an account',
      'de': 'Konto erstellen',
      'ja': 'アカウントを作成する',
    },
    'bemqp759': {
      'en': 'Restore password',
      'de': 'Passwort wiederherstellen',
      'ja': 'パスワードを復元する',
    },
    'n1zle6um': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // RestorePasswordPage
  {
    'e3r2xp78': {
      'en': 'Specify the email of the account. We’ll send a link to it',
      'de':
          'Gib die E-Mail-Adresse deines Kontos an. Wir senden dir einen Link zu',
      'ja': 'アカウントのメールアドレスを指定してください。リンクをお送りします。',
    },
    'xst6ms61': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'メール',
    },
    'ajw1w4hx': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'm9k8h0bc': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    'mzxyqw4w': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    '8q6mgrph': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    'gmrns7b0': {
      'en': 'Invalid format',
      'de': 'Invalid format',
      'ja': '無効な形式',
    },
    '3zdqxqxr': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'yk8vruk7': {
      'en': 'Send link',
      'de': 'Link senden',
      'ja': 'リンクを送信',
    },
    'luay2p8d': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // SignupPage
  {
    'qpe0i4iv': {
      'en': 'Create an account',
      'de': 'Melden Sie sich an',
      'ja': 'サインアップ',
    },
    'xdayj45h': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'ja': 'Googleで続行',
    },
    'ma1eu5tp': {
      'en': ' ',
      'de': ' ',
      'ja': '',
    },
    '9otzq9f4': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
      'ja': 'Appleで続ける',
    },
    '1fhh2vy2': {
      'en': ' ',
      'de': ' ',
      'ja': '',
    },
    'tpa0swpa': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'メール',
    },
    'ng6iqkp9': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'r3ap7ve4': {
      'en': 'Email format: example@gmail.com',
      'de': 'E-Mail-Format: example@gmail.com',
      'ja': 'メール形式: example@gmail.com',
    },
    'f7gxcf2d': {
      'en': 'Password',
      'de': 'Passwort',
      'ja': 'パスワード',
    },
    'd0cbunsw': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'tnk23wy1': {
      'en': 'Minimun 8 symbols, 1 uppercase, 1 lowercase, 1 digit',
      'de': 'Minimum 8 Symbole, 1 Großbuchstabe, 1 Kleinbuchstabe, 1 Ziffer',
      'ja': '最低8文字（大文字1文字、小文字1文字、数字1文字）',
    },
    'y73tgpgd': {
      'en': 'Confirm password',
      'de': 'Passwort bestätigen',
      'ja': 'パスワードを認証する',
    },
    't9m03n10': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'pfmh482s': {
      'en': 'Passwords don’t match',
      'de': 'Passwörter stimmen nicht überein',
      'ja': 'パスワードが一致しません',
    },
    'iais1jrj': {
      'en': 'Already have an account?',
      'de': 'Du hast bereits ein Konto?',
      'ja': 'すでにアカウントをお持ちですか?',
    },
    'tzz4jrav': {
      'en': 'Log in',
      'de': 'Einloggen',
      'ja': 'ログイン',
    },
    'd938p4wk': {
      'en': 'Create an account',
      'de': 'Anmelden',
      'ja': 'サインアップ',
    },
    '832zg69i': {
      'en': 'By continuing you agree to ',
      'de': 'Indem du fortfährst, stimmst du den ',
      'ja': '続行すると、 ',
    },
    'k14a619k': {
      'en': 'privacy policy',
      'de': 'Datenschutzbestimmungen',
      'ja': 'プライバシーポリシー',
    },
    's2snf0yf': {
      'en': ' and ',
      'de': ' und ',
      'ja': ' と ',
    },
    'nq4gnljx': {
      'en': 'terms of use',
      'de': 'Nutzungsbedingungen',
      'ja': '利用規約',
    },
    'zekj8yvj': {
      'en': ' ',
      'de': ' zu',
      'ja': '',
    },
    'skf0wkcd': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // EmailVerificationPage
  {
    'k69d8798': {
      'en': 'We sent the link to the ',
      'de': '',
      'ja': '',
    },
    '3ia1zkt2': {
      'en': 'We sent the link to the ',
      'de': 'Wir haben den Link gesendet an ',
      'ja': 'リンクを送信しました ',
    },
    't7ecpc98': {
      'en': 'Please check your inbox and tap the link to verify your email',
      'de': 'Folge diesem Link, um die E-Mail zu bestätigen',
      'ja': 'メールを確認するにはこのリンクをクリックしてください',
    },
    'uhvqp6ie': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'hfm8dggh': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'mofwqd4n': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // ChangeEmailPage
  {
    'hb1fajmx': {
      'en': 'Change email',
      'de': 'E-Mail ändern',
      'ja': 'メールアドレスを変更する',
    },
    '92f2t3t3': {
      'en': 'Specify a new email. We’ll send a link to it',
      'de':
          'Geben Sie eine neue E-Mail-Adresse an. Wir senden Ihnen einen Link dorthin.',
      'ja': '新しいメールアドレスを指定してください。リンクをお送りします',
    },
    '7ggrr4md': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'メール',
    },
    'pu2oymgj': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'eslscnx6': {
      'en': 'Send link',
      'de': 'Link senden',
      'ja': 'リンクを送信',
    },
    '0f4p6r2s': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // EmailChangeSendLinkPage
  {
    'z90bzxho': {
      'en': 'We sent the link to the ',
      'de': '',
      'ja': '',
    },
    'qt0qsldk': {
      'en': 'We sent the link to the',
      'de': 'Wir haben den Link an die',
      'ja': 'リンクを送信しました ',
    },
    'rvff6jvm': {
      'en': 'Follow this link to change email',
      'de': 'Folgen Sie diesem Link, um die E-Mail-Adresse zu ändern',
      'ja': 'メールを確認するにはこのリンクをクリックしてください',
    },
    'ma77uizh': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'urbuh3wp': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'rahceb1b': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // PhoneEditPage
  {
    'bqk7btp1': {
      'en': 'Add phone number',
      'de': 'Telefonnummer hinzufügen',
      'ja': '電話番号を追加',
    },
    'orboc767': {
      'en': 'Specify a phone number',
      'de': 'Gebe deine Handynummer an',
      'ja': '電話番号を指定してください',
    },
    'rjvc7b2z': {
      'en': 'It’ll help us research and improve your experience',
      'de': 'Es wird uns helfen, dein Workout Erlebnis zu verbessern',
      'ja': '調査とユーザー体験の向上に役立ちます',
    },
    's7qpwtrt': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'ja': '電話番号',
    },
    'r69m3gmj': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '8ohtu3pm': {
      'en': 'Save',
      'de': 'Speichern',
      'ja': '保存',
    },
    '64tfehk4': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // TermsPage
  {
    'qd3rx64d': {
      'en': 'Terms & conditions',
      'de': 'Allgemeine Geschäftsbedingungen',
      'ja': '利用規約',
    },
    'wfo5zhc6': {
      'en':
          'TERMS AND CONDITIONS – BREAKLETICS WORKOUTS\n\n1. Introduction\n\n',
      'de': 'AGB – BREAKLETICS WORKOUTS\n\n1. Einleitung\n\n',
      'ja': '利用規約 – BREAKLETICSワークアウト\n\n1. はじめに\n\n',
    },
    '11jk5d9h': {
      'en':
          'HIIT the Beat & BREAKLETICS combines functional training with breakdance concepts. It addresses all of those, who enjoy movement and who are interested in trying a new, extremely motivating way of doing sports. The exercises are available in multiple variations and difficulties, that upon each other. Therefore, participants can be supported according to their level of fitness and stay motivated for the long-term. Our online work outs and courses are required to enhance your physical fitness, strengthen your self-confidence and to enjoy the movement. There is no prior knowledge required on the area of dance or acrobatics. Frequent and dynamic variations, different levels of difficulty and continuous motivation through music and trainers ensure that even experienced participants won’t get bored. The following General Terms and Conditions of Business set out the legal framework for using Breakletics and the services that we offer. Therefore, please read these General Terms and Conditions of Business carefully.\n\n',
      'de':
          'HIIT the Beat & BREAKLETICS verbindet funktionelles Training mit Breakdance-Konzepten. Es richtet sich an alle, die Spaß an Bewegung haben und eine neue, äußerst motivierende Sportart ausprobieren möchten. Die Übungen sind in mehreren Variationen und Schwierigkeitsgraden verfügbar, die aufeinander aufbauen. So können die Teilnehmer entsprechend ihres Fitnesslevels gefördert und langfristig motiviert werden. Unsere Online-Workouts und Kurse sind darauf ausgerichtet, deine körperliche Fitness zu steigern, dein Selbstbewusstsein zu stärken und Spaß an der Bewegung zu haben. Es sind keine Vorkenntnisse im Bereich Tanz oder Akrobatik erforderlich. Häufige und dynamische Variationen, unterschiedliche Schwierigkeitsgrade und kontinuierliche Motivation durch Musik und Trainer sorgen dafür, dass auch erfahrenen Teilnehmern keine Langeweile aufkommt. Die nachfolgenden Allgemeinen Geschäftsbedingungen legen den rechtlichen Rahmen für die Nutzung von Breakletics und den von uns angebotenen Diensten fest. Bitte lies dir diese Allgemeinen Geschäftsbedingungen daher sorgfältig durch.\n\n',
      'ja':
          'HIIT the Beat & BREAKLETICSは、ファンクショナルトレーニングとブレイクダンスのコンセプトを組み合わせたプログラムです。体を動かすことを楽しむ方、そして新しく非常にモチベーションの高いスポーツに挑戦したい方すべてにご満足いただけます。エクササイズは複数のバリエーションと難易度をご用意しており、それぞれが独立して取り組むことができます。そのため、参加者はそれぞれの体力レベルに合わせてサポートを受け、長期的なモチベーションを維持できます。当社のオンラインワークアウトとコースは、体力の向上、自信の強化、そして動きを楽しむことを目的としています。ダンスやアクロバットに関する事前の知識は一切不要です。頻繁でダイナミックなバリエーション、さまざまな難易度、そして音楽とトレーナーによる継続的なモチベーションにより、経験豊富な参加者でも飽きることなくお楽しみいただけます。以下の一般取引条件は、Breakleticsおよび当社が提供するサービスの利用に関する法的枠組みを定めたものです。したがって、本一般取引条件をよくお読みください。\n\n',
    },
    'izylydxv': {
      'en':
          '2. Scope\n\n2.1. Parties to the contract and subject matter of the contract\n\n',
      'de':
          '2. Geltungsbereich\n\n2.1. Vertragsparteien und Vertragsgegenstand\n\n',
      'ja': '2. 適用範囲\n\n2.1. 契約当事者および契約の対象\n\n',
    },
    'jgqjdkni': {
      'en':
          'These General Terms and Conditions of Business form the basis of the user contract being formed between you and us, Breakletics GmbH, Mont-Cenis-Str. 6, 44623 Herne (hereinafter referred to as “us” or “we”). The subject matter of this contract is the use, free of charge or for a fee, of the services we offer under the name HIIT the Beat & BREAKLETICS via our website www.hiit-the-beat.com, other BREAKLETICS® websites or via our software applications (hereinafter referred to individually as “Breakletics Service” or collectively as “Breakletics Services” or in general “Breakletics” or \"HIIT the Beat\")..\n\n',
      'de':
          'Diese Allgemeinen Geschäftsbedingungen bilden die Grundlage des zwischen Ihnen und uns, der Breakletics GmbH, Mont-Cenis-Str. 6, 44623 Herne (nachfolgend „uns“ oder „wir“) zustande kommenden Nutzungsvertrages. Gegenstand dieses Vertrages ist die unentgeltliche oder entgeltliche Nutzung der von uns unter der Bezeichnung HIIT the Beat & BREAKLETICS über unsere Website www.hiit-the-beat.com, andere BREAKLETICS®-Websites oder über unsere Software-Applikationen angebotenen Dienste (nachfolgend einzeln „Breakletics-Dienst“ oder gemeinsam „Breakletics-Dienste“ oder allgemein „Breakletics“ oder „HIIT the Beat“).\n\n',
      'ja':
          '本一般取引条件は、お客様とBreakletics GmbH（所在地：Mont-Cenis-Str. 6, 44623 Herne、以下「当社」）との間で締結されるユーザー契約の基礎となります。本契約の主題は、当社がHIIT the Beat & BREAKLETICSの名称で、当社のウェブサイトwww.hiit-the-beat.com、その他のBREAKLETICS®ウェブサイト、または当社のソフトウェアアプリケーションを通じて提供するサービス（以下、個別に「Breakleticsサービス」、総称して「Breakleticsサービス」、または総称して「Breakletics」または「HIIT the Beat」）を、無料または有料でご利用いただくことです。\n\n',
    },
    'c9iuu5f6': {
      'en': '2.2. Terms and conditions for participating\n\n',
      'de': '2.2. Teilnahmebedingungen\n\n',
      'ja': '2.2. 参加規約\n\n',
    },
    'epmwbahx': {
      'en':
          'A condition for opening a user account and using the Breakletics Services is that you are at least 18 years of age and have full legal capacity. HIIT the Beat & BREAKLETICS is intended exclusively for consumers. The legal definition of a consumer is every natural person that enters into a legal transaction for reasons that cannot be chiefly attributed to either their commercial or their self-employed occupation. Use of HIIT the Beat & BREAKLETICS for commercial purposes of any kind is expressly prohibited.\n\n',
      'de':
          'Voraussetzung für die Eröffnung eines Benutzerkontos und die Nutzung der Breakletics-Dienste ist, dass du mindestens 18 Jahre alt und voll geschäftsfähig bist. HIIT the Beat & BREAKLETICS richtet sich ausschließlich an Verbraucher. Verbraucher ist im Sinne der gesetzlichen Definition jede natürliche Person, die ein Rechtsgeschäft zu Zwecken abschließt, die überwiegend weder ihrer gewerblichen noch ihrer selbständigen beruflichen Tätigkeit zugerechnet werden können. Eine Nutzung von HIIT the Beat & BREAKLETICS zu gewerblichen Zwecken jedweder Art ist ausdrücklich untersagt.\n\n',
      'ja':
          'ユーザーアカウントを開設し、Breakletics サービスをご利用いただくには、18歳以上であり、完全な法的行為能力を有していることが条件となります。HIIT the Beat & BREAKLETICS は消費者のみを対象としています。消費者の法的定義は、商業上または自営業上のいずれにも主として帰属しない理由で法的取引を行うすべての自然人です。HIIT the Beat & BREAKLETICS をいかなる商業目的でもご利用いただくことは明示的に禁止されています。\n\n',
    },
    'yk8ovu46': {
      'en': '2.3. Additional terms and conditions\n\n',
      'de': '2.3. Zusätzliche Bedingungen\n\n',
      'ja': '2.3. 追加の利用規約\n\n',
    },
    'hlikr382': {
      'en':
          'We reserve the right to agree to additional terms and conditions for individual Breaketics Services. We will, however, notify you of this in good time prior to use.\n\n',
      'de':
          'Wir behalten uns vor, für einzelne Breaketics Dienste zusätzliche Bedingungen zu vereinbaren. Hierauf werden wir Dich jedoch rechtzeitig vor der Nutzung hinweisen.\n\n',
      'ja':
          '当社は、個々のBreaeticsサービスについて追加の利用規約に同意する権利を留保します。ただし、ご利用前に十分な余裕を持ってその旨をお知らせいたします。\n\n',
    },
    't636bn94': {
      'en':
          '3. Your Health\n\n3.1. Terms and conditions with regard to your health\n\n',
      'de':
          '3. Ihre Gesundheit\n\n3.1. Bedingungen in Bezug auf Ihre Gesundheit\n\n',
      'ja': '3. お客様の健康\n\n3.1. お客様の健康に関する利用規約\n\n',
    },
    'm3z5s105': {
      'en':
          'Use of the HIIT the Beat & BREAKLETICS Services is at your own risk. In any case a condition for the use of the HIIT the Beat & BREAKLETICS Services is that you must be in a good general state of health. If you have knowledge of any pre-existing medical conditions we advise you to seek medical advice from a doctor urgently before you start the Breakletics Services (such as trainings or coachings). This applies in particular if you have knowledge of one or more of the following medical complaints/conditions/procedures: (i) cardiovascular disease, (ii) lung or respiratory disease (including asthma), (iii), spinal and/or joint problems, (iv) neuromuscular disease, (v) surgical procedures, (vi) any other health issues\n\nIn case of Breakletics Services related to nutrition, you are responsible for verifying that the foods and nutrients recommended as part of the coaching or guide do not contain any ingredients or contents to which you are allergic or which may cause food intolerance.\n\nFor our female customers it is important to mention, that our plans should not be used by pregnant or breastfeeding mothers.\n\nThe following general rules apply: Listen to what your body is telling you. Before using the Breakletics Services for the first time or while using Breakletics, if you have any doubts about your health (e.g. because you are experiencing considerable pain, a general malaise, shortness of breath, nausea or dizziness) consult your doctor before starting or continuing with Breakletics. Furthmore, please always ensure that you warm up appropriately. Never start a work out without a warm up.\n\n',
      'de':
          'Die Nutzung der HIIT the Beat & BREAKLETICS-Dienste erfolgt auf eigene Gefahr. Voraussetzung für die Nutzung der HIIT the Beat & BREAKLETICS-Dienste ist in jedem Fall, dass Sie sich in einem guten allgemeinen Gesundheitszustand befinden. Wenn Sie Kenntnis von Vorerkrankungen haben, raten wir Ihnen, vor Beginn der Breakletics-Dienste (wie Trainings oder Coachings) dringend ärztlichen Rat einzuholen. Dies gilt insbesondere, wenn Sie Kenntnis von einer oder mehreren der folgenden medizinischen Beschwerden/Erkrankungen/Verfahren haben: (i) Herz-Kreislauf-Erkrankungen, (ii) Lungen- oder Atemwegserkrankungen (einschließlich Asthma), (iii) Wirbelsäulen- und/oder Gelenkprobleme, (iv) neuromuskuläre Erkrankungen, (v) chirurgische Eingriffe, (vi) sonstige gesundheitliche Probleme\n\nBei Breakletics-Diensten im Zusammenhang mit Ernährung sind Sie dafür verantwortlich, zu überprüfen, dass die im Rahmen des Coachings oder Leitfadens empfohlenen Lebensmittel und Nährstoffe keine Zutaten oder Inhaltsstoffe enthalten, gegen die Sie allergisch sind oder die eine Nahrungsmittelunverträglichkeit verursachen können.\n\nFür unsere weiblichen Kunden ist es wichtig zu erwähnen, dass unsere Pläne nicht von schwangeren oder stillenden Müttern verwendet werden sollten. \n\nEs gelten folgende allgemeine Regeln: Hören Sie auf das, was Ihnen Ihr Körper sagt. Wenn Sie vor der ersten Nutzung der Breakletics-Dienste oder während der Nutzung von Breakletics Zweifel an Ihrem Gesundheitszustand haben (z. B. weil Sie erhebliche Schmerzen, allgemeines Unwohlsein, Kurzatmigkeit, Übelkeit oder Schwindel verspüren), konsultieren Sie Ihren Arzt, bevor Sie mit Breakletics beginnen oder fortfahren. Achten Sie außerdem immer darauf, dass Sie sich angemessen aufwärmen. Beginnen Sie ein Training nie ohne Aufwärmen.\n\n',
      'ja':
          'HIIT the Beat & BREAKLETICSサービスのご利用は、お客様ご自身の責任において行っていただきます。HIIT the Beat & BREAKLETICSサービスをご利用いただくには、いかなる場合でも、お客様の健康状態が良好であることが条件となります。既往症をお持ちの方は、Breakleticsサービス（トレーニングやコーチングなど）を開始する前に、速やかに医師の診察を受けることをお勧めします。特に、以下の疾患／症状／処置のいずれか、または複数の既往症／症状／処置をお持ちの方は、特にご注意ください。(i) 心血管疾患、(ii) 肺疾患または呼吸器疾患（喘息を含む）、(iii) 脊椎または関節疾患、(iv) 神経筋疾患、(v) 外科手術、(vi) その他の健康問題\n\n栄養に関するBreakleticsサービスの場合、コーチングまたはガイドで推奨される食品および栄養素に、アレルギーのある、または食物不耐症を引き起こす可能性のある成分または内容物が含まれていないことを確認するのは、お客様の責任となります。\n\n女性のお客様には、妊娠中または授乳中のお客様は当社のプランをご利用いただけないことをお知らせいたします。\n\n以下の一般的なルールが適用されます：体の声に耳を傾けてください。Breakleticsサービスを初めてご利用になる前、またはBreakleticsをご利用中に、健康状態に不安がある場合（例：強い痛み、全身倦怠感、息切れ、吐き気、めまいなど）は、Breakleticsの使用開始または継続前に医師にご相談ください。また、必ず適切なウォームアップを行ってください。ウォームアップなしでワークアウトを開始しないでください。\n\n',
    },
    'sm1sodu1': {
      'en': '3.2. No substitute for medical advice\n\n',
      'de': '3.2. Kein Ersatz für ärztlichen Rat\n\n',
      'ja': '3.2. 医師のアドバイスに代わるものではない\n\n',
    },
    'ffp0wtwt': {
      'en':
          'The services and information offered by Breakletics and the Breakletics Services do not constitute medical advice or a doctor’s advice. Nor are they a substitute for a medical examination or treatment by a doctor.\n\n',
      'de':
          'Die von Breakletics und den Breakletics-Diensten angebotenen Dienste und Informationen stellen keine medizinische Beratung oder ärztliche Beratung dar. Sie sind auch kein Ersatz für eine medizinische Untersuchung oder Behandlung durch einen Arzt.\n\n',
      'ja':
          'BreakleticsおよびBreakleticsサービスが提供するサービスおよび情報は、医学的アドバイスまたは医師のアドバイスを構成するものではありません。また、医師による診察や治療に代わるものでもありません。\n\n',
    },
    '6eo5h3nf': {
      'en': '3.3. Training-/Dietary Methods\n\n',
      'de': '3.3. Trainings-/Ernährungsmethoden\n\n',
      'ja': '3.3. トレーニング/食事療法\n\n',
    },
    'xpfrkxye': {
      'en':
          'Fitness and/or nutritional advice is subject to constantly evolving knowledge in relation to health science, nutritional science and sports science. Although we base our trainings and nutritional tips on current studies and knowledge, we do not guarantee that these reflect the most up to date research findings or knowledge.\n\n',
      'de':
          'Fitness- und/oder Ernährungsberatungen unterliegen den sich ständig weiterentwickelnden Erkenntnissen der Gesundheitswissenschaften, Ernährungswissenschaften und Sportwissenschaften. Obwohl wir unsere Trainings und Ernährungstipps auf aktuelle Studien und Erkenntnisse stützen, übernehmen wir keine Garantie dafür, dass diese den aktuellsten Forschungsergebnissen und Erkenntnissen entsprechen.\n\n',
      'ja':
          'フィットネスおよび／または栄養に関するアドバイスは、健康科学、栄養科学、スポーツ科学に関する知識が常に進化する中で提供されます。当社のトレーニングや栄養に関するアドバイスは最新の研究結果や知識に基づいていますが、最新の研究結果や知識を反映していることを保証するものではありません。\n\n',
    },
    'yu6zti7y': {
      'en':
          '4. Breakletics Services and Prices\n\n4.1. Services free of charge or for a fee\n\n',
      'de':
          '4. Breakletics-Dienste und Preise\n\n4.1. Kostenlose oder kostenpflichtige Dienste\n\n',
      'ja': '4. Breakleticsのサービスと料金\n\n4.1. 無料または有料のサービス\n\n',
    },
    '5lvxbu85': {
      'en':
          'The scope of the services included in Breakletics and the HIIT the Beat & BREAKLETICS Services and available for use by you depends on the type of HIIT the Beat & BREAKLETICS Service and whether you use the Breakletics Services free of charge or for a fee. If you use it free of charge you only have access to certain basic functions and information of the respective Breakletics Service. A more extensive range of functions is available to you if you enable the respective content modules separately in return for a one-off payment or as part of a subscription for the respective Breakletics Service. In case of nutrition coachings, please note that the foods suggested as part of the coaching are not part of the Breakletics Services and need to be purchased by you separately at your own cost.\n\n',
      'de':
          'Der Umfang der in Breakletics und den HIIT the Beat & BREAKLETICS Diensten enthaltenen und von Dir nutzbaren Dienste hängt von der Art des HIIT the Beat & BREAKLETICS Dienstes ab und davon, ob Du die Breakletics Dienste unentgeltlich oder entgeltlich nutzt. Bei der unentgeltlichen Nutzung hast Du lediglich Zugriff auf bestimmte Basisfunktionen und Informationen des jeweiligen Breakletics Dienstes. Ein umfangreicherer Funktionsumfang steht Dir zur Verfügung, wenn Du die jeweiligen Inhaltsmodule separat gegen eine einmalige Zahlung oder im Rahmen eines Abonnements des jeweiligen Breakletics Dienstes freischaltest. Bei Ernährungscoachings beachte bitte, dass die im Rahmen des Coachings vorgeschlagenen Lebensmittel nicht Bestandteil der Breakletics Dienste sind und von Dir separat und auf eigene Kosten erworben werden müssen.\n\n',
      'ja':
          'BreakleticsおよびHIIT the Beat & BREAKLETICSサービスに含まれ、お客様が利用できるサービスの範囲は、HIIT the Beat & BREAKLETICSサービスの種類と、Breakleticsサービスを無料か有料かによって異なります。無料でご利用の場合は、各Breakleticsサービスの特定の基本機能と情報のみにアクセスできます。各コンテンツモジュールを個別に有効にして、一括払いまたは各Breakleticsサービスのサブスクリプションの一部としてお支払いいただくと、より広範な機能をご利用いただけるようになります。栄養指導の場合、指導で提案される食品はBreakleticsサービスの一部ではないため、お客様ご自身の費用で別途ご購入いただく必要があることにご注意ください。\n\n',
    },
    'ty2y8nz5': {
      'en': '4.2. Prices\n\n',
      'de': '4.2. Preise\n\n',
      'ja': '4.2. 価格\n\n',
    },
    '71xw0cav': {
      'en':
          'Please consult the website www.hiit-the-beat.com for information on the respective current pricing and subscription models and the services that these include. All prices stated include the applicable VAT.\n\n',
      'de':
          'Die jeweils aktuellen Preis- und Abomodelle sowie die darin enthaltenen Leistungen findest du auf der Website www.hiit-the-beat.com. Alle angegebenen Preise verstehen sich inklusive der jeweils gültigen Mehrwertsteuer.\n\n',
      'ja':
          'それぞれの現在の価格、サブスクリプションモデル、およびそれらに含まれるサービスについては、ウェブサイト www.hiit-the-beat.com をご覧ください。記載されている価格はすべてVAT込みです。\n\n',
    },
    '9ql8r61n': {
      'en': '5. User Account\n\n5.1. Registration process\n\n',
      'de': '5. Benutzerkonto\n\n5.1. Registrierungsprozess\n\n',
      'ja': '5. ユーザーアカウント\n\n5.1. 登録プロセス\n\n',
    },
    'vsj8gjz8': {
      'en':
          'In order to use the Breakletics Services you must first register and open a user account. The creation of an account can be done directly on our webpage www.breakletics.com. In the frame of this registration, we ask you to accept these terms and conditions and privacy terms. Alternatively you can open a user account by using your Facebook account. The registration process is completed, once you have entered your Facebook account details and clicked the “Confirm” button.\n\n',
      'de':
          'Um die Breakletics-Dienste nutzen zu können, müssen Sie sich zunächst registrieren und ein Benutzerkonto eröffnen. Die Erstellung eines Kontos kann direkt auf unserer Webseite www.breakletics.com erfolgen. Im Rahmen dieser Registrierung bitten wir Sie, diese Allgemeinen Geschäftsbedingungen und Datenschutzbestimmungen zu akzeptieren. Alternativ können Sie ein Benutzerkonto über Ihr Facebook-Konto eröffnen. Der Registrierungsvorgang ist abgeschlossen, sobald Sie Ihre Facebook-Kontodaten eingegeben und auf die Schaltfläche „Bestätigen“ geklickt haben.\n\n',
      'ja':
          'Breakleticsサービスをご利用いただくには、まず登録を行い、ユーザーアカウントを開設する必要があります。アカウントは、当社のウェブサイト（www.breakletics.com）から直接作成できます。登録にあたり、本利用規約およびプライバシーポリシーにご同意いただく必要があります。または、Facebookアカウントを使用してユーザーアカウントを開設することもできます。Facebookアカウントの情報を入力し、「確認」ボタンをクリックすると、登録手続きが完了します。\n\n',
    },
    '4e3d0hbh': {
      'en': '6. Conclusion of a Contract\n\n',
      'de': '6. Vertragsabschluss\n\n',
      'ja': '6. 契約の締結\n\n',
    },
    'h3apvdkq': {
      'en':
          'How the respective contract is formed depends on the method by which you register for Breakletics for the first time and whether you sign up for additional fee-based services.\n\n',
      'de':
          'Wie der jeweilige Vertrag zustande kommt, hängt davon ab, auf welchem Weg Du Dich erstmals für Breakletics anmeldest und ob Du weitere kostenpflichtige Dienste buchst.\n\n',
      'ja':
          'それぞれの契約がどのように成立するかは、Breakletics に初めて登録する方法と、追加の有料サービスに申し込むかどうかによって異なります。\n\n',
    },
    'ki77838z': {
      'en': '6.1. Online registration on the website \n',
      'de': '6.1. Online-Registrierung auf der Website\n',
      'ja': '6.1. ウェブサイトでのオンライン登録\n\n',
    },
    'wzkpsefd': {
      'en': 'www.hiit-the-beat.com\n\n',
      'de': 'www.hiit-the-beat.com\n\n',
      'ja': 'www.hiit-the-beat.com\n\n',
    },
    '31k76pf9': {
      'en':
          'When signing up for our website www.breakletics.com a contract of usage between you and us is concluded after the completion of the registration process.\n\n',
      'de':
          'Bei der Registrierung auf unserer Website www.breakletics.com kommt nach Abschluss des Registrierungsvorgangs ein Nutzungsvertrag zwischen Ihnen und uns zustande.\n\n',
      'ja':
          '当社のウェブサイト www.breakletics.com にサインアップすると、登録プロセスの完了後にお客様と当社の間で使用契約が締結されます。\n\n',
    },
    'ib00fpxh': {
      'en':
          '6.2. Conclusion of a contract for one off additional services for a fee or for subscriptions\n\n',
      'de':
          '6.2. Vertragsabschluss über einmalige entgeltliche Zusatzleistungen oder Abonnements\n\n',
      'ja': '6.2. 有料の追加サービスまたは定期購読サービスに関する契約の締結\n\n',
    },
    'xuqboe95': {
      'en':
          'You can purchase individual additional services either by paying a one-off fee or as part of a subscription. If you purchase the respective additional service via the website www.breakletics.com (payment provider Digistore24), the contract is formed when you click on the field “Buy now”, or a similar field, and successfully enter your payment details.\n\n',
      'de':
          'Du kannst einzelne Zusatzleistungen entweder durch Zahlung einer einmaligen Gebühr oder im Rahmen eines Abonnements erwerben. Wenn Du die jeweilige Zusatzleistung über die Website www.breakletics.com (Zahlungsanbieter Digistore24) kaufst, kommt der Vertrag zustande, wenn Du auf das Feld „Jetzt kaufen“ oder ein ähnliches Feld klickst und Deine Zahlungsdaten erfolgreich eingibst.\n\n',
      'ja':
          '追加サービスは、一括払いまたはサブスクリプションの一部として個別にご購入いただけます。ウェブサイトwww.breakletics.com（決済プロバイダー：Digistore24）を通じて各追加サービスをご購入いただいた場合、「今すぐ購入」または同様のフィールドをクリックし、お支払い情報をご入力いただいた時点で契約が成立いたします。\n\n',
    },
    'ui3zn03n': {
      'en': '6.3. Correction of input errors\n\n',
      'de': '6.3. Berichtigung von Eingabefehlern\n\n',
      'ja': '6.3. 入力エラーの修正\n\n',
    },
    'fv8y3eec': {
      'en':
          'If you would like to purchase a one-off additional service or a subscription on our website www.breakletics.com , you can interrupt the process at any time and correct any errors until you have successfully entered your payment details. We are not going to ask you for any payment information, since you purchase the service from Digistore24. Please contact Digistore24, if you would like to correct potential input errors.\n\n',
      'de':
          'Wenn Sie auf unserer Website www.breakletics.com einen einmaligen Zusatzdienst oder ein Abonnement erwerben möchten, können Sie den Vorgang bis zur erfolgreichen Eingabe Ihrer Zahlungsdaten jederzeit abbrechen und Eingabefehler korrigieren. Wir werden von Ihnen keine Zahlungsdaten abfragen, da Sie den Dienst bei Digistore24 erwerben. Bitte wenden Sie sich an Digistore24, wenn Sie Eingabefehler korrigieren möchten.\n\n',
      'ja':
          '当社のウェブサイト www.breakletics.com で単発の追加サービスまたはサブスクリプションをご購入いただく場合、お支払い情報の入力が完了するまでは、いつでも手続きを中断してエラーを修正することができます。Digistore24 からサービスをご購入いただくため、お支払い情報の入力をお願いすることはありません。入力エラーを修正されたい場合は、Digistore24 までご連絡ください。\n\n',
    },
    'vlmser1l': {
      'en': '7. NEWSLETTER\n\n',
      'de': '7. NEWSLETTER\n\n',
      'ja': '7. ニュースレター\n\n',
    },
    'g5u2r96w': {
      'en':
          'Breakletics sends newsletters to registrated users. By accepting this AGB, the user accepts, that he will be sent the Brealetics Newsletter. With each receipt newsletter, the user has the opportunity to unsubscribe the newsletter. From this point on, the user will not receive the newsletter anymore.\n\n',
      'de':
          'Breakletics versendet an registrierte Nutzer Newsletter. Mit der Annahme dieser AGB erklärt sich der Nutzer mit der Zusendung des Breakletics Newsletters einverstanden. Bei jedem Newsletterempfang hat der Nutzer die Möglichkeit, den Newsletter abzubestellen. Ab diesem Zeitpunkt erhält der Nutzer keinen weiteren Newsletter mehr.\n\n',
      'ja':
          'Breakleticsは登録ユーザーにニュースレターを送信します。本利用規約に同意することにより、ユーザーはBrealeticsニュースレターの受信に同意したことになります。ニュースレターを受信するたびに、ユーザーはニュースレターの購読を解除することができます。解除した時点で、ユーザーはニュースレターを受け取ることができなくなります。\n\n',
    },
    'ps1dtmng': {
      'en': '8. Term of Validity\n\n8.1. User contract\n\n',
      'de': '8. Gültigkeitsdauer\n\n8.1. Nutzungsvertrag\n\n',
      'ja': '8. 有効期間\n\n8.1. ユーザー契約\n\n',
    },
    'jc7z55zd': {
      'en':
          'The user contract concluded between you and us once you register your account is valid for an indefinite period.\n\n',
      'de':
          'Der zwischen Ihnen und uns durch die Registrierung Ihres Accounts geschlossene Nutzungsvertrag gilt auf unbestimmte Zeit.\n\n',
      'ja': 'お客様がアカウントを登録した時点でお客様と当社との間で締結される利用契約は、無期限に有効となります。\n\n',
    },
    '4d3hlx6o': {
      'en': '8.2. One-off additional services\n\n',
      'de': '8.2. Einmalige Zusatzleistungen\n\n',
      'ja': '8.2. 単発の追加サービス\n\n',
    },
    'vui4k6jh': {
      'en':
          'One-off additional services may be offered for a fixed term. They will then end automatically at the end of the term without needing to be cancelled.\n\n',
      'de':
          'Einmalige Zusatzleistungen können für eine festgelegte Laufzeit angeboten werden. Diese enden dann automatisch zum Ende der Laufzeit, ohne dass es einer Kündigung bedarf.\n\n',
      'ja':
          '一度限りの追加サービスは、一定期間提供される場合があります。これらのサービスは、期間終了時に自動的に終了するため、キャンセルの必要はありません。\n\n',
    },
    'kqtq006o': {
      'en': '8.3. Subscriptions\n\n',
      'de': '8.3. Abonnements\n\n',
      'ja': '8.3. サブスクリプション\n\n',
    },
    't3jhk2h2': {
      'en':
          'Our subscriptions are offered with varying minimum terms of validity and are automatically renewed for the same minimum term that has been selected until you or we cancel them.\n\nIn order to avoid any misunderstanding, please note that the term of a subscription is determined by calendar and is independent from your use or extent of your use of the respective Breakletics Service.\n\n',
      'de':
          'Unsere Abonnements werden mit unterschiedlichen Mindestlaufzeiten angeboten und verlängern sich automatisch um die jeweils gewählte Mindestlaufzeit, bis sie von Dir oder uns gekündigt werden. \n\nUm Missverständnissen vorzubeugen, beachte bitte, dass die Laufzeit eines Abonnements kalendermäßig festgelegt ist und unabhängig von Deiner Nutzung bzw. Deinem Nutzungsumfang des jeweiligen Breakletics-Dienstes ist.\n\n',
      'ja':
          '当社のサブスクリプションは、それぞれ異なる最低有効期間で提供されており、お客様または当社がキャンセルするまで、選択された最低有効期間で自動的に更新されます。\n\n誤解を避けるため、サブスクリプションの期間は暦に基づいて決定され、お客様による各Breakleticsサービスのご利用状況やその範囲とは無関係であることをご承知おきください。\n\n',
    },
    '7654ar40': {
      'en': '9. Terms and Conditions of Payment\n\n9.1. Collection of fees\n\n',
      'de': '9. Zahlungsbedingungen \n\n9.1. Erhebung von Gebühren\n\n',
      'ja': '9. 支払条件\n\n9.1. 料金の徴収\n\n',
    },
    'pvseqxy7': {
      'en':
          'Fees are collected when the contract is concluded for purchases of additional services through the payment of a one-off sum. The fee is collected for the relevant minimum term when the contract is concluded for the purchase of a subscription. If the subscription is renewed\n\n',
      'de':
          'Die Entgelte werden bei Vertragsabschluss für den Erwerb zusätzlicher Dienste durch Zahlung eines einmaligen Betrags erhoben. Bei Vertragsabschluss für den Erwerb eines Abonnements wird die Gebühr für die jeweilige Mindestlaufzeit erhoben. Wird das Abonnement verlängert\n\n',
      'ja':
          '追加サービスの購入については、契約締結時に一括払いで手数料を徴収します。サブスクリプションの購入については、契約締結時に該当する最低利用期間分の手数料を徴収します。サブスクリプションが更新される場合は、\n\n',
    },
    'pbbeomk4': {
      'en': '9.2. Payment default\n\n',
      'de': '9.2. Zahlungsverzug\n\n',
      'ja': '9.2. 支払い不履行\n\n',
    },
    '79gjz5t0': {
      'en':
          'We reserve the right to assert further claims for late payments.\n\n',
      'de':
          'Die Geltendmachung weiterer Ansprüche wegen Zahlungsverzuges bleibt vorbehalten.\n\n',
      'ja': '当社は支払い遅延に関してさらなる請求を主張する権利を留保します。\n\n',
    },
    '54h6ly65': {
      'en': '10. Payment Methods\n\n',
      'de': '10. Zahlungsmethoden\n\n',
      'ja': '10. 支払い方法\n\n',
    },
    'afmh446u': {
      'en':
          'An overview over our accepted payment methods can be found on the website: www.digistore24.com \nIf we incur costs and/or expenses because a payment is declined and this is your fault (e.g. because there are insufficient funds in the account or the credit card limit has already been exhausted), then we are entitled to bill you for the actual costs and/or expenses incurred. \nWhere there is a legitimate reason, we reserve the right for each purchase to refrain from offering certain payment methods and to specify alternative payment methods.\n\n',
      'de':
          'Eine Übersicht über unsere akzeptierten Zahlungsarten finden Sie auf der Website: www.digistore24.com \nEntstehen uns Kosten und/oder Aufwendungen, weil eine Zahlung abgelehnt wird und Sie dies zu vertreten haben (z.B. weil Ihr Konto nicht über die erforderliche Deckung verfügt oder das Kreditkartenlimit bereits ausgeschöpft ist), so sind wir berechtigt, Ihnen die tatsächlich entstandenen Kosten und/oder Aufwendungen in Rechnung zu stellen. \nAus berechtigten Gründen behalten wir uns bei jedem Kauf vor, bestimmte Zahlungsarten nicht anzubieten und alternative Zahlungsarten anzugeben.\n\n',
      'ja':
          '当社が受け付けるお支払い方法の概要は、ウェブサイト www.digistore24.com でご覧いただけます。\nお支払いが拒否され、それがお客様の責任（例：口座残高が不足している、クレジットカードの限度額が既に使い切られているなど）によるものである場合、当社は実際に発生した費用を請求する権利を有します。\n正当な理由がある場合、当社は各購入において特定のお支払い方法の提供を控え、代替のお支払い方法を指定する権利を留保します。\n\n',
    },
    'uhh0b1hx': {
      'en': '11. Right to Cancel\n\n11.1. Cancellation policy\n\n',
      'de': '11. Widerrufsrecht\n\n11.1. Widerrufsbelehrung\n\n',
      'ja': '11. キャンセル権\n\n11.1. キャンセルポリシー\n\n',
    },
    '8yugdc9t': {
      'en':
          'If you have entered into a contract for use of Breakletics or purchased a one-off additional service or a subscription, in each case, you are entitled to the following right of withdrawal. You have the right to cancel the contract within 14 days without stating any reasons. The cancellation period runs for 14 days from the conclusion of the contract.\n\nBreakletics GmbH\nMont-Cenis-Straße 6\n44623 Herne\ninfo@hiit-the-beat.com\n\nunequivocal notification (e.g. a letter sent by post, a fax or an email) of your decision to cancel the contract.\n\nIf you use this option, we will send you immediate (e.g. via email) acknowledgement of the receipt of such cancellation. To meet the deadline for cancellation it is sufficient to send us the notification of your wish to exercise your right of cancellation before the cancellation period expires.\n\n',
      'de':
          'Wenn Sie einen Vertrag zur Nutzung von Breakletics abgeschlossen oder einen einmaligen Zusatzdienst oder ein Abonnement erworben haben, steht Ihnen jeweils das folgende Widerrufsrecht zu. Sie haben das Recht, binnen 14 Tagen ohne Angabe von Gründen diesen Vertrag zu widerrufen. Die Widerrufsfrist beträgt 14 Tage ab Vertragsschluss.\n\nBreakletics GmbH \nMont-Cenis-Straße 6 \n44623 Herne \ninfo@hiit-the-beat.com\n\nmittels einer eindeutigen Erklärung (z.B. ein mit der Post versandter Brief, Telefax oder E-Mail) über Ihren Entschluss, diesen Vertrag zu widerrufen, informieren.\n\nMachen Sie von dieser Möglichkeit Gebrauch, so werden wir Ihnen unverzüglich (z.B. per E-Mail) eine Bestätigung über den Eingang eines solchen Widerrufs übermitteln. Zur Wahrung der Widerrufsfrist reicht es aus, dass Sie die Mitteilung über die Ausübung des Widerrufsrechts vor Ablauf der Widerrufsfrist absenden.\n\n',
      'ja':
          'Breakletics の利用契約を締結された場合、または単発の追加サービスもしくはサブスクリプションをご購入された場合、いずれの場合も、以下の撤回権を有します。お客様は、理由を問わず14日以内に契約を解除する権利を有します。解除期間は契約締結日から14日間です。\n\nBreakletics GmbH\nMont-Cenis-Straße 6\n44623 Herne\ninfo@hiit-the-beat.com\n\n契約解除の意思を明確に通知する（例：郵送、ファックス、または電子メールによる書面）こと。\n\nこのオプションをご利用の場合、当社は直ちに（例：電子メール）解除の受領確認をお送りします。解除期限に間に合うようにするには、解除期間満了前に解除権を行使する旨を当社に通知していただければ十分です。\n\n',
    },
    'omzrmpqp': {
      'en': '12. Consequences of cancellation\n\n',
      'de': '12. Folgen des Widerrufs\n\n',
      'ja': '12. キャンセルの結果\n\n',
    },
    '3vz7vd1y': {
      'en':
          'If you cancel the contract we are obliged to refund all the payments that we have received from you, including the delivery costs (except for any additional costs incurred as a result of your choosing a different delivery method to the least expensive standard delivery method that we offer), promptly and at the latest within 14 days from the day on which we received the notification of your cancellation of the contract. For this refund we will use the same payment method that you used for the original transaction unless a different arrangement has been expressly agreed with you; under no circumstances will you be charged any fees in respect of this refund. If you asked for the services to start during the cancellation period you must pay us an appropriate amount, equal to the proportion of the services that have already been provided by the time you inform us that you are exercising your right to cancel this contract compared to the full scope of the services covered by the contract.\n\n',
      'de':
          'Wenn Sie diesen Vertrag widerrufen, haben wir Ihnen alle Zahlungen, die wir von Ihnen erhalten haben, einschließlich der Lieferkosten (mit Ausnahme der zusätzlichen Kosten, die sich daraus ergeben, dass Sie eine andere Art der Lieferung als die von uns angebotene, günstigste Standardlieferung gewählt haben), unverzüglich und spätestens binnen vierzehn Tagen ab dem Tag zurückzuzahlen, an dem die Mitteilung über Ihren Widerruf dieses Vertrags bei uns eingegangen ist. Für diese Rückzahlung verwenden wir dasselbe Zahlungsmittel, das Sie bei der ursprünglichen Transaktion eingesetzt haben, es sei denn, mit Ihnen wurde ausdrücklich etwas anderes vereinbart; in keinem Fall werden Ihnen wegen dieser Rückzahlung Entgelte berechnet. Haben Sie verlangt, dass die Dienstleistungen während der Widerrufsfrist beginnen sollen, so haben Sie uns einen angemessenen Betrag zu zahlen, der dem Anteil der bis zu dem Zeitpunkt, zu dem Sie uns von der Ausübung des Widerrufsrechts hinsichtlich dieses Vertrags unterrichten, bereits erbrachten Dienstleistungen im Vergleich zum Gesamtumfang der im Vertrag vorgesehenen Dienstleistungen entspricht.\n\n',
      'ja':
          'お客様が契約をキャンセルする場合、当社は、配送料を含め、お客様から受領したすべての支払いを、速やかに、遅くとも契約キャンセルの通知を当社が受領した日から14日以内に返金する義務があります（当社が提供する最も安価な標準配送方法とは異なる配送方法をお客様が選択した結果として発生した追加費用を除く）。この返金には、お客様と明示的に別の取り決めに合意していない限り、元の取引でお客様が使用したのと同じ支払い方法を使用します。いかなる状況においても、この返金に関してお客様に手数料が請求されることはありません。お客様がキャンセル期間中にサービスの開始を依頼した場合、お客様は、契約でカバーされているサービスの全範囲と比較して、お客様がこの契約をキャンセルする権利を行使する旨を当社に通知した時点ですでに提供されていたサービスの割合に相当する適切な金額を当社に支払う必要があります。\n\n',
    },
    'efqeew33': {
      'en': '13. Lapse of the right of cancellation\n\n',
      'de': '13. Erlöschen des Widerrufsrechts\n\n',
      'ja': '13. キャンセル権の消滅\n\n',
    },
    '4owlal2e': {
      'en':
          'In the case of a contract for the provision of services the right of cancellation lapses if we have provided the service in full and only began to perform the service after you gave your express approval and simultaneously confirmed that you were aware that you would lose your right of cancellation if we had completely fulfilled the contract. \nIn the case of a contract for the delivery of digital content that is not stored on a physical data carrier the right of cancellation also lapses if we have begun to perform the contract after you gave your express approval and simultaneously confirmed that you were aware that you would lose your right of cancellation once we had begun to perform the contract.\n\n',
      'de':
          'Das Widerrufsrecht erlischt bei einem Vertrag zur Erbringung von Dienstleistungen, wenn wir die Dienstleistung vollständig erbracht haben und mit der Ausführung der Dienstleistung erst begonnen haben, nachdem Sie dazu Ihre ausdrückliche Zustimmung gegeben und gleichzeitig Ihre Kenntnis davon bestätigt haben, dass Sie Ihr Widerrufsrecht bei vollständiger Vertragserfüllung verlieren. \nBei einem Vertrag über die Lieferung von nicht auf einem körperlichen Datenträger gespeicherten digitalen Inhalten erlischt das Widerrufsrecht auch dann, wenn wir mit der Ausführung des Vertrags begonnen haben, nachdem Sie dazu Ihre ausdrückliche Zustimmung gegeben und gleichzeitig Ihre Kenntnis davon bestätigt haben, dass Sie Ihr Widerrufsrecht mit Beginn der Vertragserfüllung verlieren.\n\n',
      'ja':
          'サービス提供契約の場合、当社がサービスを完全に提供し、お客様が明示的に承認し、かつ当社が契約を完全に履行した場合にはお客様がキャンセル権を失うことをお客様が認識していたことを同時に確認した後にのみサービスの履行を開始した場合、キャンセル権は失効します。\n物理的なデータ媒体に保存されないデジタルコンテンツの配信契約の場合、お客様が明示的に承認し、かつ当社が契約の履行を開始した時点でお客様がキャンセル権を失うことをお客様が認識していたことを同時に確認した後に当社が契約の履行を開始した場合も、キャンセル権は失効します。\n\n',
    },
    'pau37e2r': {
      'en': '14. Liability for Defects\n\n14.1. Statutory Provisions\n\n',
      'de': '14. Mängelhaftung\n\n14.1. Gesetzliche Bestimmungen\n\n',
      'ja': '14. 瑕疵担保責任\n\n14.1. 法定規定\n\n',
    },
    'vhehyub0': {
      'en':
          'Statutory provisions apply to claims due to defective services. Your consumer rights remain unaffected in any case.\n\n',
      'de':
          'Für Ansprüche wegen mangelhafter Leistungen gelten die gesetzlichen Vorschriften. Ihre Rechte als Verbraucher bleiben in jedem Fall unberührt.\n\n',
      'ja': '欠陥のあるサービスに起因するクレームには法定規定が適用されます。いかなる場合でも、お客様の消費者権利は影響を受けません。\n\n',
    },
    'k7tnva2g': {
      'en': '14.2. Disclaimer of guarantees\n\n',
      'de': '14.2. Gewährleistungsausschluss\n\n',
      'ja': '14.2. 保証の否認\n\n',
    },
    'z9zkzf9b': {
      'en':
          'We do not make any representations or guarantees that the use of the Breakletics Services will bring the training- or other result intended by you. We do not promise a concrete success. Also, the actual training result will depend on factors which cannot be influenced, such as, for example, physical disposition and preconditions. Consequently, results may vary strongly between individuals despite the same use of the Breakletics Services\n\n',
      'de':
          'Wir geben keine Zusicherungen oder Garantien dafür ab, dass die Nutzung der Breakletics-Dienste das von Dir beabsichtigte Trainings- oder sonstige Ergebnis bringt. Wir versprechen keinen konkreten Erfolg. Auch hängt das tatsächliche Trainingsergebnis von Faktoren ab, die nicht beeinflusst werden können, wie beispielsweise von körperlichen Voraussetzungen und Veranlagungen. Daher können die Ergebnisse trotz gleicher Nutzung der Breakletics-Dienste von Person zu Person stark variieren.\n\n',
      'ja':
          'Breakleticsサービスのご利用が、お客様が意図するトレーニングまたはその他の成果をもたらすことを、当社はいかなる表明または保証もいたしません。具体的な成果をお約束するものではございません。また、実際のトレーニング結果は、例えば身体的特徴や前提条件など、影響を及ぼさない要因に左右されます。そのため、Breakleticsサービスを同じ方法でご利用いただいた場合でも、結果は個人によって大きく異なる場合があります。\n\n',
    },
    'l3qqsfcx': {
      'en': '15. Liability\n\n15.1. General\n\n',
      'de': '15. Haftung\n\n15.1. Allgemeines\n\n',
      'ja': '15. 責任\n\n15.1. 一般事項\n\n',
    },
    '8qknkohw': {
      'en':
          'Concerning our Breakletics services, we are going to give you certain instructions like e.g. the right warm up and instructions for specific exercises and trainings. These instructions are to be followed by you closely. Otherwise you might have to face the risk of injuries and/or health risks.\n\nYou are required to respect our health annotations in Nr.3. Even if you are using our services frequently, you should never ignore the safety advice. \n\n',
      'de':
          'Im Rahmen unserer Breakletics-Leistungen erhalten Sie von uns bestimmte Hinweise, wie z. B. das richtige Aufwärmen und Anweisungen für bestimmte Übungen und Trainings. Diese Anweisungen sind von Ihnen genau zu befolgen. Andernfalls besteht die Gefahr von Verletzungen und/oder gesundheitlichen Risiken.\n\nSie sind verpflichtet, unsere Gesundheitshinweise in Nr. 3 zu beachten. Auch wenn Sie unsere Leistungen häufig nutzen, sollten Sie die Sicherheitshinweise niemals ignorieren.\n\n',
      'ja':
          'Breakleticsサービスに関して、適切なウォームアップや特定のエクササイズ・トレーニングの実施方法など、具体的な指示をさせていただきます。これらの指示は必ずお守りください。従わない場合、怪我や健康リスクにつながる可能性があります。\n\n3. 健康に関する注意事項を必ずお守りください。サービスを頻繁にご利用いただいている場合でも、安全に関するアドバイスを決して無視しないでください。\n\n',
    },
    'oq7tsaam': {
      'en': '15.2. Liability for services provided free of charge\n\n',
      'de': '15.2. Haftung für unentgeltlich erbrachte Leistungen\n\n',
      'ja': '15.2. 無料で提供されるサービスに対する責任\n\n',
    },
    'mz0bocvt': {
      'en':
          'For services provided free of charge, we will be liable, regardless of the legal basis, exclusively for damage due to wilful conduct or gross negligence or the absence of a guaranteed feature. Our liability is not limited for wilful misconduct. In the event of gross negligence or the absence of a guaranteed feature our liability is limited to reasonable, foreseeable damage. Otherwise, our liability is excluded.\n\n',
      'de':
          'Bei unentgeltlich erbrachten Leistungen haften wir, gleich aus welchem Rechtsgrund, ausschließlich für Schäden, die auf Vorsatz oder grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft beruhen. Unsere Haftung ist bei Vorsatz nicht beschränkt. Bei grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft ist unsere Haftung auf den vernünftigerweise vorhersehbaren Schaden begrenzt. Im Übrigen ist unsere Haftung ausgeschlossen.\n\n',
      'ja':
          '無料で提供されるサービスについては、法的根拠に関わらず、当社は故意または重過失、あるいは保証された機能の欠如に起因する損害に対してのみ責任を負います。当社の責任は故意の不法行為に限定されません。重過失または保証された機能の欠如の場合、当社の責任は合理的かつ予見可能な損害に限定されます。それ以外の場合、当社の責任は免除されます。\n\n',
    },
    'oe3trzns': {
      'en': '15.3. Liability for services provided for a fee\n\n',
      'de': '15.3. Haftung für entgeltliche Leistungen\n\n',
      'ja': '15.3. 有料サービスに対する責任\n\n',
    },
    'rku3rm5m': {
      'en':
          'In the case of services provided for a fee we have, regardless of the legal basis, unlimited liability in principle for damage due to wilful conduct or gross negligence or the absence of a guaranteed feature.\nIf we breach a material contractual obligation as a result of slight negligence, our liability is limited to reasonable, foreseeable damage. A material contractual obligation is any obligation that is necessary to fulfil the purpose of the contract, and on the fulfilment of which you as the consumer can rely or ought to be able to rely.\n\nOur liability in the event of any injury to life, limb or health that is our fault remains unaffected by the above-mentioned limitations.\n\nOtherwise, our liability is excluded.\n\n',
      'de':
          'Bei entgeltlichen Leistungen haften wir, gleich aus welchem Rechtsgrund, grundsätzlich unbeschränkt für Schäden, die auf Vorsatz oder grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft beruhen. \nVerletzen wir durch leichte Fahrlässigkeit eine wesentliche Vertragspflicht, ist unsere Haftung auf den vernünftigerweise vorhersehbaren Schaden begrenzt. Eine wesentliche Vertragspflicht ist jede Verpflichtung, die zur Erreichung des Vertragszwecks notwendig ist und auf deren Erfüllung Sie als Verbraucher vertrauen dürfen oder sollten. \n\nUnsere Haftung im Falle einer von uns zu vertretenden Verletzung von Leben, Körper und Gesundheit bleibt von den vorstehenden Beschränkungen unberührt. \n\nIm Übrigen ist unsere Haftung ausgeschlossen.\n\n',
      'ja':
          '有料サービスの場合、当社は、法的根拠に関わらず、故意または重大な過失、あるいは保証規定の欠如に起因する損害について、原則として無制限の責任を負います。\n当社が軽微な過失により重要な契約上の義務に違反した場合、当社の責任は合理的かつ予見可能な損害に限定されます。重要な契約上の義務とは、契約の目的を遂行するために必要な義務であり、消費者であるお客様がその履行を信頼できる、または信頼できるはずの義務をいいます。\n\n当社の過失により生命、身体または健康に損害が発生した場合の当社の責任は、上記の責任制限の影響を受けません。\n\nそれ以外の場合、当社の責任は免除されます。\n\n',
    },
    'p6lin2o2': {
      'en': '15.4. Liability of our employees\n\n',
      'de': '15.4. Haftung unserer Mitarbeiter\n\n',
      'ja': '15.4. 当社従業員の責任\n\n',
    },
    'miw7k3t8': {
      'en':
          'To the extent that our liability is excluded or limited, this exclusion or limitation also applies to our employees and agents.\n\n',
      'de':
          'Soweit unsere Haftung ausgeschlossen oder beschränkt ist, gilt dieser Ausschluss oder diese Beschränkung auch für unsere Mitarbeiter und Erfüllungsgehilfen.\n\n',
      'ja': '当社の責任が除外または制限される範囲において、この除外または制限は当社の従業員および代理人にも適用されます。\n\n',
    },
    'js9juuko': {
      'en': '15.5. Product liability\n\n',
      'de': '15.5. Produkthaftung\n\n',
      'ja': '15.5. 製造物責任\n\n',
    },
    'asv0jmxc': {
      'en':
          'Claims under the German Product Liability Act remain unaffected by the above-mentioned liability exclusions or limitations.\n\n',
      'de':
          'Ansprüche nach dem Produkthaftungsgesetz bleiben von den vorstehenden Haftungsausschlüssen oder -beschränkungen unberührt.\n\n',
      'ja': 'ドイツ製造物責任法に基づく請求は、上記の責任の除外または制限によって影響を受けません。\n\n',
    },
    '6yrlztok': {
      'en': '16. Rights of Use over Breakletics Content\n\n',
      'de': '16. Nutzungsrechte an Breakletics-Inhalten\n\n',
      'ja': '16. Breakleticsコンテンツの使用権\n\n',
    },
    'n7y81m8j': {
      'en':
          'The services offered by us are dependent on the unlocked contents. We grant you the single and non-transferrable right to use the contents in a non-commercial way within the frame of the contractual conditions. We inform you about the fact, that especially making content available to the public through e.g. webpages outside of Breakletics, is not permitted. The right of usage is eliminated once you are not granted access to the according service anymore (e.g. after cancellation of you subscription) or with the cancellation of the using conditions.\n\n',
      'de':
          'Die von uns angebotenen Dienste sind von den freigeschalteten Inhalten abhängig. Wir räumen Dir das einfache und nicht übertragbare Recht ein, die Inhalte im Rahmen der vertraglichen Bedingungen nicht kommerziell zu nutzen. Wir weisen Dich darauf hin, dass insbesondere die öffentliche Zugänglichmachung der Inhalte, z.B. über Webseiten außerhalb von Breakletics, nicht gestattet ist. Das Nutzungsrecht erlischt, wenn Dir der Zugriff auf den jeweiligen Dienst entzogen wird (z.B. nach Kündigung Deines Abonnements) oder mit Kündigung der Nutzungsbedingungen.\n\n',
      'ja':
          '当社が提供するサービスは、ロック解除されたコンテンツに依存しています。当社は、契約条件の範囲内で、非営利目的においてコンテンツを利用するための、単一かつ譲渡不能な権利をお客様に付与します。特に、Breakletics以外のウェブページなどを通じてコン​​テンツを一般に公開することは許可されていないことをお知らせします。お客様が当該サービスへのアクセスを失効した場合（例：サブスクリプションの解約）、または利用条件が解除された場合、利用権は消滅します。\n\n',
    },
    'yrbx3mvu': {
      'en':
          '17. Responsibility for User-Generated Content\n\n17.1. Disclaimer of responsibility for third party content\n\n',
      'de':
          '17. Verantwortung für nutzergenerierte Inhalte\n\n17.1. Haftungsausschluss für Inhalte Dritter\n\n',
      'ja': '17. ユーザー生成コンテンツに対する責任\n\n17.1. 第三者コンテンツに対する免責\n\n',
    },
    'ib8sasz3': {
      'en':
          'You are solely responsible for content that you post within the Breakletics Services. We accept no responsibility for this content, nor do we monitor it. (We retain the right to make use of relevant content for our social channel).\n\n',
      'de':
          'Für Inhalte, die Sie innerhalb der Breakletics-Dienste posten, sind ausschließlich Sie verantwortlich. Wir übernehmen für diese Inhalte keine Verantwortung und überwachen sie auch nicht. (Wir behalten uns das Recht vor, relevante Inhalte für unseren sozialen Kanal zu verwenden.)\n\n',
      'ja':
          'Breakleticsサービスに投稿するコンテンツについては、お客様が単独で責任を負うものとします。当社は、これらのコンテンツについて一切の責任を負わず、また監視も行いません。（当社は、関連するコンテンツを当社のソーシャルチャンネルで使用する権利を留保します。）\n\n',
    },
    'ydoz9ho7': {
      'en': '17.2. ompliance with statutory provisions\n\n',
      'de': '17.2. Einhaltung gesetzlicher Bestimmungen\n\n',
      'ja': '17.2. 法定規定の遵守\n\n',
    },
    'l0303fky': {
      'en':
          'When supplying your own content you are obliged to comply with all the applicable laws and other legislation of the Federal Republic of Germany. Regardless of whether or not it constitutes a criminal offence, it is prohibited to supply content of a pornographic, sexual, violent, racist, seditious, discriminatory, offensive and/or defamatory nature.\nIn addition you are also obliged to refrain from infringing any third-party rights. This applies in particular to personality rights of third parties as well as to third-party intellectual property rights (such as, for example, copyrights and trademark rights). In particular you must also hold the necessary rights over your profile picture or any other picture you post.\nWe are entitled to delete or remove any content that is unlawful or that infringes the abovementioned principles at any time. If you infringe the above-mentioned principles we are entitled to give you a warning or to temporarily block your user account or to cancel the user contract for good cause in accordance with clause 15.3.\n\n',
      'de':
          'Bei der Bereitstellung eigener Inhalte sind Sie verpflichtet, sämtliche geltenden Gesetze und sonstigen Vorschriften der Bundesrepublik Deutschland einzuhalten. Unabhängig davon, ob es sich um eine Straftat handelt oder nicht, ist die Bereitstellung von Inhalten pornografischer, sexueller, gewalttätiger, rassistischer, volksverhetzender, diskriminierender, beleidigender und/oder diffamierender Natur untersagt. \nDarüber hinaus sind Sie verpflichtet, keine Rechte Dritter zu verletzen. Dies gilt insbesondere für Persönlichkeitsrechte Dritter sowie für Rechte am geistigen Eigentum Dritter (wie beispielsweise Urheber- und Markenrechte). Insbesondere müssen Sie auch über die erforderlichen Rechte an Ihrem Profilbild oder anderen Bildern verfügen, die Sie veröffentlichen. \nWir sind berechtigt, Inhalte, die rechtswidrig sind oder gegen die vorgenannten Grundsätze verstoßen, jederzeit zu löschen oder zu entfernen. Bei einem Verstoß gegen die vorgenannten Grundsätze sind wir berechtigt, Sie abzumahnen oder Ihr Benutzerkonto vorübergehend zu sperren oder den Nutzungsvertrag aus wichtigem Grund gemäß Ziffer 15.3 zu kündigen.\n\n',
      'ja':
          'ご自身のコンテンツを提供する際には、ドイツ連邦共和国の適用法およびその他の法令を遵守する義務があります。刑事犯罪を構成するか否かに関わらず、ポルノ、性的、暴力的、人種差別的、扇動的、差別的、不快、または中傷的な性質のコンテンツを提供することは禁止されています。\nさらに、第三者の権利を侵害しない義務もあります。これは特に、第三者の人格権および第三者の知的財産権（例えば、著作権や商標権など）に適用されます。特に、プロフィール写真や投稿するその他の写真に関して必要な権利を保有している必要があります。\n当社は、違法なコンテンツまたは上記の原則に違反するコンテンツをいつでも削除または排除する権利を有します。お客様が上記の原則に違反した場合、当社はお客様に警告を発し、お客様のユーザーアカウントを一時的にブロックし、または正当な理由により第15.3条に従ってユーザー契約を解除する権利を有します。\n\n',
    },
    '1pryc2hu': {
      'en': '17.3. Indemnification\n\n',
      'de': '17.3. Schadloshaltung\n\n',
      'ja': '17.3. 補償\n\n',
    },
    'w2ilxml6': {
      'en':
          'If you infringe the principles mentioned in clause 14.2 and that this is your fault (i.e. because you acted either negligently or with intent), you are obliged to indemnify us against any third-party claims arising from such infringement. We reserve the right to assert claims for damages and other claims\n\n',
      'de':
          'Sollten Sie gegen die in Ziffer 14.2 genannten Grundsätze verstoßen und dies ist Ihr Verschulden (also weil Sie entweder fahrlässig oder vorsätzlich gehandelt haben), sind Sie verpflichtet, uns von allen Ansprüchen Dritter freizustellen, die aus einem solchen Verstoß resultieren. Die Geltendmachung von Schadensersatzansprüchen und weiteren Ansprüchen bleibt vorbehalten.\n\n',
      'ja':
          'お客様が第14.2項に定める原則に違反し、それがお客様の過失（つまり、お客様の過失または故意）によるものである場合、お客様は、かかる違反に起因する第三者からのいかなる請求に対しても当社を補償する義務を負います。当社は、損害賠償およびその他の請求を請求する権利を留保します。\n\n',
    },
    '3qvwxb9q': {
      'en': '18. Collected Data\n\n18.1. Nutzungsvertrag\n\n',
      'de': '18. Gesammelte Daten\n\n18.1. Nutzungsvertrag\n\n',
      'ja': '18. 収集されたデータ\n\n18.1.ヌツングスヴェルトラグ\n\n',
    },
    't3xjktet': {
      'en':
          'Breakletics is collecting data of its users through following services: Facebook SDK, Facebook Pixel, Google Analytics Tracking, Digistore24, Drift, Paypal, Stripe, Branch.io, Mailchimp, Vimeo, Youtube. Read more here, Privacy Policy.\n\n',
      'de':
          'Breakletics sammelt Daten seiner Benutzer über folgende Dienste: Facebook SDK, Facebook Pixel, Google Analytics Tracking, Digistore24, Drift, Paypal, Stripe, Branch.io, Mailchimp, Vimeo, Youtube. Lesen Sie hier mehr, Datenschutzrichtlinie.\n\n',
      'ja':
          'Breakleticsは、以下のサービスを通じてユーザーのデータを収集しています：Facebook SDK、Facebook Pixel、Google Analytics Tracking、Digistore24、Drift、Paypal、Stripe、Branch.io、Mailchimp、Vimeo、Youtube。詳しくはプライバシーポリシーをご覧ください。\n\n',
    },
    '35ng7cib': {
      'en': '19. Ending the Contract\n\n19.1. User contract\n\n',
      'de': '19. Beendigung des Vertrages\n\n19.1. Nutzungsvertrag\n\n',
      'ja': '19. 契約の終了\n\n19.1. ユーザー契約\n\n',
    },
    'b3otr8id': {
      'en':
          'You have the right to cancel your user account at any time, without stating any reasons, thereby also ending your user contract. To do this you simply have to select the necessary settings in your profile. Please note that after you have cancelled your user account we will or may delete all the content and training results that you added, and you will no longer have access to content that you already purchased. If at the time of deleting your account you still have a current subscription or have booked an additional service that has not yet expired, any sum that you have already paid will not be refunded, not even on a pro rata basis.\n\nWe are entitled to cancel the user contract without stating any reasons by giving two (2) weeks’ written notice, but no earlier than at the end of the minimum contractual term or at the end of the respective renewal period of your subscription and/or at the end of the term of any additional service for which you have paid a one-off fee.\n\n',
      'de':
          'Du hast jederzeit das Recht, dein Benutzerkonto ohne Angabe von Gründen zu kündigen und damit auch deinen Nutzungsvertrag zu beenden. Hierzu musst du lediglich die erforderlichen Einstellungen in deinem Profil vornehmen. Bitte beachte, dass wir nach der Kündigung deines Benutzerkontos alle von dir eingestellten Inhalte und Trainingsergebnisse löschen bzw. löschen können und du auf bereits erworbene Inhalte keinen Zugriff mehr hast. Solltest du zum Zeitpunkt der Löschung deines Kontos noch ein laufendes Abonnement haben oder einen Zusatzdienst gebucht haben, dessen Laufzeit noch nicht abgelaufen ist, wird dir ein bereits gezahlter Betrag nicht zurückerstattet, auch nicht anteilig. \n\nWir sind berechtigt, den Nutzungsvertrag ohne Angabe von Gründen mit einer Frist von zwei (2) Wochen schriftlich zu kündigen, frühestens jedoch zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums deines Abonnements und/oder zum Ende der Laufzeit eines Zusatzdienstes, für den du eine einmalige Gebühr bezahlt hast.\n\n',
      'ja':
          'お客様は、理由を明示することなくいつでもユーザーアカウントを解約し、これによりユーザー契約を終了する権利を有します。解約するには、プロフィールで必要な設定を選択するだけです。ユーザーアカウントを解約すると、お客様が追加したすべてのコンテンツとトレーニング結果が削除される可能性があり、お客様は既に購入したコンテンツにアクセスできなくなりますのでご注意ください。アカウント削除時に、現在有効なサブスクリプションをご利用の場合、または有効期限が切れていない追加サービスを予約している場合、既にお支払いいただいた金額は、日割り計算であっても返金されません。\n\n当社は、理由を明示することなく、2週間前までに書面による通知を行うことでユーザー契約を解約する権利を有します。ただし、解約は、最低契約期間の終了時、サブスクリプションの更新期間の終了時、および／またはお客様が一括払い料金を支払った追加サービスの期間終了時よりも早い時点までとします。\n\n',
    },
    '2pdsce4w': {
      'en': '19.2. Subscription\n\n',
      'de': '19.2. Abonnement\n\n',
      'ja': '19.2. サブスクリプション\n\n',
    },
    'goiheqn1': {
      'en':
          'Every subscription for a Breakletics Service must be cancelled individually. You can cancel the respective subscription without stating any reasons at any time effective at the end of the minimum contractual term or at the end of the respective renewal period. You can cancel any subscriptions purchased via our website www.breakletics.com by selecting the appropriate setting in your user profile. Alternatively, you may also cancel your subscription by email, sent to the address infos@breakletics.com, or by post. Subscriptions purchased via in-app purchase must be cancelled using the settings in the respective app store. If your subscription fee is collected via iTunes, contrary to the provisions above a notice period of 24 hours before the end of the minimum contractual term or before the end of the respective renewal period applies for technical reasons. Your user account and any other subscriptions will continue to exist after you have cancelled your subscription.\n\nWe are entitled to cancel your subscription with effect from the end of the minimum contractual term or with effect from the end of the respective renewal period by giving two (2) weeks’ written notice\n\n',
      'de':
          'Jedes Abonnement eines Breakletics-Dienstes muss einzeln gekündigt werden. Sie können das jeweilige Abonnement ohne Angabe von Gründen jederzeit zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums kündigen. Abonnements, die Sie über unsere Website www.breakletics.com erworben haben, können Sie kündigen, indem Sie die entsprechende Einstellung in Ihrem Benutzerprofil auswählen. Alternativ können Sie Ihr Abonnement auch per E-Mail an die Adresse infos@breakletics.com oder per Post kündigen. Abonnements, die über In-App-Käufe erworben wurden, müssen über die Einstellungen im jeweiligen App Store gekündigt werden. Wird Ihr Abonnementsbeitrag über iTunes eingezogen, gilt abweichend von den vorstehenden Bestimmungen aus technischen Gründen eine Kündigungsfrist von 24 Stunden vor Ende der Mindestvertragslaufzeit oder vor Ende des jeweiligen Verlängerungszeitraums. Ihr Benutzerkonto und etwaige weitere Abonnements bleiben auch nach der Kündigung Ihres Abonnements bestehen. \n\nWir sind berechtigt, Ihr Abonnement zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums mit einer Frist von zwei (2) Wochen schriftlich zu kündigen.\n\n',
      'ja':
          'Breakleticsサービスの各サブスクリプションは個別に解約する必要があります。お客様は、それぞれのサブスクリプションを、理由を問わずいつでも解約することができ、その有効期間は最低契約期間の終了時またはそれぞれの更新期間の終了時となります。当社のウェブサイト（www.breakletics.com）で購入されたサブスクリプションは、ユーザープロフィールで適切な設定を選択することで解約できます。または、infos@breakletics.com宛てにメールを送信するか、郵送で解約することもできます。アプリ内購入で購入されたサブスクリプションは、それぞれのアプリストアの設定を使用して解約する必要があります。上記の規定に反して、iTunes経由でサブスクリプション料金を徴収される場合、技術的な理由により、最低契約期間の終了時またはそれぞれの更新期間の終了時の24時間前までに通知する必要があります。お客様のユーザーアカウントおよびその他のサブスクリプションは、サブスクリプションを解約した後も引き続き存在します。\n\n当社は、2週間前に書面で通知することにより、最低契約期間の終了時またはそれぞれの更新期間の終了時に、お客様のサブスクリプションを解約する権利を有します。\n\n',
    },
    'p6kg6dti': {
      'en': '19.3. Cancellation for good cause\n\n',
      'de': '19.3. Kündigung aus wichtigem Grund\n\n',
      'ja': '19.3. 正当な理由によるキャンセル\n\n',
    },
    'g4n94g96': {
      'en':
          'The right to cancel for good cause remains unaffected in the case of either party. In particular we are entitled to cancel your user contract or your subscription with immediate effect, and to cancel your user account, if you seriously or repeatedly breach the provisions of the user contract and/or these General Terms and Conditions of Business, or if you are in arrears with your payment obligations.\n\n',
      'de':
          'Das Recht zur Kündigung aus wichtigem Grund bleibt bei beiden Parteien unberührt. Wir sind insbesondere berechtigt, Ihren Nutzungsvertrag bzw. Ihr Abonnement mit sofortiger Wirkung zu kündigen sowie Ihr Benutzerkonto zu löschen, wenn Sie erheblich oder wiederholt gegen die Bestimmungen des Nutzungsvertrages und/oder dieser Allgemeinen Geschäftsbedingungen verstoßen oder mit Ihren Zahlungsverpflichtungen in Verzug sind.\n\n',
      'ja':
          '正当な理由による解約権は、いずれの当事者にも影響を及ぼしません。特に、お客様がユーザー契約および／または本利用規約の規定に重大または繰り返し違反した場合、または支払い義務を滞納した場合、当社はお客様のユーザー契約またはサブスクリプションを即時解約し、お客様のユーザーアカウントをキャンセルする権利を有します。\n\n',
    },
    'jpyzqqj2': {
      'en':
          '20. Changes to the General Terms and Conditions of Business\n\n20.1 General \n\n',
      'de':
          '20. Änderungen der Allgemeinen Geschäftsbedingungen\n\n20.1 Allgemeines\n\n',
      'ja': '20. 一般取引条件の変更\n\n20.1 一般事項\n\n',
    },
    'gk9r2bya': {
      'en':
          'Breakletics retains the right to change these terms and conditions once in a while, in order to e.g. match legal requirements, become economically functional or to meet users interests and expectations. The terms and conditions document in their valid state can be found on the breakletics.com platform and in the apps.\n\n',
      'de':
          'Breakletics behält sich das Recht vor, diese Allgemeinen Geschäftsbedingungen von Zeit zu Zeit zu ändern, um sie beispielsweise rechtlichen Anforderungen anzupassen, wirtschaftlich sinnvoller zu gestalten oder den Interessen und Erwartungen der Nutzer gerecht zu werden. Die Allgemeinen Geschäftsbedingungen in ihrer jeweils aktuellen Fassung sind auf der Plattform breakletics.com und in den Apps abrufbar.\n\n',
      'ja':
          'Breakletics は、法的要件への適合、経済的な機能の確保、ユーザーの関心と期待への対応などを目的として、本利用規約を随時変更する権利を留保します。有効な利用規約は、breakletics.com プラットフォームおよびアプリでご確認いただけます。\n\n',
    },
    'r783xvd9': {
      'en': '20.1 General \n\n20.2\n\n',
      'de': '20.1 Allgemeines \n\n20.2\n\n',
      'ja': '20.1 一般事項\n\n20.2\n\n',
    },
    '3q14b4ur': {
      'en':
          'Changes of these terms and conditions require the approval of the registered user, with the exemption of the paragraph object of contract. If Breakletics wants to execute a change to the terms and conditions, they are going to inform the user as soon as possible. A likewise notification will happen on the relevant page of the breakletics.com webpage, or on every device that uses the services of Breakletics.\n\n',
      'de':
          'Änderungen dieser Allgemeinen Geschäftsbedingungen bedürfen der Zustimmung des registrierten Nutzers, mit Ausnahme des Paragraphen Vertragsgegenstand. Wenn Breakletics eine Änderung der Allgemeinen Geschäftsbedingungen vornehmen möchte, wird Breakletics den Nutzer hierüber so schnell wie möglich informieren. Eine entsprechende Benachrichtigung erfolgt auf der entsprechenden Seite der Webseite breakletics.com oder auf jedem Gerät, das die Dienste von Breakletics nutzt.\n\n',
      'ja':
          '本利用規約の変更は、契約の目的に関する条項を除き、登録ユーザーの承認が必要です。Breakleticsが本利用規約を変更する場合、可能な限り速やかにユーザーに通知します。同様の通知は、breakletics.comの該当ページ、またはBreakleticsのサービスを利用するすべてのデバイスに表示されます。\n\n',
    },
    'o17m6v2f': {
      'en': '20.3\n\n',
      'de': '20.3\n\n',
      'ja': '20.3\n\n',
    },
    '2bm71bko': {
      'en':
          'If the user does not agree with the terms and conditions, he will not be able to use the products of Breakletics anymore.\n\n',
      'de':
          'Wenn der Nutzer mit den Allgemeinen Geschäftsbedingungen nicht einverstanden ist, kann er die Produkte von Breakletics nicht mehr nutzen.\n\n',
      'ja': 'ユーザーが利用規約に同意しない場合、Breakletics の製品を使用できなくなります。\n\n',
    },
    'hsr3g415': {
      'en': '20.4\n\n',
      'de': '20.4\n\n',
      'ja': '20.4\n\n',
    },
    '3tqep5va': {
      'en':
          'Information on the provider\nBreakletics GmbH \nMont-Cenis-Str. 6\n44623 Herne\ninfo@hiit-the-beat.com\nCEO: Peter Sowinski\nCommercial register number at Amtsgericht Bochum: HRB 21945\nVAT–ID: DE307273612\n\n',
      'de':
          'Informationen zum Anbieter\nBreakletics GmbH \nMont-Cenis-Str. 6\n44623 Herne\ninfo@hiit-the-beat.com\nGeschäftsführer: Peter Sowinski\nHandelsregisternummer beim Amtsgericht Bochum: HRB 21945\nUmsatzsteuer-Identifikationsnummer: DE307273612\n\n',
      'ja':
          'プロバイダーに関する情報\nブレイクレティクス社\nモン・スニ通り6\n44623 ヘルネ\ninfo@hiit-the-beat.com\nCEO: ピーター・ソウィンスキー\nアムツゲリヒト・ボーフムの商業登録番号: HRB 21945\nVAT-ID: DE307273612\n\n',
    },
    'cu5i3e23': {
      'en': '21. Final Provision\n\n21.1. Applicable law\n\n',
      'de': '21. Schlussbestimmungen\n\n21.1. Geltendes Recht\n\n',
      'ja': '21. 最終規定\n\n21.1. 準拠法\n\n',
    },
    'r3ojk3jv': {
      'en':
          'Between the two parties, only German law and the excemption of the CISG UN right is applicable. Doing business with consumers within the European Union can use the current place of living of the consumer as an orientation and is only applicable if it concerns the necessary to-be-applied conditions of the consumer law.\n\n',
      'de':
          'Zwischen den Vertragspartnern gilt ausschließlich deutsches Recht unter Ausschluss des CISG-UN-Kaufrechts. Bei Geschäften mit Verbrauchern innerhalb der Europäischen Union kann der aktuelle Wohnsitz des Verbrauchers als Orientierung dienen und gilt nur dann, wenn es sich um zwingend anzuwendende Bestimmungen des Verbraucherrechts handelt.\n\n',
      'ja':
          '両当事者間では、ドイツ法およびCISGの国連権利の例外規定のみが適用されます。欧州連合（EU）域内で消費者と取引を行う場合、消費者の現在の居住地を基準とすることができますが、これは消費者法の適用要件を満たす場合にのみ適用されます。\n\n',
    },
    'wrhi807g': {
      'en': '21.2. Place of jurisdiction\n\n',
      'de': '21.2. Gerichtsstand\n\n',
      'ja': '21.2. 管轄地\n\n',
    },
    'zy6371ym': {
      'en':
          'If you do not have a place of general jurisdiction in Germany or in another EU Member State, or if you have moved your permanent place of residence to a country outside the EU after these General Terms and Conditions of Business have entered into effect, or if your permanent place of residence or usual place of residence at the time the complaint is filed is not known, then the exclusive place of jurisdiction for all disputes arising from this contract will be our place of business.\n\n',
      'de':
          'Haben Sie keinen allgemeinen Gerichtsstand in Deutschland oder in einem anderen EU-Mitgliedsstaat oder haben Sie nach Wirksamkeit dieser Allgemeinen Geschäftsbedingungen Ihren festen Wohnsitz in ein Land außerhalb der EU verlegt oder ist Ihr Wohnsitz oder gewöhnlicher Aufenthaltsort im Zeitpunkt der Klageerhebung nicht bekannt, ist ausschließlicher Gerichtsstand für alle Streitigkeiten aus diesem Vertrag unser Geschäftssitz.\n\n',
      'ja':
          'お客様がドイツまたは他の EU 加盟国に一般管轄地を持たない場合、または本一般取引条件の発効後にお客様の永住地を EU 域外の国に移転した場合、あるいは苦情が申し立てられた時点でのお客様の永住地または通常の居住地が不明な場合は、本契約から生じるすべての紛争の専属管轄地は当社の事業所となります。\n\n',
    },
    'hgkcb24o': {
      'en': '21.3. Language of the contract\n\n',
      'de': '21.3. Vertragssprache\n\n',
      'ja': '21.3. 契約言語\n\n',
    },
    '5brnidmm': {
      'en': 'The language of the contract is English.\n\n',
      'de': 'Die Vertragssprache ist Englisch.\n\n',
      'ja': '契約書の言語は英語です。\n\n',
    },
    'wqw5peb4': {
      'en': '21.4. Severability clause\n\n',
      'de': '21.4. Salvatorische Klausel\n\n',
      'ja': '21.4. 分離条項\n\n',
    },
    'v7kjdq5s': {
      'en':
          'Should any individual provisions of these General Terms and Conditions of Business be or become invalid in whole or in part, this will not affect the validity of the remaining provisions.',
      'de':
          'Sollten einzelne Bestimmungen dieser Allgemeinen Geschäftsbedingungen ganz oder teilweise unwirksam sein oder werden, so wird hierdurch die Wirksamkeit der übrigen Bestimmungen nicht berührt.',
      'ja': '本一般取引条件の個別の規定の全部または一部が無効となる場合であっても、残りの規定の有効性には影響しません。\n\n',
    },
    'yzpmclom': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // PolicyPage
  {
    'q7l5wmel': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinie',
      'ja': 'プライバシーポリシー',
    },
    'h9xi9ngr': {
      'en': 'PRIVACY POLICY\n\n',
      'de': 'DATENSCHUTZRICHTLINIE\n\n',
      'ja': 'プライバシーポリシー\n\n',
    },
    'yygsl7cs': {
      'en':
          'Last updated: November 2024\n\n\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.\n\n',
      'de':
          'Zuletzt aktualisiert: November 2024\n\n\nDiese Datenschutzrichtlinie beschreibt unsere Richtlinien und Verfahren zur Erfassung, Verwendung und Offenlegung Ihrer Daten, wenn Sie den Dienst nutzen, und informiert Sie über Ihre Datenschutzrechte und wie das Gesetz Sie schützt.\n\nWir verwenden Ihre personenbezogenen Daten, um den Dienst bereitzustellen und zu verbessern. Indem Sie den Dienst nutzen, stimmen Sie der Erfassung und Verwendung von Informationen gemäß dieser Datenschutzrichtlinie zu.\n\n',
      'ja':
          '最終更新日：2024年11月\n\n本プライバシーポリシーは、お客様が本サービスをご利用になる際のお客様の情報の収集、利用、開示に関する当社の方針と手順を規定し、お客様のプライバシー権および法律による保護についてご説明します。\n\n当社は、お客様の個人情報を本サービスの提供および改善のために利用します。お客様は、本サービスをご利用いただくことにより、本プライバシーポリシーに従って情報の収集および利用に同意したことになります。\n\n',
    },
    'qt1noxu3': {
      'en': 'INTERPRETATION AND DEFINITIONS\n\nInterpretation\n\n',
      'de': 'AUSLEGUNG UND DEFINITIONEN\n\nAuslegung\n\n',
      'ja': '解釈と定義\n\n解釈\n\n',
    },
    '40v9nhjc': {
      'en':
          'The words of which the initial letter is capitalized have meanings defined under the following conditions.\n\n\nThe following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\n',
      'de':
          'Die Wörter, deren Anfangsbuchstabe groß geschrieben ist, haben unter den folgenden Bedingungen die definierten Bedeutungen.\n\n\nDie folgenden Definitionen haben unabhängig davon, ob sie in der Einzahl oder Mehrzahl stehen, die gleiche Bedeutung.\n\n',
      'ja':
          '頭文字が大文字の単語は、以下の条件に基づいて定義された意味を持ちます。\n\n以下の定義は、単数形か複数形かにかかわらず、同一の意味を持ちます。\n\n',
    },
    '4idif6px': {
      'en': 'Definitions\n\n',
      'de': 'Definitionen\n\n',
      'ja': '定義\n\n',
    },
    'r0ivnhz3': {
      'en':
          'For the purposes of this Privacy Policy:\n\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable. Under GDPR (General Data Protection Regulation), You can be referred to as the Data Subject or as the User as you are the individual using the Service.\n\nCompany (referred to as either “the Company”, “We”, “Us” or “Our” in this Agreement) refers to Breakletics GmbH, Schliemannstr. 44, 10437 Berlin. For the purpose of the GDPR, the Company is the Data Controller.\n\nApplication means the software program provided by the Company downloaded by You on any electronic device, named HIIT the Beat by Breakletics\n\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where “control” means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\n\nAccount means a unique account created for You to access our Service or parts of our Service.\n\nWebsite refers to Breakletics Website, accessible from ',
      'de':
          'Für die Zwecke dieser Datenschutzrichtlinie:\n\nSie bezeichnet die Person, die auf den Dienst zugreift oder ihn nutzt, oder das Unternehmen oder eine andere juristische Person, in deren Namen diese Person auf den Dienst zugreift oder ihn nutzt, je nachdem, was zutrifft. Gemäß der DSGVO (Datenschutz-Grundverordnung) können Sie als betroffene Person oder als Benutzer bezeichnet werden, da Sie die Person sind, die den Dienst nutzt.\n\nUnternehmen (in dieser Vereinbarung als „das Unternehmen“, „Wir“, „Uns“ oder „Unser“ bezeichnet) bezeichnet Breakletics GmbH, Schliemannstr. 44, 10437 Berlin. Im Sinne der DSGVO ist das Unternehmen der Datenverantwortliche.\n\nAnwendung bezeichnet das vom Unternehmen bereitgestellte Softwareprogramm mit dem Namen „HIIT the Beat by Breakletics“, das Sie auf ein beliebiges elektronisches Gerät herunterladen können.\n\nVerbundenes Unternehmen bezeichnet eine Einheit, die eine Partei kontrolliert, von einer Partei kontrolliert wird oder mit einer Partei unter gemeinsamer Kontrolle steht, wobei „Kontrolle“ den Besitz von 50 % oder mehr der Aktien, Beteiligungen oder anderen Wertpapiere bedeutet, die zur Wahl von Direktoren oder anderen Leitungsorganen berechtigt sind.\n\nKonto bezeichnet ein einzigartiges Konto, das für Sie erstellt wird, um auf unseren Service oder Teile unseres Service zuzugreifen.\n\nWebsite bezeichnet die Breakletics-Website, zugänglich über\n\n',
      'ja':
          '本プライバシーポリシーにおいて、以下を規定します。\n\nお客様とは、本サービスにアクセスまたは利用する個人、もしくは当該個人が本サービスにアクセスまたは利用する会社もしくはその他の法人を指します。GDPR（一般データ保護規則）においては、お客様は本サービスを利用する個人であるため、データ主体またはユーザーと呼ばれる場合があります。\n\n会社（本契約では「会社」、「当社」、「弊社」または「弊社の」のいずれか）とは、Breakletics GmbH（所在地：Schliemannstr. 44, 10437 Berlin）を指します。GDPRの規定上、会社はデータ管理者です。\n\nアプリケーションとは、お客様が任意の電子機器にダウンロードした、会社が提供するソフトウェアプログラム（HIIT the Beat by Breakletics）を指します。\n\n関連会社とは、当事者を支配する、当事者によって支配される、または当事者と共同支配下にある事業体を指します。「支配」とは、取締役またはその他の経営権限の選任に関する議決権を有する株式、持分、またはその他の証券の50%以上を所有することを意味します。\n\nアカウントとは、お客様が当社のサービスまたは当社のサービスの一部にアクセスするために作成された固有のアカウントを指します。\n\nウェブサイトとは、Breakleticsのウェブサイトを指し、以下からアクセスできます。\n\n',
    },
    'qjs6qly9': {
      'en': 'www.breakletics.com\n\n',
      'de': 'www.breakletics.com\n\n',
      'ja': 'www.breakletics.com\n\n',
    },
    'on9v5aye': {
      'en':
          'Country refers to: Berlin, Germany\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used. For the purpose of the GDPR, Service Providers are considered Data Processors\n\nThird-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.\n\nPersonal Data is any information that relates to an identified or identifiable individual. For the purposes for GDPR, Personal Data means any information relating to You such as a name, an identification number, location data, online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity. For the purposes of the CCPA, Personal Data means any information that identifies, relates to, describes or is capable of being associated with, or could reasonably be linked, directly or indirectly, with You.\n\nCookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.\n\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\n\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\n\nData Controller, for the purposes of the GDPR (General Data Protection Regulation), refers to the Company as the legal person which alone or jointly with others determines the purposes and means of the processing of Personal Data.\n\nDo Not Track (DNT) is a concept that has been promoted by US regulatory authorities, in particular the U.S. Federal Trade Commission (FTC), for the Internet industry to develop and implement a mechanism for allowing internet users to control the tracking of their online activities across websites.\n\nBusiness, for the purpose of the CCPA (California Consumer Privacy Act), refers to the Company as the legal entity that collects Consumers’ personal information and determines the purposes and means of the processing of Consumers’ personal information, or on behalf of which such information is collected and that alone, or jointly with others, determines the purposes and means of the processing of consumers’ personal information, that does business in the State of California.\n\nConsumer, for the purpose of the CCPA (California Consumer Privacy Act), means a natural person who is a California resident. A resident, as defined in the law, includes (1) every individual who is in the USA for other than a temporary or transitory purpose, and (2) every individual who is domiciled in the USA who is outside the USA for a temporary or transitory purpose.\n\nSale, for the purpose of the CCPA (California Consumer Privacy Act), means selling, renting, releasing, disclosing, disseminating, making available, transferring, or otherwise communicating orally, in writing, or by electronic or other means, a Consumer’s Personal information to another business or a third party for monetary or other valuable consideration.\n\n',
      'de':
          'Land bezieht sich auf: Berlin, Deutschland\n\nDienstanbieter bezeichnet jede natürliche oder juristische Person, die die Daten im Auftrag des Unternehmens verarbeitet. Dies bezieht sich auf Drittunternehmen oder Einzelpersonen, die vom Unternehmen beauftragt werden, den Dienst zu ermöglichen, den Dienst im Auftrag des Unternehmens bereitzustellen, mit dem Dienst verbundene Dienste auszuführen oder das Unternehmen bei der Analyse der Nutzung des Dienstes zu unterstützen.\n\nDienstanbieter bezeichnet jede natürliche oder juristische Person, die die Daten im Auftrag des Unternehmens verarbeitet. Dies bezieht sich auf Drittunternehmen oder Einzelpersonen, die vom Unternehmen beauftragt werden, den Dienst zu ermöglichen, den Dienst im Auftrag des Unternehmens bereitzustellen, mit dem Dienst verbundene Dienste auszuführen oder das Unternehmen bei der Analyse der Nutzung des Dienstes zu unterstützen. Für die Zwecke der DSGVO gelten Dienstanbieter als Datenverarbeiter\n\nSocial-Media-Dienste von Drittanbietern beziehen sich auf jede Website oder jede Website eines sozialen Netzwerks, über die sich ein Benutzer anmelden oder ein Konto erstellen kann, um den Dienst zu verwenden.\n\nPersonenbezogene Daten sind alle Informationen, die sich auf eine identifizierte oder identifizierbare Person beziehen. Im Sinne der DSGVO sind unter personenbezogenen Daten sämtliche Informationen zu Ihrer Person zu verstehen, beispielsweise ein Name, eine Identifikationsnummer, Standortdaten, eine Online-Kennung oder ein oder mehrere Faktoren, die Ausdruck Ihrer physischen, physiologischen, genetischen, geistigen, wirtschaftlichen, kulturellen oder sozialen Identität sind. Im Sinne des CCPA sind personenbezogene Daten alle Informationen, die Sie identifizieren, sich auf Sie beziehen, Sie beschreiben oder mit Ihnen in Verbindung gebracht werden können oder vernünftigerweise direkt oder indirekt mit Ihnen in Verbindung gebracht werden könnten.\n\nCookies sind kleine Dateien, die von einer Website auf Ihrem Computer, Mobilgerät oder einem anderen Gerät abgelegt werden und die unter anderem die Details Ihres Browserverlaufs auf dieser Website enthalten.\n\nGerät ist jedes Gerät, das auf den Dienst zugreifen kann, z. B. ein Computer, ein Mobiltelefon oder ein digitales Tablet.\n\nNutzungsdaten sind automatisch erfasste Daten, die entweder durch die Verwendung des Dienstes oder durch die Dienstinfrastruktur selbst generiert werden (z. B. die Dauer eines Seitenbesuchs).\n\nDatenverantwortlicher ist im Sinne der DSGVO (Datenschutz-Grundverordnung) das Unternehmen als juristische Person, die allein oder gemeinsam mit anderen die Zwecke und Mittel der Verarbeitung personenbezogener Daten bestimmt.\n\nDo Not Track (DNT) ist ein Konzept, das wurde von US-amerikanischen Regulierungsbehörden, insbesondere der US-amerikanischen Federal Trade Commission (FTC), gefördert, damit die Internetbranche einen Mechanismus entwickelt und implementiert, der es Internetnutzern ermöglicht, die Verfolgung ihrer Online-Aktivitäten über Websites hinweg zu kontrollieren.\n\nUnternehmen bezeichnet im Sinne des CCPA (California Consumer Privacy Act) das Unternehmen als die juristische Person, die personenbezogene Daten von Verbrauchern erhebt und die Zwecke und Mittel der Verarbeitung personenbezogener Daten von Verbrauchern bestimmt oder in deren Namen solche Daten erhoben werden und die allein oder gemeinsam mit anderen die Zwecke und Mittel der Verarbeitung personenbezogener Daten von Verbrauchern bestimmt, die im Staat Kalifornien geschäftlich tätig ist.\n\nVerbraucher bezeichnet im Sinne des CCPA (California Consumer Privacy Act) eine natürliche Person mit Wohnsitz in Kalifornien. Ein Einwohner gemäß der gesetzlichen Definition umfasst (1) jede Person, die sich nicht nur vorübergehend oder vorübergehend in den USA aufhält, und (2) jede Person mit Wohnsitz in den USA, die sich nur vorübergehend oder vorübergehend außerhalb der USA aufhält.\n\nVerkauf bedeutet im Sinne des CCPA (California Consumer Privacy Act) den Verkauf, die Vermietung, die Freigabe, Offenlegung, Verbreitung, Bereitstellung, Übertragung oder anderweitige mündliche, schriftliche, elektronische oder sonstige Übermittlung der personenbezogenen Daten eines Verbrauchers an ein anderes Unternehmen oder einen Dritten gegen Geld oder eine sonstige wertvolle Gegenleistung.\n\n',
      'ja':
          '国：ドイツ、ベルリン\n\nサービスプロバイダーとは、当社に代わってデータを処理する自然人または法人を指します。サービスプロバイダーとは、当社が本サービスを促進するため、当社に代わってサービスを提供するため、本サービスに関連するサービスを遂行するため、または本サービスの利用状況の分析において当社を支援するために雇用する第三者の会社または個人を指します。\n\nサービスプロバイダーとは、当社に代わってデータを処理する自然人または法人を指します。サービスプロバイダーとは、当社が本サービスを促進するため、当社に代わってサービスを提供するため、本サービスに関連するサービスを遂行するため、または本サービスの利用状況の分析において当社を支援するために雇用する第三者の会社または個人を指します。GDPRの目的において、サービスプロバイダーはデータ処理者とみなされます。\n\nサードパーティのソーシャルメディアサービスとは、ユーザーが本サービスを利用するためにログインまたはアカウントを作成できるウェブサイトまたはソーシャルネットワークウェブサイトを指します。\n\n個人データとは、特定された個人または特定可能な個人に関するあらゆる情報を指します。 GDPRにおいて、「個人データ」とは、氏名、識別番号、位置情報、オンライン識別子、または身体的、生理的、遺伝的、精神的、経済的、文化的、もしくは社会的アイデンティティに特有の1つ以上の要素など、お客様に関連するあらゆる情報を指します。CCPAにおいて、「個人データ」とは、お客様を直接的または間接的に識別、関連付け、記述、または関連付けられる可能性のある、もしくは合理的に結び付けられる可能性のあるあらゆる情報を指します。\n\nCookieとは、ウェブサイトによってお客様のコンピューター、モバイルデバイス、またはその他のデバイスに配置される小さなファイルであり、そのウェブサイトにおけるお客様の閲覧履歴の詳細など、様々な用途があります。\n\nデバイスとは、コンピューター、携帯電話、デジタルタブレットなど、本サービスにアクセスできるあらゆるデバイスを指します。\n\n利用データとは、本サービスの利用によって、または本サービスのインフラストラクチャ自体から自動的に収集されるデータ（例：ページ閲覧時間）を指します。\n\nGDPR（一般データ保護規則）において、「データ管理者」とは、個人データの処理の目的および手段を単独で、または他の者と共同で決定する法人である当社を指します。\n\nDo Not Track（DNT）とは、米国の規制当局、特に米国連邦取引委員会（FTC）が推進する概念であり、インターネット業界がインターネット利用者がウェブサイトをまたいで自身のオンライン活動の追跡を制御できる仕組みを開発・実装することを目指しています。\n\nCCPA（カリフォルニア州消費者プライバシー法）における「事業者」とは、消費者の個人情報を収集し、その処理の目的および手段を決定する法人、または、消費者の個人情報が収集される法人であり、単独で、または他の事業者と共同で消費者の個人情報の処理の目的および手段を決定する法人であり、カリフォルニア州で事業を営む法人を指します。\n\nCCPA（カリフォルニア州消費者プライバシー法）における「消費者」とは、カリフォルニア州に居住する自然人を指します。法律で定義されている居住者には、(1)一時的または一時的な目的以外で米国内に滞在するすべての個人、および(2)米国に住所を有しながら一時的または一時的な目的で米国外に滞在するすべての個人が含まれます。\n\nCCPA（カリフォルニア州消費者プライバシー法）における「販売」とは、消費者の個人情報を、金銭またはその他の有価物と引き換えに、他の事業者または第三者に販売、貸与、公開、開示、頒布、提供、譲渡、またはその他の方法で伝達することを意味します。\n\n',
    },
    'qpw1v2a6': {
      'en':
          'COLLECTING AND USING YOUR PERSONAL DATA\n\nTypes of Data Collected\n\nPersonal Data\n\n',
      'de':
          'SAMMLUNG UND VERWENDUNG IHRER PERSONENBEZOGENEN DATEN\n\nArten der erfassten Daten\n\nPersönliche Daten\n\n',
      'ja': '個人データの収集と利用\n\n収集されるデータの種類\n\n個人データ\n\n',
    },
    'v9e1wahy': {
      'en':
          'While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\n• Email address\n• First name and last name\n• Phone number\n• Address, State, Province, ZIP/Postal code, City\n• Bank account information in order to pay for products and/or services within the Service\n\nWhen You pay for a product and/or a service via bank transfer, We may ask You to provide information to facilitate this transaction and to verify Your identity. Such information may include, without limitation:\n\n• Date of birth\n• Passport or National ID card\n• Bank card statement\n• Other information linking You to an address\n\n',
      'de':
          'Während Sie unseren Service nutzen, bitten wir Sie möglicherweise, uns bestimmte personenbezogene Daten zur Verfügung zu stellen, die verwendet werden können, um Sie zu kontaktieren oder zu identifizieren. Personenbezogene Daten können Folgendes umfassen, sind aber nicht darauf beschränkt:\n\n\n• E-Mail-Adresse\n\n• Vor- und Nachname\n\n• Telefonnummer\n\n• Adresse, Staat, Provinz, Postleitzahl, Stadt\n\n• Bankkontoinformationen, um für Produkte und/oder Dienstleistungen innerhalb des Service zu bezahlen\n\nWenn Sie für ein Produkt und/oder eine Dienstleistung per Banküberweisung bezahlen, bitten wir Sie möglicherweise um die Angabe von Informationen, um diese Transaktion zu erleichtern und Ihre Identität zu bestätigen. Solche Informationen können Folgendes umfassen, sind aber nicht darauf beschränkt:\n\n• Geburtsdatum\n• Reisepass oder Personalausweis\n• Bankkartenauszug\n• Andere Informationen, die Sie mit einer Adresse verknüpfen\n\n',
      'ja':
          '当社のサービスをご利用いただく際に、お客様に連絡を取ったり、お客様を特定したりするために、特定の個人情報の提供をお願いする場合があります。個人情報には、以下が含まれますが、これらに限定されません。\n\n• メールアドレス\n• 氏名（名）\n• 電話番号\n• 住所（都道府県、郵便番号、市区町村）\n• 本サービス内の商品またはサービスの支払いに使用する銀行口座情報\n\nお客様が銀行振込で商品またはサービスの支払いをされる場合、当社は、取引を円滑に進め、お客様の本人確認を行うために、情報の提供をお願いする場合があります。かかる情報には、以下が含まれますが、これらに限定されません。\n\n• 生年月日\n• パスポートまたは国民IDカード\n• 銀行カードの明細書\n• お客様と住所を結び付けるその他の情報\n\n',
    },
    'fogh6n3n': {
      'en': 'Usage Data\n\n',
      'de': 'Nutzungsdaten',
      'ja': '使用状況データ',
    },
    'z8w9f3qi': {
      'en':
          'Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Device’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.\n\n',
      'de':
          'Bei Verwendung des Dienstes werden Nutzungsdaten automatisch erfasst.\n\nNutzungsdaten können Informationen wie die Internetprotokolladresse (z. B. IP-Adresse) Ihres Geräts, den Browsertyp, die Browserversion, die von Ihnen besuchten Seiten unseres Dienstes, Uhrzeit und Datum Ihres Besuchs, die auf diesen Seiten verbrachte Zeit, eindeutige Gerätekennungen und andere Diagnosedaten umfassen.\n\nWenn Sie über ein mobiles Gerät auf den Dienst zugreifen, können wir bestimmte Informationen automatisch erfassen, darunter, aber nicht beschränkt auf, den Typ des von Ihnen verwendeten mobilen Geräts, die eindeutige ID Ihres mobilen Geräts, die IP-Adresse Ihres mobilen Geräts, Ihr mobiles Betriebssystem, den Typ des von Ihnen verwendeten mobilen Internetbrowsers, eindeutige Gerätekennungen und andere Diagnosedaten.\n\nWir können auch Informationen erfassen, die Ihr Browser sendet, wenn Sie unseren Dienst besuchen oder wenn Sie über ein mobiles Gerät auf den Dienst zugreifen.\n\n',
      'ja':
          '利用データは、本サービスのご利用時に自動的に収集されます。\n\n利用データには、お客様のデバイスのインターネットプロトコルアドレス（IPアドレスなど）、ブラウザの種類、ブラウザのバージョン、お客様が本サービスでアクセスしたページ、アクセス日時、当該ページでの滞在時間、デバイス固有の識別子（UID）、その他の診断データなどの情報が含まれる場合があります。\n\nお客様がモバイルデバイスから、またはモバイルデバイスを介して本サービスにアクセスした場合、当社は、お客様が使用するモバイルデバイスの種類、モバイルデバイスの固有ID、モバイルデバイスのIPアドレス、モバイルオペレーティングシステム、お客様が使用するモバイルインターネットブラウザの種類、デバイス固有の識別子、その他の診断データなど、特定の情報を自動的に収集する場合があります。\n\nまた、お客様が本サービスにアクセスした際、またはモバイルデバイスから、またはモバイルデバイスを介して本サービスにアクセスした際に、お客様のブラウザから送信される情報も収集する場合があります。\n\n',
    },
    '7exfkd6n': {
      'en': 'Information from Third-Party Social Media Services\n\n',
      'de': 'Informationen von Social-Media-Diensten Dritter\n\n',
      'ja': 'サードパーティのソーシャルメディアサービスからの情報\n\n',
    },
    '92r57nzo': {
      'en':
          'The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:\n\n• Google\n• Apple\n\nIf You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service’s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.\n\nYou may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service’s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.\n\n',
      'de':
          'Das Unternehmen ermöglicht Ihnen, über die folgenden Social Media-Dienste Dritter ein Konto zu erstellen und sich zur Verwendung des Dienstes anzumelden:\n\n• Google\n• Apple\n\nWenn Sie sich über einen Social Media-Dienst Dritter registrieren oder uns auf andere Weise Zugriff darauf gewähren, können wir personenbezogene Daten erfassen, die bereits mit dem Konto Ihres Social Media-Dienstes Dritter verknüpft sind, wie etwa Ihren Namen, Ihre E-Mail-Adresse, Ihre Aktivitäten oder Ihre mit diesem Konto verknüpfte Kontaktliste.\n\nSie haben möglicherweise auch die Möglichkeit, über das Konto Ihres Social Media-Dienstes Dritter weitere Informationen mit dem Unternehmen zu teilen. Wenn Sie sich dazu entschließen, derartige Informationen und personenbezogenen Daten während der Registrierung oder auf andere Weise bereitzustellen, erteilen Sie dem Unternehmen die Erlaubnis, diese in einer mit dieser Datenschutzrichtlinie übereinstimmenden Weise zu verwenden, freizugeben und zu speichern.\n\n',
      'ja':
          '当社は、お客様が以下の第三者ソーシャルメディアサービスを通じてアカウントを作成し、ログインして本サービスをご利用いただくことを許可しています。\n\n• Google\n• Apple\n\nお客様が第三者ソーシャルメディアサービスを通じて登録、または当社に当該サービスへのアクセスを許可された場合、当社は、お客様の氏名、メールアドレス、アクティビティ、または当該アカウントに関連付けられた連絡先リストなど、お客様の第三者ソーシャルメディアサービスのアカウントに既に関連付けられている個人データを収集する場合があります。\n\nお客様は、第三者ソーシャルメディアサービスのアカウントを通じて、当社と追加情報を共有することもできます。登録時またはその他の方法で、お客様がかかる情報および個人データを提供することを選択した場合、お客様は、当社が本プライバシーポリシーに従ってそれらを使用、共有、および保管することを許可するものとします。\n\n',
    },
    'bxyy1cxc': {
      'en': 'Information Collected while Using the Application\n\n',
      'de': 'Bei der Nutzung der Anwendung erfasste Informationen\n\n',
      'ja': 'アプリケーションの使用中に収集される情報\n\n',
    },
    'd9pftf4l': {
      'en':
          'While using Our Application, in order to provide features of Our Application, We may collect, with your prior permission:\n\nInformation regarding your location\n\nWe use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company’s servers and/or a Service Provider’s server or it be simply stored on Your device.\n\nYou can enable or disable access to this information at any time, through Your Device settings. You can also enable or disable location services when You use Our Service at any time, through Your Device settings.\n\n',
      'de':
          'Während Sie unsere Anwendung verwenden, können wir, um Funktionen unserer Anwendung bereitzustellen, mit Ihrer vorherigen Zustimmung Folgendes erfassen:\n\nInformationen zu Ihrem Standort\n\nWir verwenden diese Informationen, um Funktionen unseres Dienstes bereitzustellen, unseren Dienst zu verbessern und anzupassen. Die Informationen können auf die Server des Unternehmens und/oder den Server eines Dienstanbieters hochgeladen oder einfach auf Ihrem Gerät gespeichert werden.\n\nSie können den Zugriff auf diese Informationen jederzeit über die Einstellungen Ihres Geräts aktivieren oder deaktivieren. Sie können Standortdienste auch jederzeit über die Einstellungen Ihres Geräts aktivieren oder deaktivieren, wenn Sie unseren Dienst verwenden.\n\n',
      'ja':
          '当社アプリケーションのご利用中、当社アプリケーションの機能を提供するために、お客様の事前の許可を得た上で、以下の情報を収集する場合があります。\n\nお客様の位置情報\n\n当社は、本サービスの機能の提供、およびサービスの改善とカスタマイズのために、この情報を使用します。この情報は、当社のサーバーおよび／またはサービスプロバイダーのサーバーにアップロードされるか、お客様のデバイスにそのまま保存される場合があります。\n\nお客様は、デバイスの設定からいつでもこの情報へのアクセスを有効または無効にすることができます。また、お客様は、当社サービスのご利用時に、デバイスの設定からいつでも位置情報サービスを有効または無効にすることができます。\n\n',
    },
    '6uh71371': {
      'en': 'Tracking Technologies and Cookies\n\n',
      'de': 'Tracking-Technologien und Cookies\n\n',
      'ja': '追跡技術とCookie\n\n',
    },
    'f8lumrsd': {
      'en':
          'We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service.\n\nYou can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service.\n\nCookies can be “Persistent” or “Session” Cookies. Persistent Cookies remain on your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close your web browser.\n\nWe use both session and persistent Cookies for the purposes set out below:\n\n',
      'de':
          'Wir verwenden Cookies und ähnliche Tracking-Technologien, um die Aktivität auf unserem Service zu verfolgen und bestimmte Informationen zu speichern. Als Tracking-Technologien werden Beacons, Tags und Skripte verwendet, um Informationen zu sammeln und zu verfolgen und unseren Service zu verbessern und zu analysieren.\n\nSie können Ihren Browser anweisen, alle Cookies abzulehnen oder anzugeben, wann ein Cookie gesendet wird. Wenn Sie jedoch keine Cookies akzeptieren, können Sie möglicherweise einige Teile unseres Service nicht nutzen.\n\nCookies können „dauerhafte“ oder „Sitzungscookies“ sein. Dauerhafte Cookies verbleiben auf Ihrem PC oder Mobilgerät, wenn Sie offline gehen, während Sitzungscookies gelöscht werden, sobald Sie Ihren Webbrowser schließen.\n\nWir verwenden sowohl Sitzungscookies als auch dauerhafte Cookies für die unten aufgeführten Zwecke:\n\n',
      'ja':
          '当社は、Cookieおよび類似の追跡技術を使用して、当社のサービスにおけるアクティビティを追跡し、特定の情報を保存しています。使用される追跡技術には、ビーコン、タグ、スクリプトがあり、これらは情報の収集と追跡、および当社のサービスの改善と分析に使用されます。\n\nお客様は、ブラウザの設定により、すべてのCookieを拒否するか、Cookieの送信時に通知するように設定できます。ただし、Cookieを受け入れない場合、当社のサービスの一部をご利用いただけない場合があります。\n\nCookieには「パーシステントCookie」と「セッションCookie」があります。パーシステントCookieは、お客様がオフラインになってもパソコンまたはモバイルデバイスに残りますが、セッションCookieはウェブブラウザを閉じるとすぐに削除されます。\n\n当社は、以下の目的でセッションCookieとパーシステントCookieの両方を使用します。\n\n',
    },
    '6dqc8pxy': {
      'en': 'Necessary / Essential Cookies\n\n',
      'de': 'Notwendige / essentielle Cookies\n\n',
      'ja': '必要な/必須のCookie\n\n',
    },
    'ny5uz6r3': {
      'en':
          'Type: Session Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.\n\n',
      'de':
          'Typ: Sitzungscookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies sind unerlässlich, um Ihnen die über die Website verfügbaren Dienste bereitzustellen und Ihnen die Nutzung einiger ihrer Funktionen zu ermöglichen. Sie helfen bei der Authentifizierung von Benutzern und verhindern die betrügerische Verwendung von Benutzerkonten. Ohne diese Cookies können die von Ihnen angeforderten Dienste nicht bereitgestellt werden, und wir verwenden diese Cookies nur, um Ihnen diese Dienste bereitzustellen.\n\n',
      'ja':
          'タイプ: セッションCookie\n\n管理者: 当社\n\n目的: これらのCookieは、ウェブサイトを通じてお客様にサービスを提供し、一部の機能をご利用いただくために不可欠です。これらのCookieは、ユーザー認証とユーザーアカウントの不正利用防止に役立ちます。これらのCookieがないと、お客様がご希望のサービスを提供できません。当社は、これらのCookieを、お客様にサービスを提供するためにのみ使用します。\n\n',
    },
    'leze0xj6': {
      'en': 'Cookies Policy / Notice Acceptance Cookies\n\n',
      'de': 'Cookie-Richtlinie / Hinweis zur Akzeptanz von Cookies\n\n',
      'ja': 'クッキーポリシー / 通知の承認クッキー\n\n',
    },
    'ug12olui': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies identify if users have accepted the use of cookies on the Website.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies identifizieren, ob Benutzer die Verwendung von Cookies auf der Website akzeptiert haben.\n\n',
      'ja':
          'タイプ: 永続的Cookie\n\n管理者: 当社\n\n目的: これらのCookieは、ユーザーがウェブサイト上でCookieの使用を承認したかどうかを識別します。\n\n',
    },
    'q19ygppd': {
      'en': 'Functionality Cookies\n\n',
      'de': 'Funktionscookies\n\n',
      'ja': '機能性クッキー\n\n',
    },
    '2wgbtrnf': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies ermöglichen es uns, Ihre Auswahl bei der Nutzung der Website zu speichern, z. B. Ihre Anmeldedaten oder Spracheinstellungen. Der Zweck dieser Cookies besteht darin, Ihnen ein persönlicheres Erlebnis zu bieten und zu vermeiden, dass Sie Ihre Einstellungen bei jeder Nutzung der Website erneut eingeben müssen.\n\n',
      'ja':
          'タイプ: 永続的Cookie\n\n管理者: 当社\n\n目的: これらのCookieは、お客様がウェブサイトをご利用になる際に行った選択（ログイン情報や言語設定など）を記憶するために使用されます。これらのCookieの目的は、よりパーソナライズされた体験を提供すること、およびお客様がウェブサイトをご利用になるたびに設定を再入力する手間を省くことです。\n\n',
    },
    'oakw7vvn': {
      'en': 'Tracking and Performance Cookies\n\n',
      'de': 'Tracking und Performance Cookies\n\n',
      'ja': 'トラッキングとパフォーマンスCookie\n\n',
    },
    'nxgvk8ra': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Third-Parties\n\nPurpose: These Cookies are used to track information about traffic to the Website and how users use the Website. The information gathered via these Cookies may directly or indirectly identify you as an individual visitor. This is because the information collected is typically linked to a pseudonymous identifier associated with the device you use to access the Website. We may also use these Cookies to test new advertisements, pages, features or new functionality of the Website to see how our users react to them.\n\nFor more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Drittanbietern\n\nZweck: Diese Cookies werden verwendet, um Informationen über den Verkehr auf der Website und die Nutzung der Website durch Benutzer zu verfolgen. Die über diese Cookies gesammelten Informationen können Sie direkt oder indirekt als einzelnen Besucher identifizieren. Dies liegt daran, dass die gesammelten Informationen normalerweise mit einer pseudonymen Kennung verknüpft sind, die mit dem Gerät verknüpft ist, mit dem Sie auf die Website zugreifen. Wir können diese Cookies auch verwenden, um neue Anzeigen, Seiten, Funktionen oder neue Funktionen der Website zu testen, um zu sehen, wie unsere Benutzer darauf reagieren.\n\nWeitere Informationen zu den von uns verwendeten Cookies und Ihren Auswahlmöglichkeiten in Bezug auf Cookies finden Sie in unserer Cookie-Richtlinie.\n\n',
      'ja':
          'タイプ: 永続的Cookie\n\n管理者: 第三者\n\n目的: これらのCookieは、ウェブサイトへのトラフィック情報やユーザーによるウェブサイトの利用状況を追跡するために使用されます。これらのCookieによって収集される情報は、お客様を個々の訪問者として直接的または間接的に特定する場合があります。これは、収集される情報は通常、お客様がウェブサイトにアクセスする際に使用するデバイスに関連付けられた仮名識別子にリンクされているためです。また、当社はこれらのCookieを使用して、ウェブサイトの新しい広告、ページ、機能、または新機能をテストし、ユーザーの反応を確認する場合があります。\n\n当社が使用するCookieとCookieに関するお客様の選択肢の詳細については、Cookieポリシーをご覧ください。\n\n',
    },
    'z0zigdyo': {
      'en': 'Use of Your Personal Data\n\n',
      'de': 'Verwendung Ihrer persönlichen Daten\n\n',
      'ja': '個人データの利用\n\n',
    },
    'yqyv55rg': {
      'en':
          'The Company may use Personal Data for the following purposes:\n\nTo provide and maintain our Service, including to monitor the usage of our Service.\n\nTo manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n\nFor the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n\nTo contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application’s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n\n**To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n\nTo manage Your requests: To attend and manage Your requests to Us.\n\nWe may share your personal information in the following situations:\n\n\nWith Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to show advertisements to You to help support and maintain Our Service, to contact You, to advertise on third party websites to You after You visited our Service or for payment processing.\n\n\nFor Business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of our business to another company.\n\n\nWith Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.\n\n\nWith Business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.\n\n\nWith other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.\n\n',
      'de':
          'Das Unternehmen kann personenbezogene Daten für die folgenden Zwecke verwenden:\n\nZur Bereitstellung und Wartung unseres Dienstes, einschließlich der Überwachung der Nutzung unseres Dienstes.\n\nZur Verwaltung Ihres Kontos: zur Verwaltung Ihrer Registrierung als Benutzer des Dienstes. Die von Ihnen bereitgestellten personenbezogenen Daten können Ihnen Zugriff auf verschiedene Funktionen des Dienstes gewähren, die Ihnen als registrierter Benutzer zur Verfügung stehen.\n\nZur Erfüllung eines Vertrags: Entwicklung, Einhaltung und Durchführung des Kaufvertrags für die von Ihnen erworbenen Produkte, Artikel oder Dienstleistungen oder eines anderen Vertrags mit uns über den Dienst.\n\nZur Kontaktaufnahme: Zur Kontaktaufnahme mit Ihnen per E-Mail, Telefon, SMS oder anderen gleichwertigen Formen der elektronischen Kommunikation, wie z. B. Push-Benachrichtigungen einer mobilen Anwendung bezüglich Aktualisierungen oder informativer Mitteilungen in Bezug auf die Funktionen, Produkte oder vertraglich vereinbarten Dienstleistungen, einschließlich der Sicherheitsaktualisierungen, wenn dies für deren Umsetzung erforderlich oder angemessen ist.\n\n**Um Ihnen Neuigkeiten, Sonderangebote und allgemeine Informationen zu anderen von uns angebotenen Waren, Dienstleistungen und Veranstaltungen zukommen zu lassen, die denen ähnlich sind, die Sie bereits gekauft oder nach denen Sie sich erkundigt haben, sofern Sie sich nicht gegen den Erhalt solcher Informationen entschieden haben.\n\nZur Verwaltung Ihrer Anfragen: Zur Bearbeitung und Verwaltung Ihrer Anfragen an uns.\n\nWir können Ihre personenbezogenen Daten in den folgenden Situationen:\n\n\nAn Dienstanbieter: Wir können Ihre personenbezogenen Daten an Dienstanbieter weitergeben, um die Nutzung unseres Dienstes zu überwachen und zu analysieren, um Ihnen Werbung anzuzeigen, um unseren Dienst zu unterstützen und zu pflegen, um mit Ihnen Kontakt aufzunehmen, um Ihnen auf Websites von Drittanbietern Werbung anzuzeigen, nachdem Sie unseren Dienst besucht haben, oder für die Zahlungsabwicklung.\n\n\nFür Geschäftsübertragungen: Wir können Ihre personenbezogenen Daten im Zusammenhang mit oder während der Verhandlungen über eine Fusion, den Verkauf von Unternehmensvermögen, die Finanzierung oder den Erwerb unseres gesamten oder eines Teils unseres Unternehmens durch ein anderes Unternehmen weitergeben oder übertragen.\n\n\nAn verbundene Unternehmen: Wir können Ihre Daten an unsere verbundenen Unternehmen weitergeben. In diesem Fall verlangen wir von diesen verbundenen Unternehmen, diese Datenschutzrichtlinie einzuhalten. Zu den verbundenen Unternehmen zählen unser Mutterunternehmen und alle anderen Tochterunternehmen, Joint-Venture-Partner und andere Unternehmen, die von uns kontrolliert werden oder die mit uns unter gemeinsamer Kontrolle stehen.\n\n\nMit Geschäftspartnern: Wir können Ihre Informationen an unsere Geschäftspartner weitergeben, um Ihnen bestimmte Produkte, Dienstleistungen oder Werbeaktionen anzubieten.\n\n\nMit anderen Benutzern: Wenn Sie persönliche Informationen teilen oder auf andere Weise in den öffentlichen Bereichen mit anderen Benutzern interagieren, können diese Informationen von allen Benutzern eingesehen und öffentlich nach außen verbreitet werden. Wenn Sie mit anderen Benutzern interagieren oder sich über einen Social-Media-Dienst eines Drittanbieters registrieren, können Ihre Kontakte beim Social-Media-Dienst eines Drittanbieters Ihren Namen, Ihr Profil, Ihre Bilder und eine Beschreibung Ihrer Aktivität sehen. Ebenso können andere Benutzer Beschreibungen Ihrer Aktivitäten ansehen, mit Ihnen kommunizieren und Ihr Profil ansehen.\n\n',
      'ja':
          '当社は、以下の目的で個人データを利用する場合があります。\n\n当社のサービスの提供および維持（サービスの利用状況の監視を含む）。\n\nお客様のアカウント管理：本サービスのユーザーとしてのお客様の登録を管理するため。お客様が提供する個人データにより、お客様は登録ユーザーとして利用可能な本サービスの様々な機能にアクセスできるようになります。\n\n契約の履行：お客様が購入した製品、品目、またはサービスに関する購入契約、または本サービスを通じて当社と締結したその他の契約の作成、遵守、および履行。\n\nお客様への連絡：機能、製品、または契約サービス（セキュリティアップデートを含む）に関するアップデートや情報提供について、必要または合理的な場合に、メール、電話、SMS、またはモバイルアプリケーションのプッシュ通知など、これらに類する電子通信手段によりお客様に連絡するため。\n\n**お客様が既に購入またはお問い合わせいただいた商品、サービス、イベントに類似する当社が提供するその他の商品、サービス、イベントに関するニュース、特別オファー、および一般情報をお客様に提供するため（ただし、お客様がこれらの情報を受け取らないことを選択した場合を除きます）。\n\nお客様のリクエストへの対応：お客様からのリクエストへの対応および管理のため。\n\n当社は、以下の状況においてお客様の個人情報を共有する場合があります。\n\nサービスプロバイダー：当社は、サービス利用状況を監視および分析するため、サービスのサポートおよび維持を支援するためにお客様に広告を表示するため、お客様に連絡するため、お客様が当社のサービスにアクセスした後に第三者のウェブサイトでお客様向けに広告を表示するため、または支払い処理を行うために、お客様の個人情報をサービスプロバイダーと共有する場合があります。\n\n事業譲渡のため：当社は、合併、当社資産の売却、資金調達、または当社の事業の全部または一部の他社への買収に関連して、またはその交渉中に、お客様の個人情報を共有または移転する場合があります。\n\n関連会社：当社は、お客様の情報を当社の関連会社と共有する場合があります。その場合、当社は当該関連会社に対し、本プライバシーポリシーを遵守することを要求します。関連会社には、当社の親会社およびその他の子会社、合弁パートナー、または当社が支配する、または当社と共同支配下にあるその他の会社が含まれます。\n\nビジネスパートナー：当社は、お客様に特定の製品、サービス、またはプロモーションを提供するために、お客様の情報を当社のビジネスパートナーと共有する場合があります。\n\n他のユーザーとの共有：お客様が個人情報を共有したり、公共エリアで他のユーザーと交流したりする場合、当該情報はすべてのユーザーが閲覧でき、外部に公開される可能性があります。お客様が他のユーザーと交流したり、第三者のソーシャルメディアサービスを通じて登録したりする場合、当該第三者のソーシャルメディアサービス上のお客様の連絡先には、お客様の名前、プロフィール、写真、アクティビティの説明が開示される可能性があります。同様に、他のユーザーもお客様のアクティビティの説明を閲覧したり、お客様とコミュニケーションを取ったり、お客様のプロフィールを閲覧したりすることができます。\n\n',
    },
    'lmlrg8t2': {
      'en': 'Retention of Your Personal Data\n\n',
      'de': 'Aufbewahrung Ihrer persönlichen Daten\n\n',
      'ja': '個人データの保持\n\n',
    },
    '86duy0kl': {
      'en':
          'The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.\n\n',
      'de':
          'Das Unternehmen speichert Ihre personenbezogenen Daten nur so lange, wie dies für die in dieser Datenschutzrichtlinie dargelegten Zwecke erforderlich ist. Wir speichern und verwenden Ihre personenbezogenen Daten in dem Umfang, der erforderlich ist, um unseren gesetzlichen Verpflichtungen nachzukommen (beispielsweise, wenn wir Ihre Daten speichern müssen, um geltende Gesetze einzuhalten), Streitigkeiten beizulegen und unsere rechtlichen Vereinbarungen und Richtlinien durchzusetzen.\n\nDas Unternehmen speichert Nutzungsdaten auch für interne Analysezwecke. Nutzungsdaten werden im Allgemeinen für einen kürzeren Zeitraum gespeichert, es sei denn, diese Daten werden verwendet, um die Sicherheit zu stärken oder die Funktionalität unseres Dienstes zu verbessern, oder wir sind gesetzlich verpflichtet, diese Daten für längere Zeiträume zu speichern.\n\n',
      'ja':
          '当社は、本プライバシーポリシーに定める目的のために必要な期間のみ、お客様の個人データを保持します。当社は、法的義務の遵守（例えば、適用法の遵守のためにお客様のデータを保持する必要がある場合）、紛争の解決、および法的契約およびポリシーの履行に必要な範囲で、お客様の個人データを保持および使用します。\n\n当社は、社内分析の目的で利用状況データも保持します。利用状況データは、セキュリティ強化やサービス機能の向上のために使用される場合、または当社が法的に長期間保持する義務を負う場合を除き、通常はより短期間保持されます。\n\n',
    },
    'qvy4nn8z': {
      'en': 'Transfer of Your Personal Data\n\n',
      'de': 'Übermittlung Ihrer personenbezogenen Daten\n\n',
      'ja': '個人データの転送\n\n',
    },
    'etb00805': {
      'en':
          'Your information, including Personal Data, is processed at the Company’s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.\n\n',
      'de':
          'Ihre Informationen, einschließlich personenbezogener Daten, werden in den Betriebsbüros des Unternehmens und an allen anderen Orten verarbeitet, an denen sich die an der Verarbeitung beteiligten Parteien befinden. Dies bedeutet, dass diese Informationen an Computer außerhalb Ihres Staates, Ihrer Provinz, Ihres Landes oder einer anderen staatlichen Gerichtsbarkeit, in der andere Datenschutzgesetze als in Ihrer Gerichtsbarkeit gelten, übertragen und dort gespeichert werden können.\n\nIhre Zustimmung zu dieser Datenschutzrichtlinie und die anschließende Übermittlung dieser Informationen stellen Ihre Zustimmung zu dieser Übertragung dar.\n\nDas Unternehmen wird alle angemessenen Schritte unternehmen, um sicherzustellen, dass Ihre Daten sicher und in Übereinstimmung mit dieser Datenschutzrichtlinie behandelt werden. Es erfolgt keine Übertragung Ihrer personenbezogenen Daten an Organisationen oder Länder, ohne dass angemessene Kontrollen vorhanden sind, einschließlich der Sicherheit Ihrer Daten und anderer personenbezogener Informationen.\n\n',
      'ja':
          '個人データを含むお客様の情報は、当社の事業所および処理に関与する当事者が所在するその他の場所で処理されます。これは、この情報が、お客様の州、県、国、またはその他の政府管轄区域外にあるコンピューターに転送され、保管される可能性があることを意味します。これらの管轄区域のデータ保護法は、お客様の管轄区域の法律と異なる場合があります。\n\nお客様が本プライバシーポリシーに同意し、当該情報を提出することにより、お客様は当該転送に同意したことになります。\n\n当社は、お客様のデータが安全に、かつ本プライバシーポリシーに従って取り扱われるよう、合理的に必要なすべての措置を講じます。お客様のデータおよびその他の個人情報のセキュリティを含む適切な管理措置が講じられていない限り、お客様の個人データを組織または国に転送することはありません。\n\n',
    },
    'v4mc17m3': {
      'en': 'Disclosure of Your Personal Data\n\n',
      'de': 'Offenlegung Ihrer persönlichen Daten\n\n',
      'ja': '個人情報の開示\n\n',
    },
    'w4t69g2v': {
      'en':
          'Business Transactions\nIf the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.\n\nLaw enforcement\nUnder certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).\n\nOther legal requirements\nThe Company may disclose Your Personal Data in the good faith belief that such action is necessary to:\n\n• Comply with a legal obligation\n\n• Protect and defend the rights or property of the Company\n\n• Prevent or investigate possible wrongdoing in connection with the Service\n\n• Protect the personal safety of Users of the Service or the public\n\n• Protect against legal liability\n\n',
      'de':
          'Geschäftstransaktionen\n\nWenn das Unternehmen an einer Fusion, Übernahme oder einem Verkauf von Vermögenswerten beteiligt ist, können Ihre personenbezogenen Daten übertragen werden. Wir benachrichtigen Sie, bevor Ihre personenbezogenen Daten übertragen werden und einer anderen Datenschutzrichtlinie unterliegen.\n\nStrafverfolgung\n\nUnter bestimmten Umständen kann das Unternehmen verpflichtet sein, Ihre personenbezogenen Daten offenzulegen, wenn dies gesetzlich vorgeschrieben ist oder als Reaktion auf gültige Anfragen von Behörden (z. B. einem Gericht oder einer Regierungsbehörde).\n\nAndere gesetzliche Anforderungen\n\nDas Unternehmen kann Ihre personenbezogenen Daten in dem guten Glauben offenlegen, dass eine solche Maßnahme erforderlich ist, um:\n\n• einer gesetzlichen Verpflichtung nachzukommen\n\n• die Rechte oder das Eigentum des Unternehmens zu schützen und zu verteidigen\n\n• mögliches Fehlverhalten im Zusammenhang mit dem Dienst zu verhindern oder zu untersuchen\n\n• die persönliche Sicherheit der Benutzer des Dienstes oder der Öffentlichkeit zu schützen\n\n• vor gesetzlicher Haftung zu schützen\n\n',
      'ja':
          '事業取引\n当社が合併、買収、または資産売却に関与する場合、お客様の個人データが移転される可能性があります。お客様の個人データが移転され、異なるプライバシーポリシーの対象となる前に、当社は通知いたします。\n\n法執行\n特定の状況下において、当社は、法律により要求された場合、または公的機関（裁判所、政府機関など）からの正当な要請に応じて、お客様の個人データを開示しなければならない場合があります。\n\nその他の法的要求事項\n当社は、以下の目的のために必要であると誠実に判断した場合、お客様の個人データを開示することがあります。\n\n• 法的義務の遵守\n\n• 当社の権利または財産の保護および防衛\n\n• 本サービスに関連する不正行為の可能性の防止または調査\n\n• 本サービスのユーザーまたは公衆の個人の安全の保護\n\n• 法的責任からの保護\n\n',
    },
    'ddjtk7g6': {
      'en': 'Security of Your Personal Data\n\n',
      'de': 'Sicherheit Ihrer persönlichen Daten\n\n',
      'ja': '個人データのセキュリティ\n\n',
    },
    'gbxyt7tf': {
      'en':
          'The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.\n\n',
      'de':
          'Die Sicherheit Ihrer persönlichen Daten ist uns wichtig. Bedenken Sie jedoch, dass keine Methode der Übertragung über das Internet oder der elektronischen Speicherung 100 % sicher ist. Obwohl wir uns bemühen, kommerziell akzeptable Mittel zum Schutz Ihrer persönlichen Daten einzusetzen, können wir deren absolute Sicherheit nicht garantieren.\n\n',
      'ja':
          'お客様の個人データのセキュリティは当社にとって重要ですが、インターネットを介した送信方法や電子的な保存方法はどれも100%安全ではありません。当社は、お客様の個人データを保護するために商業的に許容される手段を用いるよう努めますが、その絶対的な安全性を保証することはできません。\n\n',
    },
    'smm1rjb7': {
      'en': 'DETAILED INFORMATION ON THE PROCESSING OF YOUR PERSONAL DATA\n\n',
      'de':
          'Detaillierte Informationen zur Verarbeitung Ihrer personenbezogenen Daten\n\n',
      'ja': '個人情報の取り扱いに関する詳細情報\n\n',
    },
    'm29j84b8': {
      'en':
          'Service Providers have access to Your Personal Data only to perform their tasks on Our behalf and are obligated not to disclose or use it for any other purpose.\n\n',
      'de':
          'Dienstleister haben nur Zugriff auf Ihre personenbezogenen Daten, um ihre Aufgaben in unserem Auftrag auszuführen, und sind verpflichtet, diese nicht offenzulegen oder für andere Zwecke zu verwenden.\n\n',
      'ja':
          'サービスプロバイダーは、当社に代わって業務を遂行するためにのみお客様の個人情報にアクセスし、他の目的でそれを開示または使用しない義務があります。\n\n',
    },
    '8hap8oi9': {
      'en': 'Analytics\n\n',
      'de': 'Analyse\n\n',
      'ja': '分析\n\n',
    },
    '0ieb5q5v': {
      'en':
          'We may use third-party Service providers to monitor and analyze the use of our Service.\n\n',
      'de':
          'Wir beauftragen gegebenenfalls Drittanbieter mit der Überwachung und Analyse der Nutzung unseres Dienstes.\n\n',
      'ja': '当社は、当社のサービスの使用状況を監視および分析するために、第三者のサービスプロバイダーを使用する場合があります。\n\n',
    },
    'vbivi1lk': {
      'en': 'Google Analytics\n\n',
      'de': 'Google Analytics\n\n',
      'ja': 'Google Analytics\n\n',
    },
    '0et8i7yy': {
      'en':
          'For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: ',
      'de':
          'Weitere Informationen zu den Datenschutzmaßnahmen von Google finden Sie auf der Webseite zu den Datenschutzbestimmungen und Nutzungsbedingungen von Google: ',
      'ja': 'Google のプライバシー ポリシーの詳細については、Google のプライバシーと利用規約のウェブ ページをご覧ください。 ',
    },
    '28h8rq59': {
      'en': 'https://policies.google.com/privacy?hl=en\n\n',
      'de': 'https://policies.google.com/privacy?hl=de\n\n',
      'ja': 'https://policies.google.com/privacy?hl=ja\n\n',
    },
    'bzhcjmdm': {
      'en': 'Email Marketing\n\n',
      'de': 'E-Mail-Marketing\n\n',
      'ja': 'メールマーケティング\n\n',
    },
    'xqdhqe10': {
      'en':
          'We may use Your Personal Data to contact You with newsletters, marketing or promotional materials and other information that may be of interest to You. You may opt-out of receiving any, or all, of these communications from Us by following the unsubscribe link or instructions provided in any email We send or by contacting Us.\n\nWe may use Email Marketing Service Providers to manage and send emails to You.\n\n',
      'de':
          'Wir können Ihre personenbezogenen Daten verwenden, um Ihnen Newsletter, Marketing- oder Werbematerialien und andere Informationen zukommen zu lassen, die für Sie von Interesse sein könnten. Sie können den Erhalt einzelner oder aller dieser Mitteilungen von uns ablehnen, indem Sie dem Abmeldelink oder den Anweisungen in jeder von uns gesendeten E-Mail folgen oder indem Sie uns kontaktieren.\n\nWir können E-Mail-Marketing-Dienstleister verwenden, um E-Mails an Sie zu verwalten und zu senden.\n\n',
      'ja':
          '当社は、お客様の個人情報を利用して、ニュースレター、マーケティング資料、販促資料、その他お客様が関心を持つ可能性のある情報をお客様にご連絡することがあります。お客様は、当社から送信されるメールに記載されている配信停止リンクまたは指示に従うか、当社に連絡することで、当社からのこれらの連絡の一部または全部の受信を停止することができます。\n\n当社は、お客様へのメールの管理および送信のために、メールマーケティングサービスプロバイダーを利用する場合があります。\n\n',
    },
    'd2pahrfn': {
      'en': 'Active Campaign\n\n',
      'de': 'Aktive Kampagne\n\n',
      'ja': 'アクティブキャンペーン\n\n',
    },
    'oj6mgbfq': {
      'en':
          'Active Campaign is an email marketing sending service provided by The Rocket Science Group LLC.\n\nFor more information on the privacy practices of Mailchimp, please visit their Privacy policy: ',
      'de':
          'Active Campaign ist ein von The Rocket Science Group LLC bereitgestellter Dienst zum Versenden von E-Mail-Marketing.\n\nWeitere Informationen zu den Datenschutzpraktiken von Mailchimp finden Sie in deren Datenschutzrichtlinie: ',
      'ja':
          'Active Campaignは、The Rocket Science Group LLCが提供するメールマーケティング配信サービスです。\n\nMailchimpのプライバシーに関する詳細は、同社のプライバシーポリシーをご覧ください。 ',
    },
    'cq136fzm': {
      'en': 'https://mailchimp.com/legal/privacy/\n\n',
      'de': 'https://mailchimp.com/legal/privacy/\n\n',
      'ja': 'https://mailchimp.com/legal/privacy/\n\n',
    },
    'vnxextye': {
      'en': 'Behavioral Remarketing\n\n',
      'de': 'Verhaltensbasiertes Remarketing\n\n',
      'ja': '行動リマーケティング\n\n',
    },
    'afnkwspd': {
      'en':
          'The Company uses remarketing services to advertise on third party websites to You after You visited our Service. We and Our third-party vendors use cookies to inform, optimize and serve ads based on Your past visits to our Service.\n\n',
      'de':
          'Das Unternehmen nutzt Remarketing-Dienste, um Ihnen auf Websites Dritter Werbung anzuzeigen, nachdem Sie unseren Service besucht haben. Wir und unsere Drittanbieter verwenden Cookies, um Anzeigen auf der Grundlage Ihrer früheren Besuche unseres Service zu erstellen, zu optimieren und bereitzustellen.\n\n',
      'ja':
          '当社は、お客様が本サービスにアクセスした後に、第三者のウェブサイト上で広告を表示するためにリマーケティングサービスを利用しています。当社および当社の第三者ベンダーは、お客様の本サービスへの過去のアクセスに基づいて広告を通知、最適化、配信するためにCookieを使用しています。\n\n',
    },
    'p2hajglx': {
      'en': 'Google Ads (AdWords)\n\n',
      'de': 'Google Ads (AdWords)\n\n',
      'ja': 'Google Ads (AdWords)\n\n',
    },
    'xcly9kgf': {
      'en':
          'Google Ads (AdWords) remarketing service is provided by Google Inc.\n\nYou can opt-out of Google Analytics for Display Advertising and customise the Google Display Network ads by visiting the Google Ads Settings page: ',
      'de':
          'Der Remarketing-Dienst Google Ads (AdWords) wird von Google Inc. bereitgestellt.\n\nSie können Google Analytics für Display-Werbung deaktivieren und die Anzeigen im Google Display-Netzwerk anpassen, indem Sie die Seite mit den Google Anzeigeneinstellungen aufrufen: ',
      'ja':
          'Google 広告（AdWords）リマーケティングサービスは、Google Inc. によって提供されています。\n\nGoogle アナリティクス ディスプレイ広告をオプトアウトし、Google ディスプレイ ネットワーク広告をカスタマイズするには、Google 広告設定ページにアクセスしてください。 ',
    },
    '4nf22fzk': {
      'en': 'http://www.google.com/settings/ads\n\n',
      'de': 'http://www.google.com/settings/ads\n\n',
      'ja': 'http://www.google.com/settings/ads\n\n',
    },
    'vvored7w': {
      'en':
          'Google also recommends installing the Google Analytics Opt-out Browser Add-on – ',
      'de':
          'Google empfiehlt außerdem die Installation des Browser-Add-ons zur Deaktivierung von Google Analytics – ',
      'ja': 'GoogleはGoogle Analyticsオプトアウトブラウザアドオンのインストールも推奨しています。 ',
    },
    '7793d9q1': {
      'en': 'https://tools.google.com/dlpage/',
      'de': 'https://tools.google.com/dlpage/',
      'ja': 'https://tools.google.com/dlpage/',
    },
    'ogw62cyt': {
      'en':
          ' – for your web browser. Google Analytics Opt-out Browser Add-on provides visitors with the ability to prevent their data from being collected and used by Google Analytics.\n\nFor more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: ',
      'de':
          ' – für Ihren Webbrowser. Das Browser-Add-on zur Deaktivierung von Google Analytics bietet Besuchern die Möglichkeit, die Erfassung und Verwendung ihrer Daten durch Google Analytics zu verhindern.\n\nWeitere Informationen zu den Datenschutzpraktiken von Google finden Sie auf der Webseite „Datenschutz und Nutzungsbedingungen“ von Google: ',
      'ja':
          '– ウェブブラウザ向け。Google アナリティクス オプトアウト ブラウザ アドオンを使用すると、訪問者は Google アナリティクスによるデータの収集と使用をブロックできます。\n\nGoogle のプライバシー ポリシーの詳細については、Google のプライバシーと利用規約のウェブページをご覧ください。 ',
    },
    'i20q2t87': {
      'en': 'https://policies.google.com/privacy?hl=en\n\n',
      'de': 'https://policies.google.com/privacy?hl=de\n\n',
      'ja': 'https://policies.google.com/privacy?hl=ja\n\n',
    },
    '4zjjpp2h': {
      'en': 'Facebook\n\n',
      'de': 'auf facebook.\n\n',
      'ja': 'Facebook\n\n',
    },
    'qhfp5nx4': {
      'en':
          'You can learn more about interest-based advertising from Facebook by visiting this page: ',
      'de':
          'Weitere Informationen zur interessenbasierten Werbung von Facebook finden Sie auf dieser Seite: ',
      'ja': 'Facebook の興味関心に基づく広告について詳しくは、次のページをご覧ください。 ',
    },
    'ciyooo7x': {
      'en': 'https://www.facebook.com/help/164968693837950\n\n',
      'de': 'https://www.facebook.com/help/164968693837950\n\n',
      'ja': 'https://www.facebook.com/help/164968693837950\n\n',
    },
    'z5xv7k5f': {
      'en':
          'To opt-out from Facebook’s interest-based ads, follow these instructions from Facebook: ',
      'de':
          'Um die interessensbasierten Anzeigen von Facebook abzulehnen, befolgen Sie diese Anweisungen von Facebook: ',
      'ja': 'Facebook の興味関心に基づく広告をオプトアウトするには、Facebook の以下の手順に従ってください。 ',
    },
    '2u2do80s': {
      'en': 'https://www.facebook.com/help/568137493302217\n\n',
      'de': 'https://www.facebook.com/help/568137493302217\n\n',
      'ja': 'https://www.facebook.com/help/568137493302217\n\n',
    },
    '0xmywyyc': {
      'en':
          'Facebook adheres to the Self-Regulatory Principles for Online Behavioural Advertising established by the Digital Advertising Alliance. You can also opt-out from Facebook and other participating companies through the Digital Advertising Alliance in the USA ',
      'de':
          'Facebook hält sich an die von der Digital Advertising Alliance aufgestellten Selbstregulierungsgrundsätze für verhaltensbasierte Online-Werbung. Sie können sich auch über die Digital Advertising Alliance in den USA von Facebook und anderen teilnehmenden Unternehmen abmelden. ',
      'ja':
          'Facebookは、デジタル広告連合（Digital Advertising Alliance）が制定したオンライン行動広告に関する自主規制原則を遵守しています。また、米国のデジタル広告連合（Digital Advertising Alliance）を通じて、Facebookやその他の参加企業からのオプトアウトも可能です。 ',
    },
    'l874qh0d': {
      'en': 'http://www.aboutads.info/choices/',
      'de': 'http://www.aboutads.info/choices/',
      'ja': 'http://www.aboutads.info/choices/',
    },
    '3gat2s8y': {
      'en': ', the Digital Advertising Alliance of Canada in Canada ',
      'de': ', die Digital Advertising Alliance of Canada in Kanada ',
      'ja': 'カナダのデジタル広告連盟 ',
    },
    'm5vuw7ed': {
      'en': 'http://youradchoices.ca/',
      'de': 'http://youradchoices.ca/',
      'ja': 'http://youradchoices.ca/',
    },
    'p4281dp0': {
      'en':
          ', or the European Interactive Digital Advertising Alliance in Europe ',
      'de':
          'oder die European Interactive Digital Advertising Alliance in Europa ',
      'ja': '、またはヨーロッパのヨーロッパインタラクティブデジタル広告連盟 ',
    },
    '206tck0g': {
      'en': 'http://www.youronlinechoices.eu/',
      'de': 'http://www.youronlinechoices.eu/',
      'ja': 'http://www.youronlinechoices.eu/',
    },
    's9lght0j': {
      'en': ', or opt-out using your mobile device settings.\n\n',
      'de':
          ', oder deaktivieren Sie diese Option über die Einstellungen Ihres Mobilgeräts.\n\n',
      'ja': '、またはモバイルデバイスの設定を使用してオプトアウトすることもできます。\n\n',
    },
    '6qc6zm6w': {
      'en':
          'For more information on the privacy practices of Facebook, please visit Facebook’s Data Policy: ',
      'de':
          'Weitere Informationen zu den Datenschutzpraktiken von Facebook finden Sie in der Datenrichtlinie von Facebook: ',
      'ja': 'Facebookのプライバシー慣行の詳細については、Facebookのデータポリシーをご覧ください。 ',
    },
    'wn8nligv': {
      'en': 'https://www.facebook.com/privacy/explanation\n\n',
      'de': 'https://www.facebook.com/privacy/explanation\n\n',
      'ja': 'https://www.facebook.com/privacy/explanation\n\n',
    },
    'dm54evlx': {
      'en': 'Payments\n\n',
      'de': 'Zahlungen\n\n',
      'ja': '支払い\n\n',
    },
    'idhkf8s7': {
      'en':
          'We may provide paid products and/or services within the Service. In that case, we may use third-party services for payment processing (e.g. payment processors).\n\nWe will not store or collect Your payment card details. That information is provided directly to Our third-party payment processors whose use of Your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.\n\n',
      'de':
          'Wir können innerhalb des Dienstes kostenpflichtige Produkte und/oder Dienste anbieten. In diesem Fall können wir Dienste von Drittanbietern zur Zahlungsabwicklung nutzen (z. B. Zahlungsabwickler).\n\nWir werden Ihre Zahlungskartendaten nicht speichern oder sammeln. Diese Informationen werden direkt an unsere Drittanbieter-Zahlungsabwickler weitergegeben, deren Verwendung Ihrer persönlichen Daten durch ihre Datenschutzrichtlinie geregelt ist. Diese Zahlungsabwickler halten sich an die von PCI-DSS festgelegten Standards, die vom PCI Security Standards Council verwaltet werden, einem gemeinsamen Projekt von Marken wie Visa, Mastercard, American Express und Discover. Die PCI-DSS-Anforderungen tragen dazu bei, den sicheren Umgang mit Zahlungsinformationen zu gewährleisten.\n\n',
      'ja':
          '当社は、本サービス内で有料の製品および／またはサービスを提供する場合があります。その場合、支払い処理のために第三者のサービス（例：決済代行業者）を利用することがあります。\n\n当社は、お客様のお支払いカード情報を保存または収集することはありません。これらの情報は、当社の第三者決済代行業者に直接提供され、お客様の個人情報の利用については、当該業者のプライバシーポリシーが適用されます。これらの決済代行業者は、Visa、Mastercard、American Express、Discoverなどのブランドが共同で設立したPCIセキュリティスタンダードカウンシル（PCI SSC）が管理するPCI-DSSの基準に準拠しています。PCI-DSSの要件は、支払い情報の安全な取り扱いを保証するために役立ちます。\n\n',
    },
    '9avj3mw2': {
      'en': 'Apple Store In-App Payments\n\n',
      'de': 'In-App-Zahlungen im Apple Store\n\n',
      'ja': 'Apple Storeアプリ内決済\n\n',
    },
    'gid3vnrr': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter ',
      'ja': 'プライバシーポリシーは以下でご覧いただけます。 ',
    },
    '2l5kh7u8': {
      'en': 'https://www.apple.com/legal/privacy/en-ww/\n\n',
      'de': 'https://www.apple.com/legal/privacy/en-ww/\n\n',
      'ja': 'https://www.apple.com/legal/privacy/en-ww/\n\n',
    },
    '06orj1gg': {
      'en': 'Google Play In-App Payments\n\n',
      'de': 'In-App-Zahlungen bei Google Play\n\n',
      'ja': 'Google Play アプリ内決済\n\n',
    },
    'm73mluoo': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter ',
      'ja': 'プライバシーポリシーは以下でご覧いただけます。 ',
    },
    'f20rfurq': {
      'en': 'https://www.google.com/policies/privacy/\n\n',
      'de': 'https://www.google.com/policies/privacy/\n\n',
      'ja': 'https://www.google.com/policies/privacy/\n\n',
    },
    'kk8cwriw': {
      'en': 'Stripe\n\n',
      'de': 'Stripe\n\n',
      'ja': 'Stripe\n\n',
    },
    '9vmpo1cl': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter ',
      'ja': 'プライバシーポリシーは以下からご覧いただけます。 ',
    },
    '7flaebfb': {
      'en': 'https://stripe.com/us/privacy\n\n',
      'de': 'https://stripe.com/us/privacy\n\n',
      'ja': 'https://stripe.com/us/privacy\n\n',
    },
    'pnnljlwu': {
      'en': 'PayPal\n\n',
      'de': 'PayPal\n\n',
      'ja': 'PayPal\n\n',
    },
    'ydgmp0cd': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter ',
      'ja': 'プライバシーポリシーは以下からご覧いただけます。 ',
    },
    'm5yu4fr0': {
      'en': 'https://www.paypal.com/webapps/mpp/ua/privacy-full\n\n',
      'de': 'https://www.paypal.com/webapps/mpp/ua/privacy-full\n\n',
      'ja': 'https://www.paypal.com/webapps/mpp/ua/privacy-full\n\n',
    },
    's73rkyhf': {
      'en':
          'When You use Our Service to pay a product and/or service via bank transfer, We may ask You to provide information to facilitate this transaction and to verify Your identity.\n\n',
      'de':
          'Wenn Sie unseren Service nutzen, um ein Produkt und/oder eine Dienstleistung per Banküberweisung zu bezahlen, bitten wir Sie möglicherweise um die Bereitstellung von Informationen, um diese Transaktion zu ermöglichen und Ihre Identität zu überprüfen.\n\n',
      'ja':
          'お客様が当社のサービスを利用して銀行振込で商品やサービスの支払いをする場合、当社は、この取引を円滑に進め、お客様の身元を確認するために、情報の提供をお願いすることがあります。\n\n',
    },
    '74kzajxs': {
      'en':
          'GDPR PRIVACY\n\nLegal Basis for Processing Personal Data under GDPR\n\n',
      'de':
          'DSGVO DATENSCHUTZERKLÄRUNG\n\nRechtliche Grundlage für die Verarbeitung personenbezogener Daten gemäß DSGVO\n\n',
      'ja': 'GDPRプライバシー\n\nGDPRに基づく個人データ処理の法的根拠\n\n',
    },
    'uu8p04wx': {
      'en':
          'We may process Personal Data under the following conditions:\n\n• Consent: You have given Your consent for processing Personal Data for one or more specific purposes.\n\n• Performance of a contract: Provision of Personal Data is necessary for the performance of an agreement with You and/or for any pre-contractual obligations thereof.\n\n• Legal obligations: Processing Personal Data is necessary for compliance with a legal obligation to which the Company is subject.\n\n• Vital interests: Processing Personal Data is necessary in order to protect Your vital interests or of another natural person.\n\n• Public interests: Processing Personal Data is related to a task that is carried out in the public interest or in the exercise of official authority vested in the Company.\n\n• Legitimate interests: Processing Personal Data is necessary for the purposes of the legitimate interests pursued by the Company.\n\nIn any case, the Company will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n',
      'de':
          'Wir können personenbezogene Daten unter den folgenden Bedingungen verarbeiten:\n\n• Zustimmung: Sie haben Ihre Zustimmung zur Verarbeitung personenbezogener Daten für einen oder mehrere bestimmte Zwecke gegeben.\n\n• Vertragserfüllung: Die Bereitstellung personenbezogener Daten ist für die Erfüllung einer Vereinbarung mit Ihnen und/oder für vorvertragliche Verpflichtungen daraus erforderlich.\n\n• Gesetzliche Verpflichtungen: Die Verarbeitung personenbezogener Daten ist zur Erfüllung einer gesetzlichen Verpflichtung erforderlich, der das Unternehmen unterliegt.\n\n• Lebenswichtige Interessen: Die Verarbeitung personenbezogener Daten ist erforderlich, um Ihre lebenswichtigen Interessen oder die einer anderen natürlichen Person zu schützen.\n\n• Öffentliche Interessen: Die Verarbeitung personenbezogener Daten steht im Zusammenhang mit einer Aufgabe, die im öffentlichen Interesse oder in Ausübung öffentlicher Gewalt ausgeführt wird, die dem Unternehmen übertragen wurde.\n\n• Berechtigte Interessen: Die Verarbeitung personenbezogener Daten ist zur Wahrung der berechtigten Interessen des Unternehmens erforderlich.\n\nIn jedem Fall wird das Unternehmen Wir helfen gerne bei der Klärung der konkreten Rechtsgrundlage, auf der die Verarbeitung beruht, insbesondere ob die Bereitstellung der personenbezogenen Daten gesetzlich oder vertraglich vorgeschrieben oder für den Abschluss eines Vertrages erforderlich ist.\n\n',
      'ja':
          '当社は、以下の条件に基づき個人データを処理することがあります。\n\n• 同意：お客様は、1つまたは複数の特定の目的のために個人データを処理することに同意しています。\n\n• 契約の履行：個人データの提供は、お客様との契約の履行および／または契約締結前の義務の履行に必要です。\n\n• 法的義務：個人データの処理は、当社が負う法的義務の遵守に必要です。\n\n• 重要な利益：個人データの処理は、お客様または他の自然人の重要な利益を保護するために必要です。\n\n• 公共の利益：個人データの処理は、公共の利益のために、または当社に付与された公的権限の行使のために行われる業務に関連しています。\n\n• 正当な利益：個人データの処理は、当社が追求する正当な利益のために必要です。\n\nいずれの場合も、当社は、処理に適用される具体的な法的根拠、特に個人データの提供が法定要件または契約上の要件であるか、あるいは契約締結に必要な要件であるかを明確にするお手伝いをいたします。\n\n',
    },
    '1kbwxdqe': {
      'en': 'Your Rights under the GDPR\n\n',
      'de': 'Ihre Rechte im Rahmen der DSGVO\n\n',
      'ja': 'GDPRに基づくあなたの権利\n\n',
    },
    'wairoic1': {
      'en':
          'The Company undertakes to respect the confidentiality of Your Personal Data and to guarantee You can exercise Your rights.\n\nYou have the right under this Privacy Policy, and by law if You are within the EU, to:\n\n• Request access to Your Personal Data. The right to access, update or delete the information We have on You. Whenever made possible, you can access, update or request deletion of Your Personal Data directly within Your account settings section. If you are unable to perform these actions yourself, please contact Us to assist You. This also enables You to receive a copy of the Personal Data We hold about You.\n\n• Request correction of the Personal Data that We hold about You. You have the right to to have any incomplete or inaccurate information We hold about You corrected.\n\n• Object to processing of Your Personal Data. This right exists where We are relying on a legitimate interest as the legal basis for Our processing and there is something about Your particular situation, which makes You want to object to our processing of Your Personal Data on this ground. You also have the right to object where We are processing Your Personal Data for direct marketing purposes.\n\n• Request erasure of Your Personal Data. You have the right to ask Us to delete or remove Personal Data when there is no good reason for Us to continue processing it.\n\n• Request the transfer of Your Personal Data. We will provide to You, or to a third-party You have chosen, Your Personal Data in a structured, commonly used, machine-readable format. Please note that this right only applies to automated information which You initially provided consent for Us to use or where We used the information to perform a contract with You.\n\n• Withdraw Your consent. You have the right to withdraw Your consent on using your Personal Data. If You withdraw Your consent, We may not be able to provide You with access to certain specific functionalities of the Service.\n\n',
      'de':
          'Das Unternehmen verpflichtet sich, die Vertraulichkeit Ihrer personenbezogenen Daten zu respektieren und zu garantieren, dass Sie Ihre Rechte ausüben können.\n\nGemäß dieser Datenschutzrichtlinie und gesetzlich, wenn Sie sich innerhalb der EU befinden, haben Sie folgende Rechte:\n\n• Zugriff auf Ihre personenbezogenen Daten zu beantragen. Das Recht, auf die Informationen zuzugreifen, die wir über Sie haben, diese zu aktualisieren oder zu löschen. Wenn möglich, können Sie direkt in Ihren Kontoeinstellungen auf Ihre personenbezogenen Daten zugreifen, diese aktualisieren oder deren Löschung beantragen. Wenn Sie diese Aktionen nicht selbst durchführen können, wenden Sie sich bitte an uns, damit wir Ihnen helfen können. Auf diese Weise können Sie auch eine Kopie der personenbezogenen Daten erhalten, die wir über Sie gespeichert haben.\n\n• Korrektur der personenbezogenen Daten beantragen, die wir über Sie gespeichert haben. Sie haben das Recht, unvollständige oder ungenaue Informationen, die wir über Sie gespeichert haben, korrigieren zu lassen.\n\n• Widerspruch gegen die Verarbeitung Ihrer personenbezogenen Daten einzulegen. Dieses Recht besteht, wenn wir uns auf ein berechtigtes Interesse als Rechtsgrundlage für unsere Verarbeitung berufen und Ihre besondere Situation Sie dazu veranlasst, unserer Verarbeitung Ihrer personenbezogenen Daten aus diesem Grund zu widersprechen. Sie haben auch ein Widerspruchsrecht, wenn wir Ihre personenbezogenen Daten für Direktmarketingzwecke verarbeiten.\n\n• Löschung Ihrer personenbezogenen Daten verlangen. Sie haben das Recht, uns aufzufordern, personenbezogene Daten zu löschen oder zu entfernen, wenn es für uns keinen triftigen Grund gibt, sie weiterhin zu verarbeiten.\n\n• Übertragung Ihrer personenbezogenen Daten verlangen. Wir werden Ihnen oder einem von Ihnen ausgewählten Dritten Ihre personenbezogenen Daten in einem strukturierten, allgemein verwendeten und maschinenlesbaren Format bereitstellen. Bitte beachten Sie, dass dieses Recht nur für automatisierte Informationen gilt, deren Nutzung wir ursprünglich genehmigt haben, oder die wir zur Erfüllung eines Vertrags mit Ihnen verwendet haben.\n\n• Ihre Einwilligung widerrufen. Sie haben das Recht, Ihre Einwilligung zur Nutzung Ihrer personenbezogenen Daten zu widerrufen. Wenn Sie Ihre Einwilligung widerrufen, können wir Ihnen möglicherweise keinen Zugriff mehr auf bestimmte Funktionen des Dienstes gewähren.\n\n',
      'ja':
          '当社は、お客様の個人データの機密性を尊重し、お客様が権利を行使できることを保証することをお約束します。\n\nお客様は、本プライバシーポリシーに基づき、またEU加盟国にお住まいの場合は法律に基づき、以下の権利を有します。\n\n• 個人データへのアクセスを要求する権利。当社が保有するお客様情報にアクセス、更新、または削除する権利。可能な場合はいつでも、お客様のアカウント設定セクションから直接、個人データにアクセス、更新、または削除を要求することができます。ご自身でこれらの操作を行うことができない場合は、当社までご連絡ください。これにより、当社が保有するお客様の個人データのコピーを受け取ることも可能になります。\n\n• 当社が保有するお客様の個人データの訂正を要求する権利。お客様は、当社が保有するお客様に関する不完全または不正確な情報を訂正する権利を有します。\n\n• 個人データの処理に異議を申し立てる権利。この権利は、当社が正当な利益を法的根拠として個人データを処理している場合に、お客様の特定の状況において、この理由に基づき当社による個人データの処理に異議を申し立てたい場合に発生します。また、当社がダイレクトマーケティングの目的で個人データを処理している場合にも、異議を申し立てる権利を有します。\n\n• 個人データの消去を要求する権利。お客様は、当社が個人データの処理を継続する正当な理由がない場合、当社に対し、個人データの削除または消去を要求する権利を有します。\n\n• 個人データの移転を要求する権利。当社は、お客様またはお客様が指定した第三者に対し、お客様の個人データを構造化され、一般的に利用され、機械可読な形式で提供します。この権利は、お客様が当初当社による使用に同意した自動化された情報、または当社がお客様との契約を履行するために情報を使用した場合にのみ適用されます。\n\n• 同意の撤回。お客様は、個人データの使用に関する同意を撤回する権利を有します。同意を撤回した場合、当社はお客様に本サービスの特定の機能へのアクセスを提供できなくなる場合があります。\n\n',
    },
    'h2jai3eu': {
      'en': 'Exercising of Your GDPR Data Protection Rights\n\n',
      'de': 'Ausübung Ihrer DSGVO-Datenschutzrechte\n\n',
      'ja': 'GDPRデータ保護権の行使\n\n',
    },
    'jpzo6iw4': {
      'en':
          'You may exercise Your rights of access, rectification, cancellation and opposition by contacting Us. Please note that we may ask You to verify Your identity before responding to such requests. If You make a request, We will try our best to respond to You as soon as possible.\n\nYou have the right to complain to a Data Protection Authority about Our collection and use of Your Personal Data. For more information, if You are in the European Economic Area (EEA), please contact Your local data protection authority in the EEA.\n\n',
      'de':
          'Sie können Ihr Recht auf Zugriff, Berichtigung, Löschung und Widerspruch ausüben, indem Sie uns kontaktieren. Bitte beachten Sie, dass wir Sie möglicherweise bitten, Ihre Identität zu bestätigen, bevor wir auf solche Anfragen antworten. Wenn Sie eine Anfrage stellen, werden wir unser Bestes tun, um Ihnen so schnell wie möglich zu antworten.\n\nSie haben das Recht, sich bei einer Datenschutzbehörde über unsere Erhebung und Verwendung Ihrer personenbezogenen Daten zu beschweren. Wenn Sie sich im Europäischen Wirtschaftsraum (EWR) befinden, wenden Sie sich für weitere Informationen bitte an Ihre lokale Datenschutzbehörde im EWR.\n\n',
      'ja':
          'お客様は、当社に連絡することにより、アクセス、訂正、キャンセル、異議申し立ての権利を行使することができます。これらのリクエストに対応する前に、お客様のご本人確認をお願いする場合がありますのでご了承ください。リクエストがあった場合、当社は可能な限り迅速に対応できるよう最善を尽くします。\n\nお客様は、当社によるお客様の個人データの収集および使用に関して、データ保護当局に苦情を申し立てる権利を有します。欧州経済領域（EEA）にお住まいの場合は、詳細については、EEAの地域のデータ保護当局にお問い合わせください。\n\n',
    },
    'iaa7bfaf': {
      'en': 'GDPR PRIVACY\n\nYour Rights under the CCPA\n\n',
      'de': 'DSGVO DATENSCHUTZ\n\nIhre Rechte im Rahmen des CCPA\n\n',
      'ja': 'GDPR プライバシー\n\nCCPAに基づくお客様の権利\n\n',
    },
    'f1irwnw7': {
      'en':
          'Under this Privacy Policy, and by law if You are a resident of California, You have the following rights:\n\n• The right to notice. You must be properly notified which categories of Personal Data are being collected and the purposes for which the Personal Data is being used.\n\n• The right to access / the right to request. The CCPA permits You to request and obtain from the Company information regarding the disclosure of Your Personal Data that has been collected in the past 12 months by the Company or its subsidiaries to a third-party for the third party’s direct marketing purposes.\n\n• The right to say no to the sale of Personal Data. You also have the right to ask the Company not to sell Your Personal Data to third parties. You can submit such a request by visiting our “Do Not Sell My Personal Information” section or web page.\n\n• The right to know about Your Personal Data. You have the right to request and obtain from the Company information regarding the disclosure of the following:\n\n• The categories of Personal Data collected\n\n• The sources from which the Personal Data was collected\n\n• The business or commercial purpose for collecting or selling the Personal Data\n\n• Categories of third parties with whom We share Personal Data\n\n• The specific pieces of Personal Data we collected about You\n\n• The right to delete Personal Data. You also have the right to request the deletion of Your Personal Data that have been collected in the past 12 months.\n\n• The right not to be discriminated against. You have the right not to be discriminated against for exercising any of Your Consumer’s rights, including by:\n\n• Denying goods or services to You\n\n• Charging different prices or rates for goods or services, including the use of discounts or other benefits or imposing penalties\n\n• Providing a different level or quality of goods or services to You\n\n• Suggesting that You will receive a different price or rate for goods or services or a different level or quality of goods or services.\n\n',
      'de':
          'Gemäß dieser Datenschutzrichtlinie und per Gesetz haben Sie, wenn Sie in Kalifornien ansässig sind, folgende Rechte:\n\n• Das Recht auf Benachrichtigung. Sie müssen ordnungsgemäß darüber informiert werden, welche Kategorien personenbezogener Daten erfasst werden und zu welchen Zwecken die personenbezogenen Daten verwendet werden.\n\n• Das Recht auf Zugriff/das Recht auf Anfrage. Das CCPA gestattet Ihnen, vom Unternehmen Informationen bezüglich der Weitergabe Ihrer personenbezogenen Daten anzufordern und zu erhalten, die in den letzten 12 Monaten vom Unternehmen oder seinen Tochtergesellschaften an Dritte für Direktmarketingzwecke erfasst wurden.\n\n• Das Recht, dem Verkauf personenbezogener Daten zu widersprechen. Sie haben auch das Recht, das Unternehmen aufzufordern, Ihre personenbezogenen Daten nicht an Dritte zu verkaufen. Sie können eine solche Anfrage stellen, indem Sie unseren Abschnitt oder unsere Webseite „Meine personenbezogenen Daten nicht verkaufen“ besuchen.\n\n• Das Recht auf Kenntnis Ihrer personenbezogenen Daten. Sie haben das Recht, vom Unternehmen Informationen zur Offenlegung der folgenden Informationen anzufordern und zu erhalten:\n\n• Die Kategorien der erfassten personenbezogenen Daten\n\n• Die Quellen, aus denen die personenbezogenen Daten erfasst wurden\n\n• Der geschäftliche oder kommerzielle Zweck für die Erfassung oder den Verkauf der personenbezogenen Daten\n\n• Kategorien von Drittanbietern, mit denen wir personenbezogene Daten teilen\n\n• Die spezifischen personenbezogenen Daten, die wir über Sie erfasst haben\n\n• Das Recht auf Löschung personenbezogener Daten. Sie haben auch das Recht, die Löschung Ihrer personenbezogenen Daten zu verlangen, die in den letzten 12 Monaten erfasst wurden.\n\n\n• Das Recht, nicht diskriminiert zu werden. Sie haben das Recht, bei der Ausübung Ihrer Verbraucherrechte nicht diskriminiert zu werden, einschließlich durch:\n\n• Verweigerung von Waren oder Dienstleistungen an Sie\n\n• Erhebung unterschiedlicher Preise oder Tarife für Waren oder Dienstleistungen, einschließlich der Gewährung von Rabatten oder anderen Vorteilen oder der Verhängung von Strafen\n\n• Bereitstellung eines anderen Niveaus oder einer anderen Qualität von Waren oder Dienstleistungen an Sie\n\n• Andeutung, dass Sie für Waren oder Dienstleistungen einen anderen Preis oder Tarif oder ein anderes Niveau oder eine andere Qualität von Waren oder Dienstleistungen erhalten.\n\n',
      'ja':
          '本プライバシーポリシーに基づき、またカリフォルニア州居住者の場合は法律に基づき、お客様には以下の権利があります。\n\n• 通知を受ける権利。収集される個人データの種類とその使用目的について、適切な通知を受ける必要があります。\n\n• アクセス権／請求権。CCPA（カリフォルニア州消費者プライバシー法）に基づき、お客様は、過去12ヶ月間に当社またはその子会社が第三者のダイレクトマーケティング目的で収集したお客様の個人データの開示に関する情報を当社に請求し、入手することができます。\n\n• 個人データの販売を拒否する権利。お客様は、当社に対し、お客様の個人データを第三者に販売しないよう求める権利も有します。この請求は、当社の「個人情報の販売拒否」セクションまたはウェブページから行うことができます。\n\n• お客様の個人データについて知る権利。お客様は、当社に対し、以下の情報の開示を要求し、取得する権利を有します。\n\n• 収集された個人データの種類\n\n• 個人データの収集元\n\n• 個人データの収集または販売の事業目的または商業目的\n\n• 当社が個人データを共有する第三者の種類\n\n• 当社がお客様について収集した個人データの具体的な内容\n\n• 個人データを削除する権利。また、過去12ヶ月間に収集された個人データの削除を要求する権利も有します。\n\n• 差別を受けない権利お客様は、消費者としての権利を行使したことを理由として、以下の行為を含む差別を受けない権利を有します。\n\n• お客様への商品またはサービスの提供を拒否すること\n\n• 商品またはサービスに対して、割引やその他の特典の利用、またはペナルティの適用を含む、異なる価格または料金を請求すること\n\n• お客様に対して、異なるレベルまたは品質の商品またはサービスを提供すること\n\n• 商品またはサービスに対して異なる価格または料金、あるいは異なるレベルまたは品質の商品またはサービスの提供を示唆すること。\n\n',
    },
    'fzzvgesc': {
      'en': 'Exercising Your CCPA Data Protection Rights\n\n',
      'de': 'Ausübung Ihrer CCPA-Datenschutzrechte\n\n',
      'ja': 'CCPAデータ保護権の行使\n\n',
    },
    'og8tx98m': {
      'en':
          'In order to exercise any of Your rights under the CCPA, and if you are a California resident, You can email or call us or visit our “Do Not Sell My Personal Information” section or web page.\n\nThe Company will disclose and deliver the required information free of charge within 45 days of receiving Your verifiable request. The time period to provide the required information may be extended once by an additional 45 days when reasonable necessary and with prior notice.\n\n',
      'de':
          'Um Ihre Rechte gemäß CCPA auszuüben, können Sie uns als Einwohner Kaliforniens eine E-Mail senden, uns anrufen oder unseren Abschnitt oder unsere Webseite „Meine persönlichen Daten nicht verkaufen“ besuchen.\n\nDas Unternehmen wird die erforderlichen Informationen innerhalb von 45 Tagen nach Erhalt Ihrer überprüfbaren Anfrage kostenlos offenlegen und bereitstellen. Die Frist zur Bereitstellung der erforderlichen Informationen kann einmal um weitere 45 Tage verlängert werden, wenn dies angemessen und nach vorheriger Ankündigung erforderlich ist.\n\n',
      'ja':
          'CCPAに基づくお客様の権利を行使するには、カリフォルニア州にお住まいの場合、メールまたはお電話にてご連絡いただくか、「個人情報の販売拒否」セクションまたはウェブページをご覧ください。\n\n当社は、お客様から検証可能なリクエストを受領してから45日以内に、必要な情報を無料で開示・提供します。必要な情報の提供期間は、合理的に必要な場合、事前に通知することにより、1回につき45日間延長される場合があります。\n\n',
    },
    'omp9zedd': {
      'en': 'Do Not Sell My Personal Information\n\n',
      'de': 'Verkaufen Sie meine persönlichen Daten nicht\n',
      'ja': '私の個人情報を販売しないでください\n\n',
    },
    'low57xme': {
      'en':
          'We do not sell personal information. However, the Service Providers we partner with (for example, our advertising partners) may use technology on the Service that “sells” personal information as defined by the CCPA law.\n\nIf you wish to opt out of the use of your personal information for interest-based advertising purposes and these potential sales as defined under CCPA law, you may do so by following the instructions below.\n\nPlease note that any opt out is specific to the browser You use. You may need to opt out on every browser that you use.\n\n',
      'de':
          'Wir verkaufen keine personenbezogenen Daten. Die Dienstanbieter, mit denen wir zusammenarbeiten (z. B. unsere Werbepartner), können jedoch Technologien für den Dienst verwenden, die personenbezogene Daten im Sinne des CCPA-Gesetzes „verkaufen“.\n\nWenn Sie der Verwendung Ihrer personenbezogenen Daten für interessenbasierte Werbezwecke und diesen potenziellen Verkäufen im Sinne des CCPA-Gesetzes widersprechen möchten, können Sie dies tun, indem Sie die folgenden Anweisungen befolgen.\n\nBitte beachten Sie, dass jede Deaktivierung spezifisch für den von Ihnen verwendeten Browser ist. Möglicherweise müssen Sie die Deaktivierung in jedem von Ihnen verwendeten Browser durchführen.\n\n',
      'ja':
          '当社は個人情報を販売しません。ただし、当社が提携するサービスプロバイダー（例えば、広告パートナー）は、CCPA法の定義に基づき、本サービスにおいて個人情報を「販売」する技術を使用する場合があります。\n\nCCPA法の定義に基づき、興味関心に基づく広告の配信、およびこうした潜在的な販売をオプトアウトする場合は、以下の手順に従ってください。\n\nオプトアウトは、お客様がご利用のブラウザによって異なりますのでご注意ください。ご利用のブラウザごとにオプトアウトが必要となる場合があります。\n\n',
    },
    'unnve6su': {
      'en': 'Website\n\n',
      'de': 'Webseite\n\n',
      'ja': 'Webサイト\n\n',
    },
    '51fapj5l': {
      'en':
          'You can opt out of receiving ads that are personalized as served by our Service Providers by following our instructions presented on the Service:\n\n• From Our “Cookie Consent” notice banner\n\n• Or from Our “CCPA Opt-out” notice banner\n\n• Or from Our “Do Not Sell My Personal Information” notice banner\n\n• Or from Our “Do Not Sell My Personal Information” link\n\nThe opt out will place a cookie on Your computer that is unique to the browser You use to opt out. If you change browsers or delete the cookies saved by your browser, you will need to opt out again.\n\n',
      'de':
          'Sie können den Erhalt personalisierter Werbung unserer Dienstanbieter ablehnen, indem Sie unseren Anweisungen im Dienst folgen:\n\n• Über unser Hinweisbanner „Cookie-Einwilligung“\n\n• Oder über unser Hinweisbanner „CCPA-Opt-out“\n\n• Oder über unser Hinweisbanner „Meine persönlichen Daten nicht verkaufen“\n\n• Oder über unseren Link „Meine persönlichen Daten nicht verkaufen“\n\nDurch die Abmeldung wird auf Ihrem Computer ein Cookie platziert, das für den von Ihnen zur Abmeldung verwendeten Browser eindeutig ist. Wenn Sie den Browser wechseln oder die von Ihrem Browser gespeicherten Cookies löschen, müssen Sie die Abmeldung erneut vornehmen.\n\n',
      'ja':
          'サービスプロバイダーが配信するパーソナライズ広告の受信をオプトアウトするには、サービス上に表示される以下の手順に従ってください。\n\n• 「Cookie同意」通知バナーから\n\n• 「CCPAオプトアウト」通知バナーから\n\n• 「個人情報の販売拒否」通知バナーから\n\n• 「個人情報の販売拒否」リンクから\n\nオプトアウトを行うと、オプトアウトに使用したブラウザ固有のCookieがお客様のコンピュータに保存されます。ブラウザを変更した場合、またはブラウザに保存されたCookieを削除した場合は、再度オプトアウトする必要があります。\n\n',
    },
    'bb1h1993': {
      'en': 'Mobile Devices\n\n',
      'de': 'Mobile Geräte\n\n',
      'ja': 'モバイルデバイス\n\n',
    },
    'zxt9q6jy': {
      'en':
          'Your mobile device may give you the ability to opt out of the use of information about the apps you use in order to serve you ads that are targeted to your interests:\n\n\n• “Opt out of Interest-Based Ads” or “Opt out of Ads Personalization” on Android devices\n\n\n• “Limit Ad Tracking” on iOS devices\n\n\nYou can also stop the collection of location information from Your mobile device by changing the preferences on your mobile device.\n\n',
      'de':
          'Auf Ihrem Mobilgerät haben Sie möglicherweise die Möglichkeit, die Verwendung von Informationen über die von Ihnen genutzten Apps abzulehnen, um Ihnen auf Ihre Interessen ausgerichtete Werbung anzuzeigen:\n\n\n• „Deaktivierung von interessensbasierten Anzeigen“ oder „Deaktivierung von personalisierter Werbung“ auf Android-Geräten\n\n\n• „Ad-Tracking beschränken“ auf iOS-Geräten\n\n\nSie können die Erfassung von Standortinformationen von Ihrem Mobilgerät auch beenden, indem Sie die Einstellungen auf Ihrem Mobilgerät ändern.\n\n',
      'ja':
          'モバイルデバイスには、お客様の興味関心に合わせた広告を配信するために、お客様が使用しているアプリに関する情報の利用をオプトアウトする機能が搭載されている場合があります。\n\n• Androidデバイスの場合、「興味関心に基づく広告をオプトアウト」または「広告のパーソナライズをオプトアウト」\n\n• iOSデバイスの場合、「広告トラッキングを制限」\n\nモバイルデバイスの設定を変更することで、モバイルデバイスからの位置情報の収集を停止することもできます。\n\n',
    },
    'dlsenjv4': {
      'en':
          '“DO NOT TRACK” POLICY AS REQUIRED BY CALIFORNIA ONLINE PRIVACY PROTECTION ACT (CALOPPA)\n\n',
      'de':
          '„DO NOT TRACK“-RICHTLINIE GEMÄSS DEM CALIFORNIA ONLINE PRIVACY PROTECTION ACT (CALOPPA)\n\n',
      'ja': 'カリフォルニア州オンラインプライバシー保護法（CALOPPA）で義務付けられている「追跡しない」ポリシー\n\n',
    },
    '8nl3x4r5': {
      'en':
          'Our Service does not respond to Do Not Track signals.\n\n\nHowever, some third party websites do keep track of Your browsing activities. If You are visiting such websites, You can set Your preferences in Your web browser to inform websites that You do not want to be tracked. You can enable or disable DNT by visiting the preferences or settings page of Your web browser.\n\n',
      'de':
          'Unser Service reagiert nicht auf „Do Not Track“-Signale.\n\n\nEinige Websites von Drittanbietern verfolgen jedoch Ihre Browsing-Aktivitäten. Wenn Sie solche Websites besuchen, können Sie Ihre Einstellungen in Ihrem Webbrowser so festlegen, dass Websites darüber informiert werden, dass Sie nicht verfolgt werden möchten. Sie können DNT aktivieren oder deaktivieren, indem Sie die Einstellungs- oder Einstellungsseite Ihres Webbrowsers aufrufen.\n\n',
      'ja':
          '当社のサービスはDo Not Track信号には対応しておりません。\n\nただし、一部の第三者ウェブサイトはお客様の閲覧行動を追跡しています。お客様がそのようなウェブサイトを訪問される場合は、ウェブブラウザの設定で追跡を希望しない旨をウェブサイトに通知することができます。DNT機能は、ウェブブラウザの設定ページから有効または無効にすることができます。\n\n',
    },
    'r014fa2a': {
      'en': 'CHILDREN’S PRIVACY\n\n',
      'de': 'DATENSCHUTZ FÜR KINDER\n\n',
      'ja': '子供のプライバシー\n\n',
    },
    'trbr04fn': {
      'en':
          'Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n\n\nWe also may limit how We collect, use, and store some of the information of Users between 13 and 18 years old. In some cases, this means We will be unable to provide certain functionality of the Service to these users.\n\n\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent’s consent before We collect and use that information.\n\n',
      'de':
          'Unser Dienst richtet sich nicht an Personen unter 13 Jahren. Wir erfassen wissentlich keine personenbezogenen Daten von Personen unter 13 Jahren. Wenn Sie ein Elternteil oder Erziehungsberechtigter sind und wissen, dass Ihr Kind uns personenbezogene Daten übermittelt hat, nehmen Sie bitte Kontakt mit uns auf. Wenn uns bekannt wird, dass wir personenbezogene Daten von Personen unter 13 Jahren ohne Überprüfung der elterlichen Zustimmung erfasst haben, ergreifen wir Maßnahmen, um diese Informationen von unseren Servern zu entfernen.\n\n\n\nWir können außerdem die Art und Weise einschränken, wie wir einige Informationen von Benutzern zwischen 13 und 18 Jahren erfassen, verwenden und speichern. In einigen Fällen bedeutet dies, dass wir diesen Benutzern bestimmte Funktionen des Dienstes nicht zur Verfügung stellen können.\n\n\nWenn wir uns auf die Zustimmung als Rechtsgrundlage für die Verarbeitung Ihrer Informationen verlassen müssen und Ihr Land die Zustimmung eines Elternteils erfordert, benötigen wir möglicherweise die Zustimmung Ihres Elternteils, bevor wir diese Informationen erfassen und verwenden.\n\n',
      'ja':
          '当社のサービスは13歳未満の方を対象としておりません。当社は、13歳未満の方から個人を特定できる情報を故意に収集することはありません。お客様が親権者または保護者であり、お子様が当社に個人データを提供したことに気付いた場合は、当社までご連絡ください。当社が13歳未満の方から親権者の同意を確認せずに個人データを収集したことが判明した場合、当社は当該情報を当社のサーバーから削除するための措置を講じます。\n\nまた、当社は13歳から18歳までのユーザーに関する情報の一部について、収集、使用、および保管方法を制限する場合があります。この場合、当該ユーザーにはサービスの特定の機能を提供できなくなる可能性があります。\n\nお客様の情報を処理する法的根拠として同意を必要とする場合、かつお客様の居住国が親権者の同意を必要とする場合、当社は当該情報を収集および使用する前に、お客様の親権者の同意を求めることがあります。\n\n',
    },
    '926799io': {
      'en':
          'YOUR CALIFORNIA PRIVACY RIGHTS (CALIFORNIA BUSINESS AND PROFESSIONS CODE SECTION 22581)\n\n',
      'de':
          'IHRE DATENSCHUTZRECHTE IN KALIFORNIEN (Kaliforniens Geschäfts- und Berufsgesetzbuch, Abschnitt 22581)\n\n',
      'ja': 'カリフォルニア州のプライバシー権（カリフォルニア州ビジネス・職業法第22581条）\n\n',
    },
    '2yry8nux': {
      'en':
          'California Business and Professions Code section 22581 allow California residents under the age of 18 who are registered users of online sites, services or applications to request and obtain removal of content or information they have publicly posted.\n\n\nTo request removal of such data, and if you are a California resident, You can contact Us using the contact information provided below, and include the email address associated with Your account.\n\n\nBe aware that Your request does not guarantee complete or comprehensive removal of content or information posted online and that the law may not permit or require removal in certain circumstances.\n\n',
      'de':
          'Gemäß Abschnitt 22581 des California Business and Professions Code können in Kalifornien ansässige Personen unter 18 Jahren, die registrierte Benutzer von Online-Sites, -Diensten oder -Anwendungen sind, die Entfernung von Inhalten oder Informationen beantragen und erreichen, die sie öffentlich gepostet haben.\n\n\nUm die Entfernung solcher Daten zu beantragen, können Sie als Einwohner Kaliforniens uns über die unten angegebenen Kontaktinformationen erreichen und die mit Ihrem Konto verknüpfte E-Mail-Adresse angeben.\n\n\nBitte beachten Sie, dass Ihr Antrag keine vollständige oder umfassende Entfernung von online geposteten Inhalten oder Informationen garantiert und dass das Gesetz die Entfernung unter bestimmten Umständen nicht erlauben oder vorschreiben kann.\n\n',
      'ja':
          'カリフォルニア州事業職業法第22581条では、オンラインサイト、サービス、またはアプリケーションの登録ユーザーである18歳未満のカリフォルニア州居住者は、公開投稿したコンテンツまたは情報の削除を要求し、取得することができます。\n\nカリフォルニア州居住者が当該データの削除を要求される場合は、下記の連絡先情報を使用して当社までご連絡ください。その際、お客様のアカウントに登録されているメールアドレスをご記入ください。\n\nお客様の要求は、オンラインに投稿されたコンテンツまたは情報の完全または包括的な削除を保証するものではなく、また、特定の状況においては、法律により削除が許可または義務付けられない場合があることにご注意ください。\n\n',
    },
    'hp8gy5uc': {
      'en': 'LINKS TO OTHER WEBSITES\n\n',
      'de': 'LINKS ZU ANDEREN WEBSITES\n\n',
      'ja': '他のウェブサイトへのリンク\n\n',
    },
    'rg3174q6': {
      'en':
          'Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party’s site. We strongly advise You to review the Privacy Policy of every site You visit.\n\n\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\n\n',
      'de':
          'Unser Service kann Links zu anderen Websites enthalten, die nicht von uns betrieben werden. Wenn Sie auf einen Link eines Drittanbieters klicken, werden Sie auf die Website dieses Drittanbieters weitergeleitet. Wir empfehlen Ihnen dringend, die Datenschutzrichtlinien aller von Ihnen besuchten Websites zu lesen.\n\n\nWir haben keine Kontrolle über und übernehmen keine Verantwortung für den Inhalt, die Datenschutzrichtlinien oder -praktiken von Websites oder Diensten Dritter.\n\n',
      'ja':
          '当社のサービスには、当社が運営していない他のウェブサイトへのリンクが含まれている場合があります。第三者のリンクをクリックすると、当該第三者のサイトへ誘導されます。アクセスする各サイトのプライバシーポリシーをご確認いただくことを強くお勧めします。\n\n当社は、第三者のサイトまたはサービスのコンテンツ、プライバシーポリシー、または慣行について一切の管理権を有しておらず、一切の責任を負いません。\n\n',
    },
    'jtu7qlu2': {
      'en': 'CHANGES TO THIS PRIVACY POLICY\n\n',
      'de': 'ÄNDERUNGEN DIESER DATENSCHUTZERKLÄRUNG\n\n',
      'ja': 'このプライバシーポリシーの変更\n\n',
    },
    'qce0iq8d': {
      'en':
          'We may update our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the “Last updated” date at the top of this Privacy Policy.\n\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n\n',
      'de':
          'Wir können unsere Datenschutzrichtlinie von Zeit zu Zeit aktualisieren. Wir werden Sie über alle Änderungen informieren, indem wir die neue Datenschutzrichtlinie auf dieser Seite veröffentlichen.\n\n\nWir werden Sie per E-Mail und/oder durch einen deutlichen Hinweis auf unserem Service informieren, bevor die Änderung wirksam wird, und das Datum „Zuletzt aktualisiert“ oben in dieser Datenschutzrichtlinie aktualisieren.\n\n\nEs wird Ihnen empfohlen, diese Datenschutzrichtlinie regelmäßig auf Änderungen zu überprüfen. Änderungen an dieser Datenschutzrichtlinie werden wirksam, wenn sie auf dieser Seite veröffentlicht werden.\n\n',
      'ja':
          '当社は、プライバシーポリシーを随時更新することがあります。変更があった場合は、このページに新しいプライバシーポリシーを掲載することにより、お客様にお知らせいたします。\n\n変更が有効になる前に、メールまたは当社のサービス上で目立つようにお知らせし、本プライバシーポリシー上部の「最終更新日」を更新いたします。\n\n変更内容については、定期的に本プライバシーポリシーをご確認ください。本プライバシーポリシーの変更は、このページに掲載された時点から有効となります。\n\n',
    },
    '7rnu9mj3': {
      'en': 'CONTACT US\n\n',
      'de': 'KONTAKTIEREN SIE UNS\n\n',
      'ja': 'お問い合わせ\n\n',
    },
    'kn6struv': {
      'en':
          'If you have any questions about this Privacy Policy, You can contact us:\n\n\nBy email:',
      'de':
          'Wenn Sie Fragen zu dieser Datenschutzrichtlinie haben, können Sie uns kontaktieren:\n\n\nPer E-Mail:',
      'ja': '本プライバシーポリシーについてご質問がある場合は、下記までご連絡ください。\n\nメール：',
    },
    '5x963izp': {
      'en': ' info@hiit-the-beat.com',
      'de': 'info@hiit-the-beat.com',
      'ja': 'info@hiit-the-beat.com',
    },
    'jijfrnru': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // ImprintPage
  {
    'xprmaod8': {
      'en': 'Imprint',
      'de': 'Impressum',
      'ja': 'インプリント',
    },
    '4vlpojcb': {
      'en': 'Website\n',
      'de': 'Webseite\n',
      'ja': 'Webサイト\n',
    },
    'ksxzeehf': {
      'en': 'Email\n',
      'de': 'E-Mail\n',
      'ja': 'メール\n',
    },
    'bwendk48': {
      'en': 'Managed by\n',
      'de': 'Verwaltet von\n',
      'ja': '管理者\n',
    },
    'twz86pg6': {
      'en': 'Registered court\n',
      'de': 'Eingetragenes Gericht\n',
      'ja': '登録裁判所\n',
    },
    'ntrdw5yy': {
      'en': 'VAT Tax ID\n',
      'de': 'Umsatzsteuer-Identifikationsnummer\n',
      'ja': 'VAT納税者番号\n',
    },
    'h6zncems': {
      'en':
          'The content of these pages has been edited and controlled thoroughly. Breakletics® does not warrant for the topicality, correctness, completeness or quality of the provided information.\n\nClaims against Breakletics®, that relate to material or intellectual issues, that occurred through usage or non-usage of the provided information or the faulty and incomplete information, are excluded by any means, if no provable, intentional or negligent fault exists.\n\nBreakletics® reserves its rights to change parts, or the entire content of the webpage, to extend, to delete or to cancel the publication without prior notification.',
      'de':
          'Der Inhalt dieser Seiten wurde sorgfältig bearbeitet und kontrolliert. Breakletics® übernimmt keinerlei Gewähr für die Aktualität, Korrektheit, Vollständigkeit oder Qualität der bereitgestellten Informationen.\n\nAnsprüche gegen Breakletics®, die sich auf Schäden materieller oder ideeller Art beziehen, die durch die Nutzung oder Nichtnutzung der dargebotenen Informationen bzw. fehlerhafter und unvollständiger Informationen verursacht wurden, sind grundsätzlich ausgeschlossen, sofern kein nachweisbares, vorsätzliches oder grob fahrlässiges Verschulden vorliegt.\n\nBreakletics® behält sich das Recht vor, Teile der Seiten oder den gesamten Inhalt der Seite ohne vorherige Ankündigung zu verändern, zu ergänzen, zu löschen oder die Veröffentlichung einzustellen.',
      'ja':
          'これらのページの内容は徹底的に編集および管理されています。Breakletics®は、提供される情報の最新性、正確性、完全性、または品質について保証するものではありません。\n\n提供された情報の使用または不使用、あるいは不完全または不完全な情報に起因して発生した物質的または知的問題に関するBreakletics®への請求は、証明可能な故意または過失がない限り、いかなる理由においても排除されます。\n\nBreakletics®は、事前の通知なしに、ウェブページのコンテンツの一部または全体を変更、拡張、削除、または公開を中止する権利を留保します。',
    },
    'gh0xmelv': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // ProfilePage
  {
    'auupik7r': {
      'en': 'Plusmember',
      'de': 'PlusMember',
      'ja': 'Plusmember',
    },
    'tc938d2b': {
      'en': 'Edit profile',
      'de': 'Profil bearbeiten',
      'ja': 'プロフィールを編集',
    },
    'upquf72x': {
      'en': 'Sign Up',
      'de': 'Melden Sie sich an',
      'ja': 'サインアップ',
    },
    'g0sl24xg': {
      'en': 'Become a Plusmember',
      'de': 'Werde PlusMember',
      'ja': 'プラスメンバーになる',
    },
    'j5hob92h': {
      'en': 'Manage subscription',
      'de': 'Abonnement verwalten',
      'ja': 'サブスクリプションの管理',
    },
    'kauy94q7': {
      'en': 'HIIT the Beat Shop',
      'de': 'HIIT the Beat Shop',
      'ja': 'HIIT the Beat Shop',
    },
    'gcafpkr2': {
      'en': 'Style yourself for the most energized workout in the world',
      'de': 'Shoppe jetzt freshe Styles in unserem Shop',
      'ja': '世界で最もエネルギッシュなワークアウトのために自分をスタイリングしましょう',
    },
    'xhmag6ub': {
      'en': 'Watch the introductory video',
      'de': 'Schau dir das Einführungsvideo an',
      'ja': '紹介ビデオを見る',
    },
    'v600m13f': {
      'en': 'We’ll tell you more about the app',
      'de': 'Wir verraten dir mehr über die App',
      'ja': 'アプリについて詳しく説明します',
    },
    'hy77uyxj': {
      'en': 'Change email',
      'de': 'E-Mail ändern',
      'ja': 'メールアドレスを変更する',
    },
    'o52su2z8': {
      'en': 'Change password',
      'de': 'Kennwort ändern',
      'ja': 'パスワードを変更する',
    },
    'nh8ptgtb': {
      'en': 'Add phone number',
      'de': 'Handynummer hinzufügen',
      'ja': '電話番号を追加',
    },
    'qc2259v9': {
      'en': 'WhatsApp support',
      'de': 'WhatsApp support',
      'ja': '利用規約',
    },
    'hnmc6b5n': {
      'en': 'Terms & conditions',
      'de': 'Allgemeine Geschäftsbedingungen',
      'ja': '利用規約',
    },
    'qopf0y37': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinien',
      'ja': 'プライバシーポリシー',
    },
    '1rpkcydr': {
      'en': 'Imprint',
      'de': 'Impressum',
      'ja': 'インプリント',
    },
    'fi22gjpw': {
      'en': 'Rate Us',
      'de': 'Bewerten Sie uns',
      'ja': '評価してください',
    },
    'i1kbaueb': {
      'en': 'Admin Panel',
      'de': 'Admin Panel',
      'ja': 'Admin Panel',
    },
    'cjp0056j': {
      'en': 'Log out',
      'de': 'Abmelden',
      'ja': 'ログアウト',
    },
    'eqj9yd67': {
      'en': 'Follow us to dive deeper into our world and join our community!',
      'de':
          'Folge uns für noch mehr Motivation, Challenges und um unsere Community noch besser kennenzulernen',
      'ja': '私たちをフォローして、私たちの世界をもっと深く探検し、私たちのコミュニティに参加してください！',
    },
    'k60uavkn': {
      'en': 'Designed and developed by',
      'de': 'Entworfen und entwickelt von',
      'ja': '設計・開発：',
    },
    'oxm2sfzy': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // PasswordChangePage
  {
    'ztz0re8a': {
      'en': 'To change password we’ll send a link to your email ',
      'de': '',
      'ja': '',
    },
    '7x2848dd': {
      'en': 'To change password we’ll send a link to your email',
      'de':
          'Um Ihr Passwort zu ändern, senden wir Ihnen einen Link an Ihre E-Mail',
      'ja': 'パスワードを変更するには、メールにリンクを送信します',
    },
    '4lzai42k': {
      'en': 'Send link',
      'de': 'Link senden',
      'ja': 'リンクを送信',
    },
    'c86ezv2l': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // PasswordChangePage2
  {
    'l0kotbll': {
      'en': 'We sent the link to the ',
      'de': '',
      'ja': '',
    },
    'tw4mqvkb': {
      'en': 'We sent the link to the',
      'de': 'Wir haben den Link zum',
      'ja': 'リンクを送信しました',
    },
    'sv6lbbmf': {
      'en': 'Follow this link to recover your password',
      'de': 'Folgen Sie diesem Link, um Ihr Passwort zu ändern',
      'ja': 'パスワードを回復するには、このリンクをクリックしてください',
    },
    '5w8av4kw': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'o9ecc7qf': {
      'en': 'Resend',
      'de': 'Erneut senden',
      'ja': '再送信',
    },
    'amsuas9l': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // ProfileEditPage
  {
    'nqxtmtlw': {
      'en': 'Edit profile',
      'de': 'Profil bearbeiten',
      'ja': 'プロフィールを編集',
    },
    '8kodqpfs': {
      'en': 'Use PNG or JPG up to 5 MB',
      'de': 'Verwende PNG oder JPG bis zu 5 MB',
      'ja': '最大5MBのPNGまたはJPGを使用してください',
    },
    'ykfx9rrd': {
      'en': 'Name',
      'de': 'Name',
      'ja': '名前',
    },
    'y7c73v6l': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'iucaudhi': {
      'en': 'Fill in the field',
      'de': 'Füllen Sie das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    'z32b285m': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
      'ja': '最低2つのシンボル',
    },
    'go07m07e': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
      'ja': '最大50個のシンボル',
    },
    '9i11qttu': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'uw5rooxb': {
      'en': 'Surname',
      'de': 'Nachname',
      'ja': '姓',
    },
    'x94bsrmy': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '49xzdd9n': {
      'en': 'Goal',
      'de': 'Ziel',
      'ja': 'ゴール',
    },
    'xz3hzjuf': {
      'en': 'Date of birth',
      'de': 'Geburtsdatum',
      'ja': '生年月日',
    },
    'rf9zfcww': {
      'en': 'Weight (kg)',
      'de': 'Gewicht (kg)',
      'ja': '重量（kg）',
    },
    '3okxuvcp': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'd640scwx': {
      'en': 'Height (cm)',
      'de': 'Höhe (cm)',
      'ja': '高さ（cm）',
    },
    'g972tlhg': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '78w933u7': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
      'ja': '変更を保存',
    },
    'kg4rtnpu': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // StartPage
  {
    'i142h907': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
    'q8fakecu': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
      'ja': 'アカウントを削除しました',
    },
  },
  // AdditionalsPage
  {
    'q9dc63ht': {
      'en': 'Additionals',
      'de': 'Extras',
      'ja': '追加事項',
    },
    'mb2mr8pm': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // SeasonWorkoutPage
  {
    'lmxhteh0': {
      'en': 'Workout collections',
      'de': 'Workout Sammlung',
      'ja': 'ワークアウトコレクション',
    },
    'qw7pnzfy': {
      'en':
          'To enjoy the best experience, we recommend you to follow the order of the seasons',
      'de':
          'Für das beste Workout Erlebnis empfehlen wir dir, die Reihenfolge der Seasons einzuhalten',
      'ja': '最高の体験を楽しむには、季節の順番に従うことをお勧めします',
    },
    'yrqvaylo': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // SeasonPage
  {
    'mxpx9rzm': {
      'en': 'Workouts',
      'de': 'Workouts',
      'ja': 'Workouts',
    },
    '9r70ns32': {
      'en': 'Follow the order we suggest to enjoy the best experience',
      'de':
          'Befolge die von uns empfohlene Reihenfolge für das beste Workout Erlebnis',
      'ja': '最高の体験を楽しむために、私たちが提案する順序に従ってください',
    },
    'p9o02uno': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // WorkoutPage
  {
    'hfc9tug4': {
      'en': 'Workout',
      'de': 'Workout',
      'ja': 'Workout',
    },
    'ogo05fgc': {
      'en': 'We recommend to have at least 1 day rest. See you on ',
      'de':
          'Wir empfehlen dir mindestens einen Restday zwischen den HIIT Einheiten einzulegen. Wir sehen uns am ',
      'ja': '少なくとも1日は休むことをお勧めします。',
    },
    'xqkxpz10': {
      'en': 'Follow the order we suggest to enjoy the best experience',
      'de':
          'Befolge die von uns empfohlene Reihenfolge für das beste Workout Erlebnis',
      'ja': '最高の体験を楽しむために、私たちが提案する順序に従ってください',
    },
    'ttmquoe5': {
      'en':
          'Late to the party?  We’re still glad you’re here! Let´s HIIT some Beats',
      'de':
          'Zu spät zur Party?  Wir freuen uns immer noch, dass Sie hier sind! Lass es uns vernichten!',
      'ja': 'パーティーに遅れた？それでも来てくれて嬉しいよ！ビートを叩こう！',
    },
    'p53fx38i': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'hyj8qyc2': {
      'en': 'Warm Up',
      'de': 'Warm Up',
      'ja': 'Warm Up',
    },
    'q9ykafwt': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'd4zh2xau': {
      'en': 'Select one of ours or do you own',
      'de': 'Wähle dein warm up oder führe ein eigenes durch',
      'ja': '弊社の製品からお選びいただくか、ご自身で',
    },
    'ao6mwsco': {
      'en': 'Select one of ours',
      'de': 'Wähle dein Warm Up',
      'ja': '弊社の1つを選択してください',
    },
    'rfuq6jtu': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'dqu8vcqt': {
      'en': '2',
      'de': '2',
      'ja': '2',
    },
    '3woy2uip': {
      'en': 'Workout',
      'de': 'Dein Workout',
      'ja': '',
    },
    'kop4kqqr': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'ki4vgbte': {
      'en': 'Tap on the video to start',
      'de': 'Tippe auf das Video, um das Workout zu starten',
      'ja': 'ビデオをタップして開始します',
    },
    'bd3xpxi8': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'dxsm9yqn': {
      'en': '3',
      'de': '3',
      'ja': '3',
    },
    '5rwsp51x': {
      'en': 'Cool Down',
      'de': 'Cool Down',
      'ja': 'Cool Down',
    },
    'lr3dsez4': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'qqc0qxqz': {
      'en': 'Select one of ours or do you own',
      'de': 'Wähle ein Cool Down oder mache dein eigenes',
      'ja': '弊社の製品からお選びいただくか、ご自身で',
    },
    'kr5agtv7': {
      'en': 'Select one of ours',
      'de': 'Wähle dein Cool Down',
      'ja': '弊社の1つを選択してください',
    },
    'l4j7009c': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
    'pf7q4dog': {
      'en': 'Done. Collect your points.',
      'de': 'Done. Collect your points.',
      'ja': 'Finish workout',
    },
    '36253ub2': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAuth
  {
    'gn09rlzh': {
      'en': 'Log in',
      'de': 'Log in',
      'ja': 'Log in',
    },
    't1y0z9fy': {
      'en': 'Email',
      'de': 'Email',
      'ja': 'Email',
    },
    '9dqjy81q': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '89ryaonu': {
      'en': 'admin@gmail.com',
      'de': 'admin@gmail.com',
      'ja': 'admin@gmail.com',
    },
    'lite8bzu': {
      'en': 'Password',
      'de': 'Password',
      'ja': 'Password',
    },
    'tledtni8': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'ul82ygee': {
      'en': 'Log in',
      'de': 'Log in',
      'ja': 'Log in',
    },
    'ux2xiog2': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminUserManagement
  {
    'xvzqinso': {
      'en': 'users',
      'de': 'users',
      'ja': 'users',
    },
    'atu7e31q': {
      'en': 'Search by name & surname',
      'de': 'Search by name & surname',
      'ja': 'Search by name & surname',
    },
    '777taxqm': {
      'en': 'Export to Excel',
      'de': 'Export to Excel',
      'ja': 'Export to Excel',
    },
    '9k2mq9vi': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    '1z9ju4z5': {
      'en': 'Surname',
      'de': 'Surname',
      'ja': 'Surname',
    },
    'yj7dmpyo': {
      'en': 'Gender',
      'de': 'Gender',
      'ja': 'Gender',
    },
    '6lsi09wz': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'Email',
    },
    'ojqqej2c': {
      'en': 'Progress',
      'de': 'Progress',
      'ja': 'Progress',
    },
    '7x72k1pp': {
      'en': 'Date of birth',
      'de': 'Date of birth',
      'ja': 'Date of birth',
    },
    'n11ijf50': {
      'en': 'Weight (kg)',
      'de': 'Weight (kg)',
      'ja': 'Weight (kg)',
    },
    'volnyvvf': {
      'en': 'Height (cm)',
      'de': 'Height (cm)',
      'ja': 'Height (cm)',
    },
    '10c251t1': {
      'en': 'Status',
      'de': 'Status',
      'ja': 'Status',
    },
    'oko5ro7j': {
      'en': 'Active',
      'de': 'Active',
      'ja': 'Active',
    },
    'xcjzr0am': {
      'en': 'Blocked',
      'de': 'Blocked',
      'ja': 'Blocked',
    },
    'em51kq6q': {
      'en': 'Deleted',
      'de': 'Deleted',
      'ja': 'Deleted',
    },
    'be3znh29': {
      'en': 'Plusmember',
      'de': 'Plusmember',
      'ja': 'Plusmember',
    },
    'avlcdcx3': {
      'en': 'Yes',
      'de': 'Yes',
      'ja': 'Yes',
    },
    'j2z18xgk': {
      'en': 'No',
      'de': 'No',
      'ja': 'No',
    },
    'k7k9x8vg': {
      'en': ' ',
      'de': '',
      'ja': '',
    },
    'c0gjbjr9': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminSettings
  {
    'gelx7em1': {
      'en': 'Settings',
      'de': 'Settings',
      'ja': 'Settings',
    },
    'm03us9tr': {
      'en': 'Reset password',
      'de': 'Reset password',
      'ja': 'Reset password',
    },
    'xnsc4vlh': {
      'en': 'Change email',
      'de': 'Change email',
      'ja': 'Change email',
    },
    'gpyj365m': {
      'en': 'Email',
      'de': 'Email',
      'ja': 'Email',
    },
    'xqkc5ff4': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '2l2dyi4l': {
      'en': 'admin@gmail.com',
      'de': 'admin@gmail.com',
      'ja': 'admin@gmail.com',
    },
    'sjmi3yh8': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditPromo
  {
    'tv5ek6oa': {
      'en': 'Edit promocode',
      'de': 'Edit promocode',
      'ja': 'Edit promocode',
    },
    'ypng3kib': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'kbcfs0il': {
      'en': 'Text EN',
      'de': 'Text EN',
      'ja': 'Text EN',
    },
    'ovc8cvch': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '7nx3td4t': {
      'en': 'Text DE',
      'de': 'Text DE',
      'ja': 'Text DE',
    },
    '1y2r3znx': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'thztq5ja': {
      'en': 'Text JA',
      'de': 'Text JA',
      'ja': 'Text JA',
    },
    '9194h0mk': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'pr0wbgmi': {
      'en': 'Show',
      'de': 'Show',
      'ja': 'Show',
    },
    'pu38sslk': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminPromo
  {
    'rijazseg': {
      'en': 'Promocodes',
      'de': 'Promocodes',
      'ja': 'Promocodes',
    },
    'jakthcij': {
      'en': 'New promocode',
      'de': 'New promocode',
      'ja': 'New promocode',
    },
    '7h16sw6x': {
      'en': 'Show',
      'de': 'Show',
      'ja': 'Show',
    },
    'a4k75jhp': {
      'en': 'Hide',
      'de': 'Hide',
      'ja': 'Hide',
    },
    'dskyrldf': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAddPromo
  {
    '87zojueq': {
      'en': 'Add promocode',
      'de': 'Add promocode',
      'ja': 'Add promocode',
    },
    'qh84f4nm': {
      'en': 'Create',
      'de': 'Create',
      'ja': 'Create',
    },
    'jo23h4a1': {
      'en': 'Text EN',
      'de': 'Text EN',
      'ja': 'Text EN',
    },
    'z1fmsedl': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '14zti1gc': {
      'en': 'Become a Plusmember with a 30% discount until February 12',
      'de': 'Werden Sie Plusmitglied mit 30 % Rabatt bis zum 12. Februar',
      'ja': '2月12日まで30%割引でPlusmemberになりましょう',
    },
    '3ljsfn3c': {
      'en': 'Text DE',
      'de': 'Text DE',
      'ja': 'Text DE',
    },
    '0uncxkv7': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'p20o3tu6': {
      'en':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. Februar 30 % Rabatt',
      'de':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. Februar 30 % Rabatt',
      'ja':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. 2 月 30 % ラバット',
    },
    '0b7o59ko': {
      'en': 'Text JA',
      'de': 'Text JA',
      'ja': 'Text JA',
    },
    'silgb3i5': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'ckovh7cb': {
      'en': '2月12日まで30%割引でPlusmemberになりましょう',
      'de': '2 bis 12 Monate, 30 % Rabatt, Plus-Mitglied, Mitglied',
      'ja': '2月12日まで30%割引でプラス会員になりましょう',
    },
    'quw9mgbq': {
      'en': 'Show',
      'de': 'Show',
      'ja': 'Show',
    },
    'mbnx66oq': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAdditional
  {
    '77s5yanw': {
      'en': 'Warm Ups & Cool Downs',
      'de': 'Warm Ups & Cool Downs',
      'ja': 'Warm Ups & Cool Downs',
    },
    'b3bc79im': {
      'en': 'New Warm Up',
      'de': 'New Warm Up',
      'ja': 'New Warm Up',
    },
    '1lsyn0sh': {
      'en': 'New Cool Down',
      'de': 'New Cool Down',
      'ja': 'New Cool Down',
    },
    'u4h5hqqi': {
      'en': 'views',
      'de': 'views',
      'ja': 'views',
    },
    '81xjo9ig': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    '7hr4cdd9': {
      'en': 'Paid',
      'de': 'Paid',
      'ja': 'Paid',
    },
    '77uu1dze': {
      'en': ' ',
      'de': '',
      'ja': '',
    },
    'rc2idfec': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditAddit
  {
    'm6yc3x9u': {
      'en': 'Edit Warm Up',
      'de': 'Edit Warm Up',
      'ja': 'Edit Warm Up',
    },
    'x56bdoay': {
      'en': 'Edit Cool Down',
      'de': 'Edit Cool Down',
      'ja': 'Edit Cool Down',
    },
    'mjuo4hff': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'vzcz955w': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    'icuo94p4': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'nbomdko0': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'p2v8ys5r': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'os1fl8o8': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    '4p5i2j45': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    '5ha3oeng': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'xvkbsivg': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    'rpn26dj9': {
      'en': 'Warm Up name EN',
      'de': 'Warm Up Name EN',
      'ja': 'Warm Up name EN',
    },
    'ujuuc49j': {
      'en': 'Cool Down name EN',
      'de': 'Cool Down Name EN',
      'ja': 'Cool Down name EN',
    },
    'iopg5y0r': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'rooiquma': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
      'ja': 'Duration EN',
    },
    'ekhzzmcu': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '6b3x66z6': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'yg4k3iuz': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
      'ja': 'Upload cover',
    },
    'iphpxtkk': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    '3txeb9yy': {
      'en': 'Upload video EN',
      'de': 'Video hochladen EN',
      'ja': 'Upload video EN',
    },
    'zewgx4pi': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    'h3bfi1u0': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'buxs1gtl': {
      'en': 'Warm Up name DE',
      'de': 'Warm Up Name DE',
      'ja': 'Warm Up name DE',
    },
    'l1tnymiw': {
      'en': 'Cool Down name DE',
      'de': 'Cool Down Name DE',
      'ja': 'Cool Down name DE',
    },
    'txfsz5ie': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'yzha7pd1': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
      'ja': 'Duration DE',
    },
    'g2n637xm': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'it2w9cud': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'm6hmj6r0': {
      'en': 'Upload video DE',
      'de': 'Video hochladen DE',
      'ja': 'Upload video DE',
    },
    '96iib9v7': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
      'ja': 'Delete video DE',
    },
    'pm4hx6ac': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    'plsn6h94': {
      'en': 'Warm Up name JA',
      'de': 'Warm Up Name JA',
      'ja': 'Warm Up name JA',
    },
    '3afobnnp': {
      'en': 'Cool Down name JA',
      'de': 'Cool Down Name JA',
      'ja': 'Cool Down name JA',
    },
    'aenpm76x': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'buv1t7go': {
      'en': 'Duration JA',
      'de': 'Dauer JA',
      'ja': 'Duration JA',
    },
    'xq4csctn': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'auz860eu': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'e73g4t0a': {
      'en': 'Upload video JA',
      'de': 'Video hochladen JA',
      'ja': 'Upload video JA',
    },
    '055n2pxm': {
      'en': 'Delete video JA',
      'de': 'Delete video JA',
      'ja': 'Delete video JA',
    },
    'z8jiukxm': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAddAddit
  {
    'li9ykin1': {
      'en': 'New Warm Up',
      'de': 'New Warm Up',
      'ja': 'New Warm Up',
    },
    'bnap8t8j': {
      'en': 'New Cool Down',
      'de': 'New Cool Down',
      'ja': 'New Cool Down',
    },
    'w04vo6u2': {
      'en': 'Create',
      'de': 'Create',
      'ja': 'Create',
    },
    'djr3s131': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    '0thtr2yr': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'orwvo7p5': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'hv8l6mpj': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'tlrj54oa': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    'dv4szfnm': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'lngt1mdz': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    '5ds441xf': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    '3ox0pfj1': {
      'en': 'Warm Up name EN',
      'de': 'Warm Up Name EN',
      'ja': 'Warm Up name EN',
    },
    'ux9s1e27': {
      'en': 'Cool Down name EN',
      'de': 'Cool Down Name EN',
      'ja': 'Cool Down name EN',
    },
    's9vjt5vy': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'zxp2yfi8': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'rpqg5xl8': {
      'en': 'Duration EN',
      'de': 'Duration EN',
      'ja': 'Duration EN',
    },
    'jw4o1qmf': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'lmw4ktlq': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'ac5s54mj': {
      'en': '1 min',
      'de': '1 min',
      'ja': '1 min',
    },
    'zafvdsdb': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    '6345i1ub': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'kekx3mro': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
      'ja': 'Upload video EN',
    },
    'b46xusac': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    'ts9sj1ff': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'cb5t91aq': {
      'en': 'Warm Up name DE',
      'de': 'Warm Up Name DE',
      'ja': 'Warm Up name DE',
    },
    'y5eyacjj': {
      'en': 'Cool Down name DE',
      'de': 'Cool Down Name DE',
      'ja': 'Cool Down name DE',
    },
    'pe9822o8': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '9u69s762': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'k2vvj2up': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
      'ja': 'Duration DE',
    },
    '4uf1prvi': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '3gso6ivg': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'yaaty63b': {
      'en': '1 min',
      'de': '1 min',
      'ja': '1 min',
    },
    'vxeviion': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
      'ja': 'Upload video DE',
    },
    '5qdwhnhr': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
      'ja': 'Delete video DE',
    },
    'xou4ors3': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    'b13ni2l3': {
      'en': 'Warm Up name JA',
      'de': 'Warm Up Name JA',
      'ja': 'Warm Up name JA',
    },
    'm6y8kqst': {
      'en': 'Cool Down name JA',
      'de': 'Cool Down Name JA',
      'ja': 'Cool Down name JA',
    },
    '4aigawtw': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'n1cesbh8': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'qu0l12l1': {
      'en': 'Duration JA',
      'de': 'Duration JA',
      'ja': 'Duration JA',
    },
    '36h0tn6i': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '4ys12742': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'g324p8h0': {
      'en': '1 min',
      'de': '1 min',
      'ja': '1 min',
    },
    'zejzi7sr': {
      'en': 'Upload video JA',
      'de': 'Upload video JA',
      'ja': 'Upload video JA',
    },
    '08qhg6q7': {
      'en': 'Delete video JA',
      'de': 'Delete video JA',
      'ja': 'Delete video JA',
    },
    'u9wb8snz': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditUser
  {
    'djmkap3s': {
      'en': 'Edit user',
      'de': 'Edit user',
      'ja': 'Edit user',
    },
    'cw1eq8zs': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    '06fu407h': {
      'en': 'Use PNG or JPG up to 5 MB',
      'de': 'Use PNG or JPG up to 5 MB',
      'ja': 'Use PNG or JPG up to 5 MB',
    },
    '0nhdh5os': {
      'en': 'Email',
      'de': 'E-Mail',
      'ja': 'Email',
    },
    'lxsulzdu': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'ihzrzw6u': {
      'en': 'Fill in the field',
      'de': 'Füllen Sie das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    'ihrmznn5': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
      'ja': '最低2つのシンボル',
    },
    'nxgh7h6z': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
      'ja': '最大50個のシンボル',
    },
    'sc5nthlx': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'syd19zuu': {
      'en': 'Plusmember',
      'de': 'PlusMember',
      'ja': 'Plusmember',
    },
    'wbxrsh6z': {
      'en': 'Restore purchase',
      'de': 'Restore purchase',
      'ja': 'Restore purchase',
    },
    'j6da4yxq': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'bmd9qp9g': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '26r6h9y9': {
      'en': 'Fill in the field',
      'de': 'Füllen Sie das Feld aus',
      'ja': 'フィールドに入力してください',
    },
    '4pnvphai': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
      'ja': '最低2つのシンボル',
    },
    'mrakndqv': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
      'ja': '最大50個のシンボル',
    },
    'ctrhe5r4': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'glxe2hyt': {
      'en': 'Surname',
      'de': 'Surname',
      'ja': 'Surname',
    },
    '5w91srr5': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'zb3jw32y': {
      'en': 'Goal',
      'de': 'Goal',
      'ja': 'Goal',
    },
    '3f2jqkll': {
      'en': 'Date of birth',
      'de': 'Date of birth',
      'ja': 'Date of birth',
    },
    '5hekzlcm': {
      'en': 'Weight (kg)',
      'de': 'Weight (kg)',
      'ja': 'Weight (kg)',
    },
    'j9xnxx2w': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '4febrar1': {
      'en': 'Height (cm)',
      'de': 'Height (cm)',
      'ja': 'Height (cm)',
    },
    'y99d0n0l': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'q7f4xm8e': {
      'en': 'App language',
      'de': 'App language',
      'ja': 'App language',
    },
    'zsyq9u05': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'b2onetjc': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    '4ulwfqhb': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'ybyv6f40': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminZoom
  {
    'wgzytisv': {
      'en': 'Zoom Jam',
      'de': 'Zoom Jam',
      'ja': 'Zoom Jam',
    },
    'y3v0hxrm': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'aegv7keg': {
      'en': 'Jam 1',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'yl3w1g6a': {
      'en': 'Name EN',
      'de': 'Zoom Jam Name EN',
      'ja': 'Zoom Jam name EN',
    },
    '8rvg5ybd': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '4r3l46uk': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    '3swidtvu': {
      'en': 'Name DE',
      'de': 'Zoom Jam-Name DE',
      'ja': 'Zoom Jam name DE',
    },
    'lh4w0cfu': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '79jx7e6f': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    '85oiwltk': {
      'en': 'Name JA',
      'de': 'Zoom Jam Name JA',
      'ja': 'Zoom Jam name JA',
    },
    'q6g576l5': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '1arvbhqr': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'a5w1d81h': {
      'en': 'Description EN',
      'de': 'Description EN',
      'ja': 'Description EN',
    },
    'ob5m78us': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '8ls09u15': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    'd6atjeeo': {
      'en': 'Description DE',
      'de': 'Description DE',
      'ja': 'Description DE',
    },
    'n75j5osl': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '9wra1ysb': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    'yj4qq2yb': {
      'en': 'Description JA',
      'de': 'Beschreibung JA',
      'ja': 'Description JA',
    },
    '2in2lsrr': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'enmyxj7t': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    'uc9eltgi': {
      'en': 'Date',
      'de': 'Date',
      'ja': 'Date',
    },
    'x1isenlq': {
      'en': 'Time',
      'de': 'Time',
      'ja': 'Time',
    },
    '8odpdrnd': {
      'en': 'Link to session',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'lyewylh9': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'l2szihcm': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    's1sc2n0g': {
      'en': 'Trainer avatar',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'pkqf4fb6': {
      'en': 'Upload avatar',
      'de': 'Upload avatar',
      'ja': 'Upload avatar',
    },
    'nrhcemnm': {
      'en': 'Upload the avatar first, then save jams changes',
      'de': '',
      'ja': '',
    },
    'cvebvnap': {
      'en': 'Trainer name and surname',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'zptku4sy': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'id30p3by': {
      'en': 'Name and surname',
      'de': 'Description',
      'ja': 'Description',
    },
    'oo8oxq93': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'b2aqq3ce': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    'cs4zb2gs': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
    'sh12z5ec': {
      'en': 'Jam 2',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'echkyzdq': {
      'en': 'Name EN',
      'de': 'Zoom Jam Name EN',
      'ja': 'Zoom Jam name EN',
    },
    '2sag90ez': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '54ap0e2i': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'efpwbsc4': {
      'en': 'Name DE',
      'de': 'Zoom Jam-Name DE',
      'ja': 'Zoom Jam name DE',
    },
    'aaynyvoq': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '31v78i3n': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    '09u6h6bm': {
      'en': 'Name JA',
      'de': 'Zoom Jam Name JA',
      'ja': 'Zoom Jam name JA',
    },
    'o43wjei8': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'vpulbie3': {
      'en': 'Name',
      'de': 'Name',
      'ja': 'Name',
    },
    'xtyxe2io': {
      'en': 'Description EN',
      'de': 'Description EN',
      'ja': 'Description EN',
    },
    'sip1enza': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'nopy30c9': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    '0o0eolwa': {
      'en': 'Description DE',
      'de': 'Description DE',
      'ja': 'Description DE',
    },
    'elq8pasm': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'ady6s7iv': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    'uuv91acw': {
      'en': 'Description JA',
      'de': 'Beschreibung JA',
      'ja': 'Description JA',
    },
    'nau1mmqd': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'b7bypxls': {
      'en': 'Description',
      'de': 'Description',
      'ja': 'Description',
    },
    'f3ulybq3': {
      'en': 'Date',
      'de': 'Date',
      'ja': 'Date',
    },
    'ovjfs86b': {
      'en': 'Time',
      'de': 'Time',
      'ja': 'Time',
    },
    'vqzay4h7': {
      'en': 'Link to session',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'bm0izpi1': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'mwcahoc0': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    '96r5e4hf': {
      'en': 'Trainer avatar',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'w8ci1trv': {
      'en': 'Upload avatar',
      'de': 'Upload avatar',
      'ja': 'Upload avatar',
    },
    'cf6p24tj': {
      'en': 'Upload the avatar first, then save jams changes',
      'de': '',
      'ja': '',
    },
    'qqbub16f': {
      'en': 'Trainer name and surname',
      'de': 'Link to session',
      'ja': 'Link to session',
    },
    'cnope3ue': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'vp7lbkib': {
      'en': 'Name and surname',
      'de': 'Description',
      'ja': 'Description',
    },
    'bnihfvul': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    '7bxi498l': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminSeasons
  {
    'oig7j28e': {
      'en': 'Seasons & workouts',
      'de': 'Seasons & workouts',
      'ja': 'Seasons & workouts',
    },
    'qux2atbf': {
      'en': 'New season',
      'de': 'Neue season',
      'ja': 'New season',
    },
    '3hh3whgq': {
      'en': 'EN | DE | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    'm70gaz01': {
      'en': 'DE | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    'o9jhutuh': {
      'en': 'EN  | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    'a9lixe3f': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'qgcmpmal': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    'mkyg9u4r': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'uq0p7izl': {
      'en': 'workouts',
      'de': 'workouts',
      'ja': 'workouts',
    },
    'y0oz02a2': {
      'en': ' ~ ',
      'de': ' ~ ',
      'ja': ' ~ ',
    },
    'gm62aabq': {
      'en': 'people passed',
      'de': 'people passed',
      'ja': 'people passed',
    },
    'svfbnltw': {
      'en': ' ',
      'de': ' ',
      'ja': '',
    },
    'tj8mt6ob': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminWorkouts
  {
    'yq3mgv9i': {
      'en': 'New workout',
      'de': 'New workout',
      'ja': 'New workout',
    },
    'f693yg8l': {
      'en': 'Workouts',
      'de': 'Workouts',
      'ja': 'Workouts',
    },
    '2d5gapne': {
      'en': ' ~ ',
      'de': ' ~ ',
      'ja': ' ~ ',
    },
    'o89bixfq': {
      'en': 'people passed',
      'de': 'people passed',
      'ja': 'people passed',
    },
    'ox50xj9k': {
      'en': 'people passed',
      'de': 'people passed',
      'ja': 'people passed',
    },
    'blbflywh': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'lic07eyj': {
      'en': 'Paid',
      'de': 'Paid',
      'ja': 'Paid',
    },
    'wnw7iud9': {
      'en': ' ',
      'de': '',
      'ja': '',
    },
    'zw5ilffg': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditSeason
  {
    'o3h7483w': {
      'en': 'Edit season',
      'de': 'Edit season',
      'ja': 'Edit season',
    },
    'r23rfb42': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'phohmz0u': {
      'en': 'Season number',
      'de': 'Season number',
      'ja': 'Season number',
    },
    'fv8vpunc': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'wczng33r': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'u2v0svud': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'jq96hkb7': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    'drrrh7gc': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'vb520c0e': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    'b97itzb4': {
      'en': 'Season name DE',
      'de': 'Season name DE',
      'ja': 'Season name DE',
    },
    '8u8rnyyf': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '8o6brksg': {
      'en': 'Duration EN',
      'de': 'Duration EN',
      'ja': 'Duration EN',
    },
    'ndei1q31': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'fk4odnpj': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    '87nfb7h8': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    'cug7xyn1': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'tc1iuqq8': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'm0z1vm62': {
      'en': 'Season name EN',
      'de': 'Season Name EN',
      'ja': 'Season name EN',
    },
    '89wtibli': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'uczseu0v': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
      'ja': 'Duration DE',
    },
    '0owrmr0a': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'i43ohrcu': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'dbnkxrz6': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    '5hcne29q': {
      'en': 'Season name JA',
      'de': 'Season Name JA',
      'ja': 'Season name JA',
    },
    '1oblnz52': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '98x49ohh': {
      'en': 'Duration JA',
      'de': 'Duration JA',
      'ja': 'Duration JA',
    },
    '2k7p1abu': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'rr5rkqvt': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'pqj967bp': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAddSeason
  {
    'lwhe8eil': {
      'en': 'New season',
      'de': 'New season',
      'ja': 'New season',
    },
    'axef6432': {
      'en': 'Create',
      'de': 'Create',
      'ja': 'Create',
    },
    'lbcfzno6': {
      'en': 'Season number',
      'de': 'Season number',
      'ja': 'Season number',
    },
    'izabwybn': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'mvin63z3': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'dhew6hn9': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'qaj5c6j6': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'k3621yid': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'hmw34450': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    '5acob4wv': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'hdp91dxr': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    'w0kn9dxz': {
      'en': 'Season name DE',
      'de': 'Season Name DE',
      'ja': 'Season name DE',
    },
    'kt4ivcf7': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '2wam3zle': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
      'ja': 'Duration EN',
    },
    'bf8wp1ak': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'q0ryofdv': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    '5mgmgq5j': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    'nzz20wyk': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    'hou6oc7l': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'n25i3mug': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'o6h5ahhk': {
      'en': 'Season name DE',
      'de': 'Season Name DE',
      'ja': 'Season name DE',
    },
    'ix0pynut': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'stbkn4a9': {
      'en': 'Duration DE',
      'de': 'Duration DE',
      'ja': 'Duration DE',
    },
    'zqn9ghwl': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'tzs9gboe': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    '0yybkt0n': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    'qr04xc3p': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    '5xf5dz1j': {
      'en': 'Season name JA',
      'de': 'Season Name EN',
      'ja': 'Season name EN',
    },
    '1oogerfo': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '1k9rg78j': {
      'en': 'Duration JA',
      'de': 'Duration JA',
      'ja': 'Duration JA',
    },
    'z4tamjta': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '3zwop7u4': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'oj624pgw': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    'fhw14264': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditWorkout
  {
    'o0ah9de5': {
      'en': 'Edit workout',
      'de': 'Edit workout',
      'ja': 'Edit workout',
    },
    '5vnaauls': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'not633da': {
      'en': 'Season name',
      'de': 'Season Name',
      'ja': 'Season name',
    },
    'qm9i9lzs': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'ekv5390o': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    'rdja5srr': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '11pfe10u': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'kuaoaku7': {
      'en': 'Points',
      'de': 'Points',
      'ja': 'Points',
    },
    'nm9rq9ju': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'zcxo8lr6': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'a3q6jqxa': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'yyvhcbie': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    'aa5q15ix': {
      'en': 'Workout name EN',
      'de': 'Workout Name EN',
      'ja': 'Workout name EN',
    },
    '8cbqlxta': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'c6jt6mbj': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
      'ja': 'Duration EN',
    },
    'scixkvvi': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'u6gx11y4': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    '2tjvv4xt': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    '0jbca4rk': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    '11s60ttn': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
      'ja': 'Upload video EN',
    },
    't2rt72vg': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    '3xonbgyj': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'tbuz2eja': {
      'en': 'Workout name DE',
      'de': 'Workout Name DE',
      'ja': 'Workout name DE',
    },
    'oyt2xafo': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'rrckpujg': {
      'en': 'Duration DE',
      'de': 'Duration DE',
      'ja': 'Duration DE',
    },
    'j6mkuqyr': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '0khc2sss': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'aswd0l0w': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
      'ja': 'Upload video DE',
    },
    'pcrnqbsm': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
    'rxs6o2xr': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    '16wstbhu': {
      'en': 'Workout name JA',
      'de': 'Workout Name JA',
      'ja': 'Workout name JA',
    },
    '3mlt62lq': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'mptvuuf1': {
      'en': 'Duration JA',
      'de': 'Duration JA',
      'ja': 'Duration JA',
    },
    'b8sz4sad': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'vmvt67xc': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'ie8mk12d': {
      'en': 'Upload video JA',
      'de': 'Upload video JA',
      'ja': 'Upload video JA',
    },
    'vmsmc2jd': {
      'en': 'Delete',
      'de': 'Delet',
      'ja': 'Delet',
    },
    '93a3eob5': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAddWorkout
  {
    'ywtiqc9h': {
      'en': 'New workout',
      'de': 'New workout',
      'ja': 'New workout',
    },
    'o426dww0': {
      'en': 'Create',
      'de': 'Create',
      'ja': 'Create',
    },
    'nbjxn7tv': {
      'en': 'Season name',
      'de': 'Season Name',
      'ja': 'Season name',
    },
    'srk0r6gj': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'of1gw5qd': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    'xliegfd8': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'e938m8da': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'mhhur7vz': {
      'en': 'Points',
      'de': 'Points',
      'ja': 'Points',
    },
    'jzzv72lh': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '3ykb6x2d': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'w325g05e': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'egk94yj6': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
    'wf8lkekp': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    'q139n58w': {
      'en': 'Workout name EN',
      'de': 'Workout Name EN',
      'ja': 'Workout name EN',
    },
    '2e6151mc': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'jqrenqge': {
      'en': 'Duration EN',
      'de': 'Duration EN',
      'ja': 'Duration EN',
    },
    'cbpz9n4x': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'eydck96e': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'm7gznb8r': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    'ibr6zyfs': {
      'en': 'Upload cover',
      'de': 'Upload cover',
      'ja': 'Upload cover',
    },
    'rkvc9s49': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'cxf2viyu': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
      'ja': 'Upload video EN',
    },
    '89nuuxts': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    '3rmfdnl2': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'doiy32c3': {
      'en': 'Workout name DE',
      'de': 'Workout Name DE',
      'ja': 'Workout name DE',
    },
    'o77330op': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '0fex45fb': {
      'en': 'Duration DE',
      'de': 'Duration DE',
      'ja': 'Duration DE',
    },
    'f9gd87wk': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'itqj6ne0': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'pdn17sk1': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    '8q3ky5s4': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
      'ja': 'Upload video DE',
    },
    'eb76qwg4': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
      'ja': 'Delete video DE',
    },
    'ezb2bn8a': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    'w5dodv91': {
      'en': 'Workout name JA',
      'de': 'Workout Name JA',
      'ja': 'Workout name JA',
    },
    'n25tjp4h': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '25313nbh': {
      'en': 'Duration JA',
      'de': 'Duration JA',
      'ja': 'Duration JA',
    },
    '1cb9mbyb': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '6x3ly9gr': {
      'en': '0',
      'de': '0',
      'ja': '0',
    },
    'm01a437i': {
      'en': '1 week',
      'de': '1 Woche',
      'ja': '1週間',
    },
    'tfj03qb0': {
      'en': 'Upload video JA',
      'de': 'Upload video JA',
      'ja': 'Upload video JA',
    },
    'wyj7ngd5': {
      'en': 'Delete video JA',
      'de': 'Delete video JA',
      'ja': 'Delete video JA',
    },
    'z8yo1ssl': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // SubscriptionPage
  {
    'px4yi7gk': {
      'en': 'Choose your plan',
      'de': 'Wähle dein Paket',
      'ja': 'プランを選択してください',
    },
    'e7bvr8te': {
      'en': 'Manage subscription',
      'de': 'Abonnement verwalten',
      'ja': 'サブスクリプションの管理',
    },
    'tqv5js2f': {
      'en': 'GET 3 MONTHS FREE!',
      'de': 'SICHERE DIR 3 MONATE KOSTENLOS!',
      'ja': '3か月間無料！',
    },
    '7tbrnflb': {
      'en': 'Chosen by 76% of members',
      'de': '76 % der Nutzer bleiben langfristig dabei ',
      'ja': 'ユーザーの 76% が長期的な成果を約束します。今すぐ参加しましょう!',
    },
    '4162cpea': {
      'en': 'Save ',
      'de': 'Spare ',
      'ja': 'Save ',
    },
    'z2eqm1ek': {
      'en': ' vs. monthly plan',
      'de': ' vs. Monatsabo',
      'ja': ' vs. monthly plan',
    },
    'zh3v58jr': {
      'en': 'Only \$2.90 / week',
      'de': '2,90 \$ pro Woche ',
      'ja': '週 2.9 ドル - コーヒー 1 杯の代わりに!',
    },
    'lsj38x1a': {
      'en': 'Only ',
      'de': '',
      'ja': '',
    },
    '407ojiig': {
      'en': ' / week',
      'de': ' pro Woche',
      'ja': '',
    },
    '3j0q74op': {
      'en': 'Only \$2.90 / week',
      'de': '2,90 \$ pro Woche ',
      'ja': '週 2.9 ドル - コーヒー 1 杯の代わりに!',
    },
    'k7zxnajl': {
      'en': ' / week',
      'de': ' pro Woche',
      'ja': '',
    },
    'm345soo5': {
      'en': '\$4.25 / week',
      'de': '4,25 \$ / Woche',
      'ja': '最大限の柔軟性 - いつでもキャンセル可能',
    },
    'v9zneb3z': {
      'en': 'Try free for 7 days. Cancel anytime. No charge',
      'de': '',
      'ja': '',
    },
    'hivpj2fq': {
      'en':
          '. Cancel anytime during the trial – no charges. By subscribing, you agree to our',
      'de':
          '. Während der Testphase jederzeit kündbar – keine Kosten. Mit dem Abonnement stimmst du unseren zu ',
      'ja': ' （年間請求、125ドル前払い）。いつでもキャンセルできます！「7日間無料トライアルを開始」をタップすると、 ',
    },
    'e3lyamf9': {
      'en': ' Privacy policy',
      'de': ' Datenschutzrichtlinien',
      'ja': 'プライバシーポリシー',
    },
    'tn4ewelj': {
      'en': ' and ',
      'de': ' und ',
      'ja': ' と ',
    },
    'lp2f9po6': {
      'en': 'Terms of Use',
      'de': 'Nutzungsbedingungen',
      'ja': '利用規約',
    },
    'gc2akpkc': {
      'en': 'Restore purchase',
      'de': 'Kauf wiederherstellen',
      'ja': '購入を復元する',
    },
    'aemzehtp': {
      'en': 'Cancel current subscription',
      'de': 'Aktuelles Abonnement kündigen',
      'ja': '現在のサブスクリプションをキャンセルする',
    },
    'ln2dlir2': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // videoPage
  {
    'kyhh86y5': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'vx0s9zbp': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    'n316oec6': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    'd64jz0xv': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminBanners
  {
    '65e2esxz': {
      'en': 'Home page banner',
      'de': 'Homepage-Banner',
      'ja': 'Home page banner',
    },
    'uel6b6ol': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    'fo6o0a4h': {
      'en': '+ Create new banner',
      'de': '+ Create new banner',
      'ja': '+ Create new banner',
    },
    'de5q31ap': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminAddBanner
  {
    'kd55g6ls': {
      'en': 'New banner',
      'de': 'New banner',
      'ja': 'New banner',
    },
    'ak9xollk': {
      'en': 'Create',
      'de': 'Create',
      'ja': 'Create',
    },
    '2lfz2kwx': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    'kn922s2n': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '90646c50': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    'm2dl3nl7': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    '0c8phvum': {
      'en': 'Link URL EN',
      'de': 'Link URL EN',
      'ja': 'Link URL EN',
    },
    'wm6jgm93': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'psflaza3': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    's7ug010d': {
      'en': 'Upload cover EN',
      'de': 'Upload cover EN',
      'ja': 'Upload cover EN',
    },
    'bkvglwta': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'm9mhf18c': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
      'ja': 'Upload video EN',
    },
    'unj4zjc6': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    'n45gl6kd': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'anlecwot': {
      'en': 'Link URL DE',
      'de': 'Link URL DE',
      'ja': 'Link URL DE',
    },
    'f5gexflx': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'yl6fphvo': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    'pqj9tpuh': {
      'en': 'Upload cover DE',
      'de': 'Upload cover DE',
      'ja': 'Upload cover DE',
    },
    '3qcrq5a0': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'j801cl1v': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
      'ja': 'Upload video DE',
    },
    'wkcdvh91': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
      'ja': 'Delete video DE',
    },
    'vdser2u3': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    'u2201e1x': {
      'en': 'Link URL JA',
      'de': 'Link URL JA',
      'ja': 'Link URL JA',
    },
    '62yvdg41': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'v6ovhs9j': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    'fqb1iymg': {
      'en': 'Upload cover JA',
      'de': 'Upload cover JA',
      'ja': 'Upload cover JA',
    },
    'v7dehrr9': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'd5a2khq4': {
      'en': 'Upload video JA',
      'de': 'Upload video JA',
      'ja': 'Upload video JA',
    },
    '92mh9q4c': {
      'en': 'Delete video JA',
      'de': 'Delete video JA',
      'ja': 'Delete video JA',
    },
    'hltdbq2w': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // AdminEditBanner
  {
    'tbc56l0c': {
      'en': 'Edit banner',
      'de': 'Edit banner',
      'ja': 'Edit banner',
    },
    'v873e4x6': {
      'en': 'Save changes',
      'de': 'Save changes',
      'ja': 'Save changes',
    },
    'b4ax7yqy': {
      'en': 'Index',
      'de': 'Index',
      'ja': 'Index',
    },
    'jcqu4e0t': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'dw28cpj1': {
      'en': '1',
      'de': '1',
      'ja': '1',
    },
    '17cokrlt': {
      'en': 'English',
      'de': 'English',
      'ja': 'English',
    },
    '0a42mak6': {
      'en': 'Link URL EN',
      'de': 'Link URL EN',
      'ja': 'Link URL EN',
    },
    'ms5b2eor': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'v7od6pxa': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    'ti8l8o0q': {
      'en': 'Upload cover EN',
      'de': 'Upload cover EN',
      'ja': 'Upload cover EN',
    },
    'wkh3l298': {
      'en': 'Delete cover',
      'de': 'Delete cover',
      'ja': 'Delete cover',
    },
    'qn55hb3u': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
      'ja': 'Upload video EN',
    },
    '1x017nqc': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
      'ja': 'Delete video EN',
    },
    '7y58albq': {
      'en': 'German',
      'de': 'German',
      'ja': 'German',
    },
    'qma3h2kz': {
      'en': 'Link URL DE',
      'de': 'Link URL DE',
      'ja': 'Link URL DE',
    },
    'kgflhwlv': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '2uxu2y73': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    'uwjv83m3': {
      'en': 'Upload cover DE',
      'de': 'Upload cover DE',
      'ja': 'Upload cover DE',
    },
    'i5u63oi1': {
      'en': 'Delete cover DE',
      'de': 'Delete cover DE',
      'ja': 'Delete cover DE',
    },
    'rv0qyxy5': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
      'ja': 'Upload video DE',
    },
    'c0rxnz70': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
      'ja': 'Delete video DE',
    },
    '584h7c5g': {
      'en': 'Japanese',
      'de': 'Japanese',
      'ja': 'Japanese',
    },
    '7sypgx6a': {
      'en': 'Link URL JA',
      'de': 'Link URL JA',
      'ja': 'Link URL JA',
    },
    'vkzc4fde': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'mae8p0ex': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
      'ja': 'https://sessionlink.com/1212412',
    },
    'izsk5bn7': {
      'en': 'Upload cover JA',
      'de': 'Upload cover JA',
      'ja': 'Upload cover JA',
    },
    'dczzyn7z': {
      'en': 'Delete cover JA',
      'de': 'Delete cover JA',
      'ja': 'Delete cover JA',
    },
    '9ykmyao2': {
      'en': 'Upload video JA',
      'de': 'Upload video JA',
      'ja': 'Upload video JA',
    },
    'r23zlknm': {
      'en': 'Delete video JA',
      'de': 'Delete video JA',
      'ja': 'Delete video JA',
    },
    'vu18d2pf': {
      'en': 'Home',
      'de': 'Home',
      'ja': 'Home',
    },
  },
  // languageSelectDialog
  {
    't7llkirb': {
      'en': 'Select language',
      'de': 'Wähle die App Sprache aus',
      'ja': '言語を選択',
    },
    'wacxmizm': {
      'en': 'English',
      'de': 'Englisch',
      'ja': '英語',
    },
    'yv7searm': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'ja': 'ドイツ語',
    },
    'bvm5p0h8': {
      'en': 'Japanese',
      'de': 'Japanisch',
      'ja': '日本語',
    },
  },
  // signupSuccess
  {
    '135inf76': {
      'en': 'Your account has been created',
      'de': 'Dein Konto wurde erstellt',
      'ja': 'アカウントが作成されました',
    },
    '7zjkfwfk': {
      'en': 'Now it\'s time to HIIT the Beat',
      'de': 'Viel Spaß und zeige der Welt was du drauf hast',
      'ja': '楽しみながら進歩を楽しみましょう！',
    },
    'zsvpt7s3': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
      'ja': 'Let’s go!',
    },
  },
  // emailChangeSuccess
  {
    '2jcj2ldj': {
      'en': 'The email has been changed',
      'de': 'Die E-Mail wurde geändert',
      'ja': 'メールアドレスが変更されました',
    },
    '1ok7vxs9': {
      'en': 'Now use it to log in',
      'de': 'Melden Sie sich damit jetzt an',
      'ja': '今すぐログインしてください',
    },
    'syczmf7i': {
      'en': 'Close',
      'de': 'Schließen',
      'ja': '近い',
    },
  },
  // noInternet
  {
    '0qgwpmda': {
      'en': 'No internet',
      'de': 'Kein Internet',
      'ja': 'インターネットなし',
    },
    'rfy39tpk': {
      'en': 'Please check your connection and try reconnecting',
      'de': 'Bitte überprüfe deine Internetverbindung und versuche es erneut',
      'ja': '接続を確認して再接続してください',
    },
    'z97ynk5a': {
      'en': 'Reconnect',
      'de': 'Wieder verbinden',
      'ja': '再接続',
    },
  },
  // LogOutDialog
  {
    'hfotr0i4': {
      'en': 'Are you sure you want to log out?',
      'de': 'Möchtest du dich wirklich abmelden?',
      'ja': 'ログアウトしてもよろしいですか?',
    },
    'fzw42eag': {
      'en': 'No, stay ',
      'de': 'Nein',
      'ja': 'いいえ、そのまま',
    },
    '7ty8j2tx': {
      'en': 'Yes, log out',
      'de': 'Ja, jetzt abmelden',
      'ja': 'はい、ログアウトします',
    },
  },
  // navbar
  {
    '6cm7wb2r': {
      'en': 'Workout collections',
      'de': 'Workout Sammlung',
      'ja': 'ワークアウトコレクション',
    },
    'wo69idjh': {
      'en': 'Additionals',
      'de': 'Extras',
      'ja': '追加事項',
    },
    'c6q3xdkd': {
      'en': 'Profile',
      'de': 'Profil',
      'ja': 'プロフィール',
    },
  },
  // DeleteAccDialog
  {
    'ylms164a': {
      'en': 'Are you sure you want to delete your account?',
      'de': 'Bist du sicher, dass du dein Konto löschen möchtest?',
      'ja': 'アカウントを削除してもよろしいですか?',
    },
    'r43zhius': {
      'en':
          'You’ll lose access to all training results and purchased content. You cannot cancel this action',
      'de':
          'Du verlierst den Zugriff auf alle Trainingsergebnisse und gekauften Inhalte. Diese Aktion kann nicht rückgängig gemacht werden.',
      'ja': 'すべてのトレーニング結果と購入したコンテンツにアクセスできなくなります。この操作はキャンセルできません。',
    },
    'j02dfqzf': {
      'en': 'No, stay ',
      'de': 'Nein, ich ziehe weiterhin durch!',
      'ja': 'いいえ、そのまま',
    },
    'h4ovms9z': {
      'en': 'Yes, delete account',
      'de': 'Ja, ich gebe auf',
      'ja': 'はい、アカウントを削除します',
    },
    'kkedx2u5': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
      'ja': 'アカウントを削除しました',
    },
  },
  // SelectGoalDialog
  {
    'jz6n8pkd': {
      'en': 'Select goal',
      'de': 'Ziel auswählen',
      'ja': '目標を選択',
    },
    'ahjzuukq': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ja': '確認する',
    },
  },
  // cancelSubs
  {
    'bh9vm2c1': {
      'en': 'The subscription has been canceled',
      'de': 'Das Abonnement wurde gekündigt',
      'ja': 'サブスクリプションはキャンセルされました',
    },
    '7oftg9h2': {
      'en': 'The current subscription will be valid until March 24',
      'de': 'Das aktuelle Abonnement ist bis zum 24. März gültig',
      'ja': '現在のサブスクリプションは3月24日まで有効です',
    },
    'onuo4q4p': {
      'en': 'Close',
      'de': 'Schließen',
      'ja': '近い',
    },
  },
  // changeSubs
  {
    'zyccxm66': {
      'en': 'The subscription has been changed',
      'de': 'Das Abonnement wurde geändert',
      'ja': 'サブスクリプションが変更されました',
    },
    'na5tez6e': {
      'en': 'The current subscription will be valid until March 24',
      'de': 'Das aktuelle Abonnement ist bis zum 24. März gültig',
      'ja': '現在のサブスクリプションは3月24日まで有効です',
    },
    '8i3m9mrl': {
      'en': 'Close',
      'de': 'Schließen',
      'ja': '近い',
    },
  },
  // PromoDialog
  {
    'cbhc9jgz': {
      'en': 'Enter a promo code if you have one to get a discount',
      'de':
          'Geben Sie einen Aktionscode ein, falls Sie einen haben, um einen Rabatt zu erhalten',
      'ja': '割引を受けるにはプロモーションコードを入力してください',
    },
    'r99f03fi': {
      'en': 'Promocode',
      'de': 'Aktionscode',
      'ja': 'プロモーションコード',
    },
    'hv9a8esq': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'p1itsm2k': {
      'en': 'The promocode doesn’t exist or it has expired',
      'de': 'Der Promocode existiert nicht oder ist abgelaufen',
      'ja': 'プロモーションコードが存在しないか、期限が切れています',
    },
    'u818sw9e': {
      'en': 'Confirm',
      'de': 'Bestätigen',
      'ja': '確認する',
    },
    'bfyly20q': {
      'en': 'I don\'t have a promo code',
      'de': 'Ich habe keinen Aktionscode',
      'ja': 'プロモーションコードを持っていません',
    },
  },
  // successSubs
  {
    'xejf2ywy': {
      'en': 'Now it\'s time to begin your journey',
      'de': 'Viel Spaß bei deiner Transformation!',
      'ja': 'さあ、旅を始めましょう',
    },
    '2cz1nu46': {
      'en': 'Welcome to the most fun and energy-driven workout in the world!',
      'de':
          'Willkommen zum abwechslungsreichsten und energiegeladensten Training der Welt.',
      'ja': '世界で最も楽しくてエネルギーに満ちたワークアウトへようこそ！',
    },
    'tz6e6wqm': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
      'ja': 'Let’s go!',
    },
  },
  // additionalComp
  {
    'hodtjo4j': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
  },
  // BecomeaHIITtheBeatTrainer
  {
    'kbwea8f2': {
      'en': 'HIIT the Beat Pro Trainer',
      'de': 'Werde HIIT the Beat Trainer',
      'ja': 'Become a HIIT the Beat Trainer',
    },
    'zh5yw60e': {
      'en':
          'Click to learn more and start your journey — \nno GODMODE required!',
      'de': 'Jetzt mehr erfahren und deine Reise starten',
      'ja': 'エキスパートレベルとゴッドモードレベルは含まれません',
    },
  },
  // HIITtheBeatShop
  {
    'zel40k37': {
      'en': 'HIIT the Beat Shop',
      'de': 'HIIT the Beat Shop',
      'ja': 'HIIT the Beat Shop',
    },
    'idxlma6w': {
      'en': 'Style yourself for the most energized workout in the world',
      'de': 'Shoppe jetzt freshe Styles in unserem Shop',
      'ja': '世界で最もエネルギッシュなワークアウトのために自分をスタイリングしましょう',
    },
  },
  // Watchtheintroductoryvideo
  {
    '6exvv6ta': {
      'en': 'Watch the introductory video',
      'de': 'Schau dir das Einführungsvideo an',
      'ja': '紹介ビデオを見る',
    },
    'yhmws86v': {
      'en': 'We’ll tell you more about the app',
      'de': 'Wir verraten dir mehr über die App',
      'ja': 'アプリについて詳しく説明します',
    },
  },
  // seasonComp
  {
    'ku2u1aem': {
      'en': 'Workouts',
      'de': 'Workouts',
      'ja': 'Workouts',
    },
    'bcbfylss': {
      'en': ' ~ ',
      'de': ' ~ ',
      'ja': ' ~ ',
    },
  },
  // GodModeDialog
  {
    'tiuu8jmr': {
      'en': 'Godmode already on the way',
      'de': 'Godmode ist bereits auf dem Weg',
      'ja': 'ゴッドモードはすでに登場中',
    },
    'aahl1y8v': {
      'en': 'Get ready to become a warrior!',
      'de': 'Mach dich bereit ein Krieger zu werden!',
      'ja': '戦士になる準備をしましょう！',
    },
    'uovtnjxr': {
      'en': 'Go back',
      'de': 'Geh zurück',
      'ja': '戻る',
    },
  },
  // filterSeasonDialog
  {
    'pc4fuj50': {
      'en': 'Which seasons to show?',
      'de': 'Welche Seasons sollen angezeigt werden?',
      'ja': 'どの季節を展示しますか?',
    },
    'mt480vnq': {
      'en':
          'Some seasons are only available in one language. Therefore, follow the order of the seasons from top to bottom anyway, even if the order is broken',
      'de':
          'Einige Seasons sind nur in einer Sprache verfügbar. Befolge daher auf jeden Fall die Reihenfolge der Seasons von oben nach unten, auch wenn eine fehlt',
      'ja': '一部のシーズンは1つの言語でしか視聴できません。そのため、たとえ順番がバラバラであっても、上から下へ順番に視聴してください。',
    },
    'inhsm2oq': {
      'en': 'Hide completed seasons and workouts',
      'de': 'Verstecke abgeschlossene Seasons und Workouts',
      'ja': '完了したシーズンとワークアウトを非表示にする',
    },
    'z2v0b8ui': {
      'en': 'All',
      'de': 'Alle',
      'ja': '全て',
    },
    'qxe5c348': {
      'en': 'Only EN',
      'de': 'Nur EN',
      'ja': 'ENのみ',
    },
    '84rjp4gu': {
      'en': 'Only DE',
      'de': 'Nur DE',
      'ja': 'DEのみ',
    },
    'krs3ax4u': {
      'en': 'Only JA',
      'de': 'Nur JA',
      'ja': 'JAのみ',
    },
    'nzropwt1': {
      'en': 'Let’s Go',
      'de': 'Let\'s go',
      'ja': 'Let’s Go',
    },
  },
  // becomeplusmember
  {
    'zvxsuk2p': {
      'en': 'Become a Plusmember  to get access to 100+ workouts',
      'de': 'Werden Sie Plusmitglied für über 100+ Workouts!',
      'ja': 'Plusmemberになると、100以上のワークアウトにアクセスできます',
    },
    '9k47luzn': {
      'en': 'Details & payment',
      'de': 'Details & Zahlung',
      'ja': '詳細と支払い',
    },
  },
  // workoutComp
  {
    '66rk1jnv': {
      'en': 'Completed',
      'de': 'Completed',
      'ja': 'Completed',
    },
    '337qu9pr': {
      'en': 'times',
      'de': 'times',
      'ja': 'times',
    },
    'tro9fl3b': {
      'en': 'Not completed',
      'de': 'Not completed',
      'ja': 'Not completed',
    },
    'exk17ls5': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
  },
  // seasonMainComp
  {
    '2o32k5nl': {
      'en': 'EN | DE | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    '1dm8vm05': {
      'en': 'EN | DE',
      'de': 'EN | DE',
      'ja': 'EN | DE',
    },
    'rbso5ry6': {
      'en': 'DE | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    'fnvbtz86': {
      'en': 'EN  | JA',
      'de': 'EN | DE | JA',
      'ja': 'EN | DE | JA',
    },
    'yjnekpi7': {
      'en': 'EN',
      'de': 'EN',
      'ja': 'EN',
    },
    'th5ys52a': {
      'en': 'DE',
      'de': 'DE',
      'ja': 'DE',
    },
    'ypz1naad': {
      'en': 'JA',
      'de': 'JA',
      'ja': 'JA',
    },
    '67l2ulqn': {
      'en': 'Workouts',
      'de': 'Workouts',
      'ja': 'Workouts',
    },
    'f6jing3j': {
      'en': 'Last activity',
      'de': 'Letzte Aktivität',
      'ja': '最後のアクティビティ',
    },
    'ulmgxwkw': {
      'en': 'Progress',
      'de': 'Fortschritt',
      'ja': '進捗',
    },
    'brstmsv1': {
      'en': '',
      'de': '',
      'ja': '',
    },
  },
  // apbar
  {
    '0axxkhiu': {
      'en': 'Unleash your potential',
      'de': 'Entfesseln Sie Ihr Potenzial',
      'ja': 'あなたの潜在能力を解き放つ',
    },
    '6s0bj9x8': {
      'en':
          'Become a Plusmember and say hello to a completely new body sensation!',
      'de':
          'Werden Sie Plusmember und begrüßen Sie ein völlig neues Körpergefühl!',
      'ja': 'Plusmember になって、まったく新しいボディ感覚を体験しましょう!',
    },
  },
  // SelectWarmUpCoolDownDialog
  {
    'mm1w2qr0': {
      'en': 'Select Warm Up',
      'de': 'Wähle dein Warm Up',
      'ja': 'ウォームアップを選択',
    },
    '5dn60aaw': {
      'en': 'Select Cool Down',
      'de': 'Wähle dein Cool Down',
      'ja': 'クールダウンを選択',
    },
    '2avtfd0j': {
      'en': 'Close',
      'de': 'Schließen',
      'ja': '近い',
    },
  },
  // additionalCompDialog
  {
    '7fx80jza': {
      'en': 'Free',
      'de': 'Free',
      'ja': 'Free',
    },
  },
  // PaymentDialog
  {
    '0gprl0cm': {
      'en': 'TRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSIC',
      'de': 'TRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSIC',
      'ja': 'TRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSIC',
    },
    'kg7u2t86': {
      'en': 'FUN.CHALLENGING.DIFFERENT',
      'de': 'FUN.CHALLENGING.DIFFERENT',
      'ja': 'FUN.CHALLENGING.DIFFERENT',
    },
    'may7byav': {
      'en': '100+ music-driven workouts',
      'de': '100+ music-driven workouts',
      'ja': '100+ music-driven workouts',
    },
    'iba3a3u8': {
      'en': 'New ones added regularly',
      'de': 'New ones added regularly',
      'ja': 'New ones added regularly',
    },
    'kbyul9u3': {
      'en': '4 levels',
      'de': '4 levels',
      'ja': '4 levels',
    },
    '29ze0gds': {
      'en': 'Beginner → Advanced → Expert → Godmode',
      'de': 'Beginner → Advanced → Expert → Godmode',
      'ja': 'Beginner → Advanced → Expert → Godmode',
    },
    'oomhg8l9': {
      'en': 'No reps.  No counting',
      'de': 'No reps.  No counting',
      'ja': 'No reps.  No counting',
    },
    '9o3tfclx': {
      'en': 'Just the beat',
      'de': 'Just the beat',
      'ja': 'Just the beat',
    },
    'rnegvd7d': {
      'en': 'Weekly Live  Workout Jams',
      'de': 'Weekly Live  Workout Jams',
      'ja': 'Weekly Live  Workout Jams',
    },
    'elh0ty3e': {
      'en': 'With coaches  & community',
      'de': 'With coaches  & community',
      'ja': 'With coaches  & community',
    },
    'oe2hfr27': {
      'en': '100,000 downloads worldwide',
      'de': '100,000 downloads worldwide',
      'ja': '100,000 downloads worldwide',
    },
  },
  // GuestDialog
  {
    'q8lje3xj': {
      'en': 'Unlock Full Access to Workouts!',
      'de': 'Unlock Full Access to Workouts!',
      'ja': 'Unlock Full Access to Workouts!',
    },
    'azeedwxs': {
      'en':
          'Sign up and log in to access more workouts, additionals, and save your progress',
      'de':
          'Sign up and log in to access more workouts, additionals, and save your progress',
      'ja':
          'Sign up and log in to access more workouts, additionals, and save your progress',
    },
    'oha358fe': {
      'en': 'Sign Up / Log In',
      'de': 'Sign Up / Log In',
      'ja': 'Sign Up / Log In',
    },
    'nv4fzm78': {
      'en': 'Maybe later',
      'de': 'Maybe later',
      'ja': 'Maybe later',
    },
  },
  // SeasonDoneDialog
  {
    'f8v79pyt': {
      'en': 'SEASON',
      'de': 'SEASON',
      'ja': 'SEASON',
    },
    'xpzitrhb': {
      'en': 'IS DONE!',
      'de': 'HAST DU DURCHGEROCKT!',
      'ja': '完了しました！',
    },
    'u68427cb': {
      'en': 'You’re getting stronger. Let´s move to the next one',
      'de': 'Auf geht\'s zu nächsten Challenge!',
      'ja': '強くなってきたな。次へ進みましょう',
    },
    '93tk94wz': {
      'en': 'Go to next season',
      'de': 'Hier gehts zur nächsten Season',
      'ja': '次のシーズンへ',
    },
  },
  // BeginnerSeasonsDoneDialog
  {
    'tkqedvab': {
      'en': 'BEGINNER SEASONS ARE DONE!',
      'de': 'DU HAST ALLE ANFÄNGER SEASONS ABSOLVIERT',
      'ja': '初心者シーズンは終了しました！',
    },
    'g17dzj1s': {
      'en':
          'Wow, you\'re really serious. Are you ready for the next level? Give it a try and go to the advanced level or just repeat your favorite workouts until we will release the next beginner season',
      'de':
          'Wow, das ist schonmal krass. Du meinst es wirklich ernst. Davon gibt es nicht viele. Bleib dran. Du kannst jetzt gerne die advanced workouts ausprobieren. Wenn du bei den Basic workouts bleiben möchtest. Kein Problem\n\nZieh einfach weiter deine Liebelingsworkouts durch, bis wir eine neue beginner Seasons veröffentlichen',
      'ja':
          'わあ、本当に真剣ですね。次のレベルに進む準備はできていますか？ぜひ試してみて、上級レベルに挑戦してみてください。あるいは、次の初心者向けシーズンがリリースされるまで、お気に入りのワークアウトを繰り返してもいいでしょう。',
    },
    'knffcl10': {
      'en': 'Go to next season',
      'de': 'Auf zum nächsten Level',
      'ja': '次のシーズンへ',
    },
    '52ybjjba': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den beginner Workouts',
      'ja': '新しい季節を待ちましょう',
    },
  },
  // AdvancedSeasonsDoneDialog
  {
    'cqbtg9h3': {
      'en': 'ADVANCED SEASONS ARE DONE!',
      'de': 'DU BIST MIT ALLEN ADVANCED SEASONS DURCH!',
      'ja': '上級シーズンが終了しました！',
    },
    'xcnasq54': {
      'en':
          'You’re on your way to become a machine. Not bad. Now it is about to keep going. Repeat your favorite workouts or go to the expert level and give it a try. Everything is possible!',
      'de':
          'Du bist auf dem weg eine Maschine zu werden. Nicht schlecht. Ziehe deine Lieblingsworkouts noch öfter durch oder wage dich an die expert Seasons. Probiere sie gerne aus. Zurück kannst du immer noch. Stelle dich der Herausforderung',
      'ja':
          'あなたはマシンへと変貌を遂げつつあります。悪くないですね。さあ、さらに進化を続けましょう。お気に入りのワークアウトを繰り返したり、エキスパートレベルに挑戦したり。すべては可能です！',
    },
    '7p9tghh3': {
      'en': 'Go to next season',
      'de': 'Auf zum nächsten Level',
      'ja': '次のシーズンへ',
    },
    'oudqdqnd': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den beginner Workouts',
      'ja': '新しい季節を待ちましょう',
    },
  },
  // ExpertSeasonsDoneDialog
  {
    '78uywcju': {
      'en': 'EXPERT SEASONS ARE DONE!',
      'de': 'DU BIST MIT ALLEN EXPERT SEASONS DURCH!',
      'ja': 'エキスパートシーズンは終了しました！',
    },
    'ra1m2l77': {
      'en':
          'You‘re a monster. Just 3% of people on this planet are able to pass this level. You can be proud of yourself. Show us this skills on social media. People need to see your power. Do you love to inspire other people with your power? Apply to become a HIIT the Beat Trainer: ',
      'de':
          'Du bist ein Monster. Nur 3% der Menschen auf diesem Planeten schaffen es diese Workouts durchzuziehen. Vergesse nicht deinen Progress auf Social media zu teilen.  Das muss die Welt sehen. Du solltest HIIT the Beat Trainer werden. Schreibe uns eine e-Mail an ',
      'ja':
          'あなたはモンスターです。地球上でこのレベルに到達できるのはたった3%の人だけです。誇りに思ってください。ソーシャルメディアでこのスキルを披露してください。人々はあなたのパワーを知りたがっています。あなたのパワーで他の人を鼓舞したいですか？HIIT the Beatトレーナーに応募しませんか？',
    },
    '0jfwfq4j': {
      'en': 'https://trainer.hiit-the-beat.com/en-trainer',
      'de': 'info@hiit-the-beat.com',
      'ja': 'info@hiit-the-beat.com',
    },
    'hatl84jz': {
      'en': ' ',
      'de': ', wenn du Interesse hast ie welt als Trainer zu inspirieren',
      'ja': ' ',
    },
    '98y4o1pj': {
      'en': ' Send us a mail to',
      'de': 'Du willst noch mehr Workouts ? Schicke eine Mail an ',
      'ja': 'メールはこちらまで',
    },
    'xjmrga16': {
      'en': ' info@breakletics.com\n',
      'de': ' info@breakletics.com',
      'ja': ' info@breakletics.com\n',
    },
    'yrdxwaxv': {
      'en': 'So we will hurry up to release the godmode level',
      'de':
          ' und wir werden noch mehr reinhauen neue Workouts für dich zu erstellen',
      'ja': 'だから私たちは急いでゴッドモードレベルをリリースします',
    },
    'oyrgquuj': {
      'en': 'Write mail',
      'de': 'E-Mail schreiben',
      'ja': 'メールを書く',
    },
    'zgu1dsru': {
      'en': 'Go to next season',
      'de': 'Auf zum nächsten Level',
      'ja': '次のシーズンへ',
    },
    '9jqu75he': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den expert Workouts',
      'ja': '新しい季節を待ちましょう',
    },
  },
  // WorkoutSuccessDialog
  {
    'q6q0100i': {
      'en': 'points',
      'de': 'punkte',
      'ja': 'ポイント',
    },
    '9es261xp': {
      'en': 'YOU ARE INSANE!',
      'de': 'YOU ARE INSANE!',
      'ja': 'YOU ARE INSANE!',
    },
    '4rgsh6mz': {
      'en': 'Keep up the great work',
      'de': 'Keep up the great work',
      'ja': 'Keep up the great work',
    },
    '27k05ixx': {
      'en': 'Warm Up',
      'de': 'Warm Up',
      'ja': 'Warm Up',
    },
    '5nmj1xo1': {
      'en': 'Workout',
      'de': 'Workout',
      'ja': 'Workout',
    },
    'wn9gl3cq': {
      'en': 'Cool Down',
      'de': 'Cool Down',
      'ja': 'Cool Down',
    },
    'bj8er4cy': {
      'en': 'Let’s Go!',
      'de': 'Let’s go!',
      'ja': 'Let’s go!',
    },
  },
  // WorkoutSuccess3timesDialog
  {
    '0iji3oos': {
      'en': 'points',
      'de': 'punkte',
      'ja': 'ポイント',
    },
    '1t6vwh32': {
      'en': 'NICELY DONE!',
      'de': 'NICELY DONE!',
      'ja': 'NICELY DONE!',
    },
    'uuh2zkwa': {
      'en':
          'You\'ve done this workout 3 times. You’re a machine! Now you can move to the next challenge',
      'de':
          'You\'ve done this workout 3 times. You’re a machine! Now you can move to the next challenge',
      'ja':
          'You\'ve done this workout 3 times. You’re a machine! Now you can move to the next challenge',
    },
    'knyyti6y': {
      'en': 'Warm Up',
      'de': 'Warm Up',
      'ja': 'Warm Up',
    },
    'fl1vsckd': {
      'en': 'Workout',
      'de': 'Workout',
      'ja': 'Workout',
    },
    'g25b1yqv': {
      'en': 'Cool Down',
      'de': 'Cool Down',
      'ja': 'Cool Down',
    },
    'nig2c2xf': {
      'en': 'Finish',
      'de': 'Finish',
      'ja': 'Finish',
    },
    'tnhvf7wk': {
      'en': 'I didn\'t have enough. Let\'s go to next workout!',
      'de': 'Da geht mehr, noch ein Workout!',
      'ja': 'まだ足りなかった。次のトレーニングに進みましょう！',
    },
  },
  // emptyList
  {
    'hhoj5w95': {
      'en': 'New season is coming soon',
      'de': 'Die neue Season kommt bald',
      'ja': '新シーズンがもうすぐ始まります',
    },
  },
  // AdminNavBar
  {
    'tick9btn': {
      'en': 'User management',
      'de': 'User management',
      'ja': 'User management',
    },
    'drznubl9': {
      'en': 'Seasons & Workouts',
      'de': 'Seasons & Workouts',
      'ja': 'Seasons & Workouts',
    },
    'm3gsbeo5': {
      'en': 'Warm Ups & Cool Downs',
      'de': 'Warm Ups & Cool Downs',
      'ja': 'Warm Ups & Cool Downs',
    },
    'zzsj42bs': {
      'en': 'Zoom jam',
      'de': 'Zoom jam',
      'ja': 'Zoom jam',
    },
    'pri1d38w': {
      'en': 'Promocodes',
      'de': 'Promocodes',
      'ja': 'Promocodes',
    },
    'nxkzh44m': {
      'en': 'Home page banner',
      'de': 'Home page banner',
      'ja': 'Home page banner',
    },
    '4dqayonk': {
      'en': 'Settings',
      'de': 'Settings',
      'ja': 'Settings',
    },
    '4uzwmty6': {
      'en': 'Log out',
      'de': 'Log out',
      'ja': 'Log out',
    },
  },
  // AdminUserDialog
  {
    'lb25x687': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    'dvtiwz6k': {
      'en': 'Block',
      'de': 'Block',
      'ja': 'Block',
    },
    'rxnnn430': {
      'en': 'Unblock',
      'de': 'Unblock',
      'ja': 'Unblock',
    },
    'yg69qf30': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
    'kkpnt18h': {
      'en': 'Undelete',
      'de': 'Undelete',
      'ja': 'Undelete',
    },
  },
  // AdminPromoDialog
  {
    'nl8ado3z': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    'zu58z2ce': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
  },
  // AdminAdditionalDialog
  {
    '3t18wf8v': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    'yxv1s5km': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
  },
  // AdminSeasonsDialog
  {
    'znof1dn9': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    '5sfhq8hv': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
  },
  // AdminWorkoutDialog
  {
    'swxuh7uj': {
      'en': 'Edit',
      'de': 'Edit',
      'ja': 'Edit',
    },
    'gfuz0xjb': {
      'en': 'Delete',
      'de': 'Delete',
      'ja': 'Delete',
    },
  },
  // ZOOMLiveWorkoutJamList
  {
    'ewznu98z': {
      'en': 'Workout',
      'de': 'Workout',
      'ja': '',
    },
    '32g8y489': {
      'en': 'Jam',
      'de': 'Jam',
      'ja': '',
    },
  },
  // AdminUserDelete
  {
    'vm6go066': {
      'en': 'Delete the user  ',
      'de': 'Delete the user\n',
      'ja': 'Delete the user',
    },
    '2qiq18m8': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    'x9ca0b0h': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    'b7bw3uv3': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // AdminSeasonDelete
  {
    '44136c4q': {
      'en': 'Delete Season \n',
      'de': 'Delete Season \n',
      'ja': 'Delete Season \n',
    },
    'w4dp0y0m': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    'w46hcok7': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    'jctsbof6': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // AdminWorkoutDelete
  {
    '0hgaddei': {
      'en': 'Delete Workout\n',
      'de': 'Delete Workout\n',
      'ja': 'Delete Workout\n',
    },
    '9hauiwml': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    '14zp702l': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    'lpm1lmzc': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // AdminAdditDelete
  {
    'aynf9u5v': {
      'en': 'Delete ',
      'de': 'Delete ',
      'ja': 'Delete ',
    },
    'zubjccwe': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    'zhby8sat': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    'qf8xstnf': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // AdminPromoDelete
  {
    'lhrc4wgb': {
      'en': 'Delete Promo\n',
      'de': 'Delete Promo\n',
      'ja': 'Delete Promo\n',
    },
    'k57jnz91': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    'io8po2vw': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    's3b1itgc': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // AdminSaveDialog
  {
    '7cb9tz2d': {
      'en': 'Save the changes before exiting?',
      'de': 'Save the changes before exiting?',
      'ja': 'Save the changes before exiting?',
    },
    'zzlh32ea': {
      'en': 'Yes, save',
      'de': 'Yes, save',
      'ja': 'Yes, save',
    },
    'rucud17i': {
      'en': 'Don’t save',
      'de': 'Don’t save',
      'ja': 'Don’t save',
    },
  },
  // AdminBannerDelete
  {
    'gyn03twp': {
      'en': 'Delete Home page banner #',
      'de': 'Delete Home page banner #',
      'ja': 'Delete Home page banner #',
    },
    'huef6fdh': {
      'en': ' You’ll not be able to undo this action',
      'de': ' You’ll not be able to undo this action',
      'ja': ' You’ll not be able to undo this action',
    },
    'tqmo743l': {
      'en': 'Yes, delete',
      'de': 'Yes, delete',
      'ja': 'Yes, delete',
    },
    'x5m4gglg': {
      'en': 'No, cancel',
      'de': 'No, cancel',
      'ja': 'No, cancel',
    },
  },
  // LevelSuccessDialog
  {
    'nbr26oj0': {
      'en': 'Done',
      'de': 'Done',
      'ja': 'Done',
    },
  },
  // GosModeSeasonsDoneDialog
  {
    'flppla33': {
      'en': 'GODMODE SEASONS ARE DONE!',
      'de': 'DU BIST MIT ALLEN GODMODE SEASONS DURCH!',
      'ja': 'GODMODE シーズンが終了しました!',
    },
    'mkeli16d': {
      'en':
          'You‘re a monster. Just 3% of people on this planet are able to pass this level. You can be proud of yourself. Show us this skills on social media. People need to see your power. Do you love to inspire other people with your power? Apply to become a HIIT the Beat Trainer: ',
      'de':
          'Du bist ein Monster. Nur 3% der Menschen auf diesem Planeten schaffen es diese Workouts durchzuziehen. Vergesse nicht deinen Progress auf Social media zu teilen.  Das muss die Welt sehen. Du solltest HIIT the Beat Trainer werden. Schreibe uns eine e-Mail an ',
      'ja':
          'あなたはモンスターです。地球上でこのレベルに到達できるのはたった3%の人だけです。誇りに思ってください。ソーシャルメディアでこのスキルを披露してください。人々はあなたのパワーを知りたがっています。あなたのパワーで他の人を鼓舞したいですか？HIIT the Beatトレーナーに応募しませんか？',
    },
    'vazboi7v': {
      'en': 'https://trainer.hiit-the-beat.com/en-trainer',
      'de': 'info@hiit-the-beat.com',
      'ja': 'info@hiit-the-beat.com',
    },
    'wi4m33qh': {
      'en': ' ',
      'de': ', wenn du Interesse hast ie welt als Trainer zu inspirieren',
      'ja': ' ',
    },
    '30xm77ep': {
      'en': ' Send us a mail to',
      'de': 'Du willst noch mehr Workouts ? Schicke eine Mail an ',
      'ja': 'メールはこちらまで',
    },
    'rox5iw4x': {
      'en': ' info@breakletics.com\n',
      'de': ' info@breakletics.com',
      'ja': ' info@breakletics.com\n',
    },
    'oc3naf13': {
      'en': 'So we will hurry up to release the godmode level',
      'de':
          ' und wir werden noch mehr reinhauen neue Workouts für dich zu erstellen',
      'ja': 'だから私たちは急いでゴッドモードレベルをリリースします',
    },
    'dzsnrxad': {
      'en': 'Write mail',
      'de': 'E-Mail schreiben',
      'ja': 'メールを書く',
    },
    '0u9qat63': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den expert Workouts',
      'ja': '新しい季節を待ちましょう',
    },
  },
  // OnboardingHome
  {
    '4383hak7': {
      'en': 'Welcome!',
      'de': 'Herzlich willkommen!',
      'ja': 'Welcome!',
    },
    '0vnyib8u': {
      'en':
          'Let\'s do a short onboarding to familiarize you with the functionality? You can return to it at any time, via the hat icon in the bottom navigation',
      'de':
          'Lass uns ein kurzes Onboarding machen, um dich kurz mit den Funktion vertraut zu machen, damit du sofort starten kannst. Über das Hütchen-Symbol in der unteren Navigation kannst du jederzeit zu dieser Seite zurückkehren',
      'ja':
          'Let\'s do a short onboarding to familiarize you with the functionality? You can return to it at any time, via the hat icon in the bottom navigation',
    },
    'cl2rbk5a': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
      'ja': 'Let’s go!',
    },
  },
  // OnboardingHomeStep1
  {
    '1ysdw25z': {
      'en': 'Step 1/5',
      'de': 'Stufe 1/5',
      'ja': 'Step 1/5',
    },
    '8axr5t1i': {
      'en':
          'On the home page you can see your progress by level and points. With the yellow bar you can continue training from the last workout',
      'de':
          'Auf der Startseite kannst du deinen Fortschritt verfolgen. Durch die Workouts sammelst du Punkte und steigst Levels auf. Über den gelben Balken kommst du immer zu dem Workout mit dem du fortsetzen sollst',
      'ja':
          'On the home page you can see your progress by level and points. With the yellow bar you can continue training from the last workout',
    },
    'ln8z7qeb': {
      'en': 'Back',
      'de': 'Zurück',
      'ja': 'Back',
    },
    'ewladgl7': {
      'en': 'Next',
      'de': 'Weiter',
      'ja': 'Next',
    },
  },
  // OnboardingHomeStep2
  {
    '7k8ri7le': {
      'en': 'Step 2/5',
      'de': 'Stufe 2/5',
      'ja': 'Step 2/5',
    },
    'a17hnqx5': {
      'en':
          'The workout collections section contains workouts, they are divided into fitness levels. You can select the desired level and click on the season card to go to the list of the workouts',
      'de':
          'Die Workoutsammlungen sind nach Fitnesslevels unterteilt. Du kannst oben dein gewünschtes Level auswählen und gelangst so zu den einzelnen Seasons',
      'ja':
          'The workout collections section contains workouts, they are divided into fitness levels. You can select the desired level and click on the season card to go to the list of the workouts',
    },
    'g200rhgs': {
      'en': 'Back',
      'de': 'Zurück',
      'ja': 'Back',
    },
    '81z434am': {
      'en': 'Next',
      'de': 'Weiter',
      'ja': 'Next',
    },
  },
  // OnboardingHomeStep3
  {
    'jgqbwmao': {
      'en': 'Step 3/5',
      'de': 'Stufe 3/5',
      'ja': 'Step 3/5',
    },
    'wr5t2ojx': {
      'en':
          'On the season screen, basic information such as duration and last activity is available at the top. You can select the first workout to continue. We recommend to do each workout three times before you move to the next one',
      'de':
          'Wähle deine Season aus, und du kannst oben alle wichtigen Informationen sehen – wie Name, Dauer der Season und deine letzte Aktivität. Hier kannst du dein erstes Workout auswählen. Starte immer mit dem ersten Workout, da die Workouts aufeinander aufbauen',
      'ja':
          'On the season screen, basic information such as duration and last activity is available at the top. You can select the first workout to continue. We recommend to do each workout three times before you move to the next one',
    },
    'tplemx4g': {
      'en': 'Back',
      'de': 'Zurück',
      'ja': 'Back',
    },
    'qpc4xcbb': {
      'en': 'Next',
      'de': 'Weiter',
      'ja': 'Next',
    },
  },
  // OnboardingHomeStep4
  {
    '0qvgh2as': {
      'en': 'Step 4/5',
      'de': 'Stufe 4/5',
      'ja': 'Step 4/5',
    },
    'oy3kfete': {
      'en':
          'The workout screen at the top also has basic information about the duration and last activity. Each workout is divided into 3 phases: warm up, workout and cool down.',
      'de':
          'Jedes Workout in der App besteht aus drei Teilen: Warm-up, Workout und Cool-down. Du kannst dein eigenes Warm-up und Cool-down wählen oder die vorgeschlagenen nutzen. Für alle Abschnitte erhältst du Punkte.',
      'ja':
          'The workout screen at the top also has basic information about the duration and last activity. Each workout is divided into 3 phases: warm up, workout and cool down.',
    },
    'j31n8ad6': {
      'en':
          'You collect points for every activity. When you finish your workout, tap ‘Finish Workout’ to get your points. If you’d like, you can take a screenshot and share your results on social media.',
      'de':
          'Wichtig: Nach dem Training auf „Finish Workout“ klicken, damit die Punkte gutgeschrieben werden. Mach einen Screenshot deines Ergebnisses, um deinen Fortschritt zu dokumentieren und teile ihn direkt auf Social Media, um dich und andere zu motivieren.',
      'ja':
          'You collect points for every activity. When you finish your workout, tap ‘Finish Workout’ to get your points. If you’d like, you can take a screenshot and share your results on social media.',
    },
    '7jmtgf67': {
      'en': 'Back',
      'de': 'Zurück',
      'ja': 'Back',
    },
    '3b3f720o': {
      'en': 'Next',
      'de': 'Weiter',
      'ja': 'Next',
    },
  },
  // OnboardingHomeStep5
  {
    'guo21hnb': {
      'en': 'Step 5/5',
      'de': 'Stufe 5/5',
      'ja': 'Step 5/5',
    },
    '6clf8prb': {
      'en': 'That\'s it.  Let\'s start the first workout, shall we?',
      'de': 'Das war´s schon. Starte jetzt mit deinem ersten Workout.',
      'ja': 'That\'s it.  Let\'s start the first workout, shall we?',
    },
    '5wfcsjfw': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
      'ja': 'Let’s go!',
    },
    'kth9aq82': {
      'en': 'Back',
      'de': 'Zurück',
      'ja': 'Back',
    },
    'ij22uxtu': {
      'en': 'Maybe later',
      'de': 'Vielleicht später',
      'ja': 'Maybe later',
    },
  },
  // onboardingStart
  {
    'nodzlodr': {
      'en': '1000+ PEOPLE\n',
      'de': '1000+ PEOPLE\n',
      'ja': '1000+ PEOPLE\n',
    },
    'q20b4g5y': {
      'en': 'Here are some of the transformations',
      'de': 'Hier sind einige Transformationen',
      'ja': 'Here are some of the transformations',
    },
    '0hta3ve5': {
      'en': 'EVERY BEAT ',
      'de': 'BEATS, DIE DICH DURCH ',
      'ja': 'EVERY BEAT ',
    },
    'ocjkizff': {
      'en': 'PUSHES YOU FORWARD',
      'de': 'EDES WORKOUT TRAGEN',
      'ja': 'PUSHES YOU FORWARD',
    },
  },
  // ZoomNoPremiumDialog
  {
    '74e6i1g6': {
      'en': 'WORKOUT\n',
      'de': 'WORKOUT\n',
      'ja': 'WORKOUT\n',
    },
    'lmie17lq': {
      'en': 'JAM',
      'de': 'JAM',
      'ja': 'JAM',
    },
    'h2hcoykk': {
      'en': 'TRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSIC',
      'de':
          'TRAIN EVERYTHING THAT MATTERS.\nALLES IN EINER SESSION. POWERED BY MUSTRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSICIC.',
      'ja': 'TRAIN EVERYTHING \nTHAT MATTERS. \nALL AT ONCE. LED BY MUSIC',
    },
    'z6gld9wx': {
      'en': 'What is a Workout Jam?',
      'de': 'What is a Workout Jam?',
      'ja': 'What is a Workout Jam?',
    },
    'hje3ohy8': {
      'en':
          'A live workout session with real coaches  and the Mover community. Every week different people, different levels, same fun',
      'de':
          'A live workout session with real coaches  and the Mover community. Every week different people, different levels, same fun',
      'ja':
          'A live workout session with real coaches  and the Mover community. Every week different people, different levels, same fun',
    },
    'qm6i8s91': {
      'en':
          'Train together, not alone. Get motivated by coaches who push you, and Movers who train right alongside you. No equipment. No excuses. Just the beat',
      'de':
          'Train together, not alone. Get motivated by coaches who push you, and Movers who train right alongside you. No equipment. No excuses. Just the beat',
      'ja':
          'Train together, not alone. Get motivated by coaches who push you, and Movers who train right alongside you. No equipment. No excuses. Just the beat',
    },
    '9p6lnipd': {
      'en': 'Available only for Plusmembers',
      'de': 'Available only for Plusmembers',
      'ja': 'Available only for Plusmembers',
    },
    'ecn3ocqv': {
      'en': 'Got it',
      'de': 'Got it',
      'ja': 'Got it',
    },
  },
  // SignUpDelimiter
  {
    '0arxbgom': {
      'en': 'Or with email',
      'de': '',
      'ja': '',
    },
  },
  // Miscellaneous
  {
    'pj6qeklk': {
      'en': 'Button',
      'de': 'Taste',
      'ja': '',
    },
    'jv1ob6ru': {
      'en': 'Button',
      'de': 'Taste',
      'ja': '',
    },
    '01pvmdwr': {
      'en': 'Button',
      'de': 'Geh zurück',
      'ja': '',
    },
    'wh79yjoi': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
      'ja': '',
    },
    'k43c5sxh': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
      'ja': '',
    },
    'c6kkyg7s': {
      'en':
          'In order to record audio for video, this app requires permission to access the microphone',
      'de':
          'Um Audio für Videos aufzunehmen, benötigt diese App die Berechtigung, auf das Mikrofon zuzugreifen',
      'ja': '動画の音声を録音するには、このアプリはマイクにアクセスする許可が必要です',
    },
    'rlblj569': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
      'ja': 'プロフィール写真を撮るには、このアプリはカメラへのアクセス許可が必要です',
    },
    'gwyq325x': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
      'ja': 'プロフィール写真を撮るには、このアプリはカメラへのアクセス許可が必要です',
    },
    'ww67q1bf': {
      'en': 'false',
      'de': 'false',
      'ja': 'false',
    },
    'okds2qft': {
      'en':
          'This permission allows us to provide you with a personalized workout experience and improve the quality of the app.',
      'de':
          'Diese Berechtigung ermöglicht es uns, Ihnen ein personalisiertes Trainingserlebnis zu bieten und die Qualität der App zu verbessern.',
      'ja': 'この許可により、パーソナライズされたワークアウト体験を提供し、アプリの品質を向上させることができます。',
    },
    'ejvk3tfn': {
      'en':
          'In order to get notifications, this app requires permission to access the notifications',
      'de': '',
      'ja': '',
    },
    'jm6so7ph': {
      'en': 'Incorrect password',
      'de': '',
      'ja': '',
    },
    'u69dsnud': {
      'en': 'Password reset email sent!',
      'de': 'E-Mail zum Zurücksetzen des Passworts gesendet!',
      'ja': 'パスワードリセットメールを送信しました。',
    },
    'vpfdzl3u': {
      'en': 'Email required!',
      'de': 'E-Mail erforderlich!',
      'ja': 'メールアドレスが必要です!',
    },
    'nug5p501': {
      'en': 'Phone number required and has to start with +.',
      'de': 'Telefonnummer erforderlich und muss mit + beginnen.',
      'ja': '電話番号は必須で、+ で始まる必要があります。',
    },
    '7lo5s5n2': {
      'en': 'Passwords don\'t match',
      'de': 'Passwörter stimmen nicht überein',
      'ja': 'パスワードが一致しません',
    },
    '3haelhid': {
      'en': 'Enter SMS verification code',
      'de': 'Geben Sie den SMS-Bestätigungscode ein',
      'ja': 'SMS認証コードを入力してください',
    },
    '6qgwe53g': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
      'de':
          'Seit der letzten Anmeldung ist zu viel Zeit vergangen. Melden Sie sich erneut an, bevor Sie Ihr Konto löschen.',
      'ja': '前回のサインインから時間が経ちすぎています。アカウントを削除する前にもう一度サインインしてください。',
    },
    'jmjycs4n': {
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
      'de':
          'Seit der letzten Anmeldung ist es zu lange her. Melden Sie sich erneut an, bevor Sie Ihre E-Mail aktualisieren.',
      'ja': '前回のサインインから時間が経ちすぎています。メールを更新する前にもう一度サインインしてください。',
    },
    'jjdb1l2z': {
      'en': 'Email change confirmation email sent!',
      'de': 'E-Mail zur Bestätigung der E-Mail-Änderung gesendet!',
      'ja': 'メールアドレス変更確認メールを送信しました。',
    },
    'arun1945': {
      'en': 'Email already in use by another account',
      'de': 'E-Mail wird bereits von einem anderen Konto verwendet',
      'ja': 'メールアドレスは既に別のアカウントで使用されています',
    },
    'ycndrg4i': {
      'en':
          'The supplied auth credential is incorrect, mailformed or has expired',
      'de':
          'Die angegebenen Authentifizierungsdaten sind falsch, wurden per E-Mail übermittelt oder sind abgelaufen',
      'ja': '提供された認証資格情報が正しくないか、メール形式であるか、期限切れです',
    },
    'pquzm91j': {
      'en': 'Invalid file format',
      'de': 'Ungültiges Dateiformat',
      'ja': '無効なファイル形式',
    },
    'ymecmle0': {
      'en': 'Uploading file...',
      'de': 'Datei wird hochgeladen...',
      'ja': 'ファイルをアップロードしています...',
    },
    '3belwmph': {
      'en': 'Success!',
      'de': 'Erfolg!',
      'ja': '成功！',
    },
    'crlat6zs': {
      'en': 'Failed to upload data',
      'de': 'Daten konnten nicht hochgeladen werden',
      'ja': 'データのアップロードに失敗しました',
    },
    '11vo54ai': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'e1lysev9': {
      'en': 'Choose Source',
      'de': 'Quelle auswählen',
      'ja': 'ソースを選択',
    },
    '9tws2a1y': {
      'en': 'Gallery',
      'de': 'Galerie',
      'ja': 'ギャラリー',
    },
    'dpsjopc3': {
      'en': 'Gallery (Photo)',
      'de': 'Galerie (Foto)',
      'ja': 'ギャラリー（写真）',
    },
    'jkw5dju5': {
      'en': 'Gallery (Video)',
      'de': 'Galerie (Video)',
      'ja': 'ギャラリー（ビデオ）',
    },
    'cqfxytrc': {
      'en': 'Camera',
      'de': 'Kamera',
      'ja': 'カメラ',
    },
    'iyqtbg5l': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'n7xxu8t2': {
      'en': '',
      'de': '',
      'ja': '',
    },
    '2biy8evf': {
      'en': '',
      'de': '',
      'ja': '',
    },
    'xgwnchts': {
      'en': '',
      'de': '',
      'ja': '',
    },
  },
].reduce((a, b) => a..addAll(b));
