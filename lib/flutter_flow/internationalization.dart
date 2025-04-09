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

  static List<String> languages() => ['en', 'de'];

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
  }) =>
      [enText, deText][languageIndex] ?? '';

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
      'en': 'Ready to HIIT the Beat again!?',
      'de': 'Ready to HIIT the Beat again?',
    },
    'jpj2h32k': {
      'en': 'Specify the name',
      'de': 'Gib deinen Namen an',
    },
    '3ajxrnu5': {
      'en': 'Total points',
      'de': 'Gesamtpunktzahl',
    },
    'tl3nwgo4': {
      'en': '',
      'de': '',
    },
    'c31rrmc2': {
      'en': 'New Seasons you can be interested in',
      'de': 'Neue Seasons, welche dich interessieren könnten',
    },
    '6i91y6f5': {
      'en': 'See all',
      'de': 'Alle sehen',
    },
    'jvnot9x8': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AuthPage
  {
    'ldlvrz96': {
      'en': 'JOIN THE COMMUNITY TODAY!',
      'de':
          'THROUGH FITNESS & MUSIC WE EMPOWER, CONNECT & TRANSFORM LIVES. WORLDWIDE',
    },
    'uctmduz2': {
      'en':
          'Everything you need to unleash your highest potential & get fitter than ever before',
      'de':
          'Alles, was du brauchst, um fitter und beweglicher zu werden – und das mit Spaß! Erlebe das abwechslungsreiche Workout der Welt',
    },
    '0idktth0': {
      'en': 'Let´s Go!',
      'de': 'Let\'s go!',
    },
    '2om38dqf': {
      'en': 'Continue as a guest',
      'de': 'Weiter als Gast',
    },
    'w1gkszh2': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // LoginPage
  {
    '0b03u0ly': {
      'en': 'Log in',
      'de': 'Einloggen',
    },
    'hx3a7fwb': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'ls0i1yda': {
      'en': '',
      'de': '',
    },
    'h1zqnrh4': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'i14xpeae': {
      'en': '',
      'de': '',
    },
    '65uwhj9e': {
      'en': 'Log in',
      'de': 'Einloggen',
    },
    'um9xxlwd': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
    },
    's2ir1gfg': {
      'en': 'Wrong email or password',
      'de': 'Falsche E-Mail oder falsches Passwort',
    },
    'lmk31nfw': {
      'en': 'Min 6 symbols',
      'de': 'Mindestens 6 Symbole',
    },
    'kpmori2z': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
    },
    'nms2mp58': {
      'en': '',
      'de': '',
    },
    'k6i77tfl': {
      'en': 'Wrong email or password',
      'de': 'Falsche E-Mail oder falsches Passwort',
    },
    'qlovy6lc': {
      'en': 'Min 6 symbols',
      'de': 'Mindestens 6 Symbole',
    },
    'nwzovgo8': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
    },
    'icy1o40j': {
      'en': '',
      'de': '',
    },
    'ehfrnzwl': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
    },
    'wq7qouzf': {
      'en': ' ',
      'de': ' ',
    },
    'k33phmp9': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
    },
    '7jtsjcbs': {
      'en': ' ',
      'de': ' ',
    },
    '5a9zo0d2': {
      'en': 'Create an account',
      'de': 'Konto erstellen',
    },
    'bemqp759': {
      'en': 'Restore password',
      'de': 'Passwort wiederherstellen',
    },
    'n1zle6um': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // RestorePasswordPage
  {
    'e3r2xp78': {
      'en': 'Specify the email of the account. We’ll send a link to it',
      'de':
          'Gib die E-Mail-Adresse deines Kontos an. Wir senden dir einen Link zu',
    },
    'xst6ms61': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'ajw1w4hx': {
      'en': '',
      'de': '',
    },
    'm9k8h0bc': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
    },
    'mzxyqw4w': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
    },
    '8q6mgrph': {
      'en': 'Fill in the field',
      'de': 'Bitte fülle das Feld aus',
    },
    'gmrns7b0': {
      'en': 'Invalid format',
      'de': 'Invalid format',
    },
    '3zdqxqxr': {
      'en': '',
      'de': '',
    },
    'yk8vruk7': {
      'en': 'Send link',
      'de': 'Link senden',
    },
    'luay2p8d': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // SignupPage
  {
    'qpe0i4iv': {
      'en': 'Sign up',
      'de': 'Melden Sie sich an',
    },
    'tpa0swpa': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'ng6iqkp9': {
      'en': '',
      'de': '',
    },
    'r3ap7ve4': {
      'en': 'Email format: example@gmail.com',
      'de': 'E-Mail-Format: example@gmail.com',
    },
    'f7gxcf2d': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'd0cbunsw': {
      'en': '',
      'de': '',
    },
    'tnk23wy1': {
      'en': 'Minimun 8 symbols, 1 uppercase, 1 lowercase, 1 digit',
      'de': 'Minimum 8 Symbole, 1 Großbuchstabe, 1 Kleinbuchstabe, 1 Ziffer',
    },
    'y73tgpgd': {
      'en': 'Confirm password',
      'de': 'Passwort bestätigen',
    },
    't9m03n10': {
      'en': '',
      'de': '',
    },
    'pfmh482s': {
      'en': 'Passwords don’t match',
      'de': 'Passwörter stimmen nicht überein',
    },
    'd938p4wk': {
      'en': 'Sign up',
      'de': 'Anmelden',
    },
    '832zg69i': {
      'en': 'By continuing you agree to ',
      'de': 'Indem du fortfährst, stimmst du den ',
    },
    'k14a619k': {
      'en': 'privacy policy',
      'de': 'Datenschutzbestimmungen',
    },
    's2snf0yf': {
      'en': ' and ',
      'de': ' und ',
    },
    'nq4gnljx': {
      'en': 'terms of use',
      'de': 'Nutzungsbedingungen',
    },
    'zekj8yvj': {
      'en': ' ',
      'de': ' zu',
    },
    'xdayj45h': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
    },
    'ma1eu5tp': {
      'en': ' ',
      'de': ' ',
    },
    '9otzq9f4': {
      'en': 'Continue with Apple',
      'de': 'Weiter mit Apple',
    },
    '1fhh2vy2': {
      'en': ' ',
      'de': ' ',
    },
    'iais1jrj': {
      'en': 'Already have an account?',
      'de': 'Du hast bereits ein Konto?',
    },
    'tzz4jrav': {
      'en': 'Log in',
      'de': 'Einloggen',
    },
    'skf0wkcd': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // EmailVerificationPage
  {
    '3ia1zkt2': {
      'en': 'We sent the link to the',
      'de': 'Wir haben den Link gesendet an',
    },
    't7ecpc98': {
      'en': 'Follow this link to confirm email',
      'de': 'Folge diesem Link, um die E-Mail zu bestätigen',
    },
    'uhvqp6ie': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'hfm8dggh': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'mofwqd4n': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // ChangeEmailPage
  {
    'hb1fajmx': {
      'en': 'Change email',
      'de': 'E-Mail ändern',
    },
    '92f2t3t3': {
      'en': 'Specify a new email. We’ll send a link to it',
      'de':
          'Geben Sie eine neue E-Mail-Adresse an. Wir senden Ihnen einen Link dorthin.',
    },
    '7ggrr4md': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'pu2oymgj': {
      'en': '',
      'de': '',
    },
    'eslscnx6': {
      'en': 'Send link',
      'de': 'Link senden',
    },
    '0f4p6r2s': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // EmailChangeSendLinkPage
  {
    'qt0qsldk': {
      'en': 'We sent the link to the',
      'de': 'Wir haben den Link an die',
    },
    'rvff6jvm': {
      'en': 'Follow this link to change email',
      'de': 'Folgen Sie diesem Link, um die E-Mail-Adresse zu ändern',
    },
    'ma77uizh': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'urbuh3wp': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'rahceb1b': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // PhoneEditPage
  {
    'bqk7btp1': {
      'en': 'Add phone number',
      'de': 'Telefonnummer hinzufügen',
    },
    'orboc767': {
      'en': 'Specify a phone number',
      'de': 'Gebe deine Handynummer an',
    },
    'rjvc7b2z': {
      'en': 'It’ll help us research and improve your experience',
      'de': 'Es wird uns helfen, dein Workout Erlebnis zu verbessern',
    },
    's7qpwtrt': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
    },
    'r69m3gmj': {
      'en': '',
      'de': '',
    },
    '8ohtu3pm': {
      'en': 'Save',
      'de': 'Speichern',
    },
    '64tfehk4': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // TermsPage
  {
    'qd3rx64d': {
      'en': 'Terms & conditions',
      'de': 'Allgemeine Geschäftsbedingungen',
    },
    'wfo5zhc6': {
      'en':
          'TERMS AND CONDITIONS – BREAKLETICS WORKOUTS\n\n1. Introduction\n\n',
      'de': 'AGB – BREAKLETICS WORKOUTS\n\n1. Einleitung\n\n',
    },
    '11jk5d9h': {
      'en':
          'HIIT the Beat & BREAKLETICS combines functional training with breakdance concepts. It addresses all of those, who enjoy movement and who are interested in trying a new, extremely motivating way of doing sports. The exercises are available in multiple variations and difficulties, that upon each other. Therefore, participants can be supported according to their level of fitness and stay motivated for the long-term. Our online work outs and courses are required to enhance your physical fitness, strengthen your self-confidence and to enjoy the movement. There is no prior knowledge required on the area of dance or acrobatics. Frequent and dynamic variations, different levels of difficulty and continuous motivation through music and trainers ensure that even experienced participants won’t get bored. The following General Terms and Conditions of Business set out the legal framework for using Breakletics and the services that we offer. Therefore, please read these General Terms and Conditions of Business carefully.\n\n',
      'de':
          'HIIT the Beat & BREAKLETICS verbindet funktionelles Training mit Breakdance-Konzepten. Es richtet sich an alle, die Spaß an Bewegung haben und eine neue, äußerst motivierende Sportart ausprobieren möchten. Die Übungen sind in mehreren Variationen und Schwierigkeitsgraden verfügbar, die aufeinander aufbauen. So können die Teilnehmer entsprechend ihres Fitnesslevels gefördert und langfristig motiviert werden. Unsere Online-Workouts und Kurse sind darauf ausgerichtet, deine körperliche Fitness zu steigern, dein Selbstbewusstsein zu stärken und Spaß an der Bewegung zu haben. Es sind keine Vorkenntnisse im Bereich Tanz oder Akrobatik erforderlich. Häufige und dynamische Variationen, unterschiedliche Schwierigkeitsgrade und kontinuierliche Motivation durch Musik und Trainer sorgen dafür, dass auch erfahrenen Teilnehmern keine Langeweile aufkommt. Die nachfolgenden Allgemeinen Geschäftsbedingungen legen den rechtlichen Rahmen für die Nutzung von Breakletics und den von uns angebotenen Diensten fest. Bitte lies dir diese Allgemeinen Geschäftsbedingungen daher sorgfältig durch.\n\n',
    },
    'izylydxv': {
      'en':
          '2. Scope\n\n2.1. Parties to the contract and subject matter of the contract\n\n',
      'de':
          '2. Geltungsbereich\n\n2.1. Vertragsparteien und Vertragsgegenstand\n\n',
    },
    'jgqjdkni': {
      'en':
          'These General Terms and Conditions of Business form the basis of the user contract being formed between you and us, Breakletics GmbH, Mont-Cenis-Str. 6, 44623 Herne (hereinafter referred to as “us” or “we”). The subject matter of this contract is the use, free of charge or for a fee, of the services we offer under the name HIIT the Beat & BREAKLETICS via our website www.hiit-the-beat.com, other BREAKLETICS® websites or via our software applications (hereinafter referred to individually as “Breakletics Service” or collectively as “Breakletics Services” or in general “Breakletics” or \"HIIT the Beat\")..\n\n',
      'de':
          'Diese Allgemeinen Geschäftsbedingungen bilden die Grundlage des zwischen Ihnen und uns, der Breakletics GmbH, Mont-Cenis-Str. 6, 44623 Herne (nachfolgend „uns“ oder „wir“) zustande kommenden Nutzungsvertrages. Gegenstand dieses Vertrages ist die unentgeltliche oder entgeltliche Nutzung der von uns unter der Bezeichnung HIIT the Beat & BREAKLETICS über unsere Website www.hiit-the-beat.com, andere BREAKLETICS®-Websites oder über unsere Software-Applikationen angebotenen Dienste (nachfolgend einzeln „Breakletics-Dienst“ oder gemeinsam „Breakletics-Dienste“ oder allgemein „Breakletics“ oder „HIIT the Beat“).\n\n',
    },
    'c9iuu5f6': {
      'en': '2.2. Terms and conditions for participating\n\n',
      'de': '2.2. Teilnahmebedingungen\n\n',
    },
    'epmwbahx': {
      'en':
          'A condition for opening a user account and using the Breakletics Services is that you are at least 18 years of age and have full legal capacity. HIIT the Beat & BREAKLETICS is intended exclusively for consumers. The legal definition of a consumer is every natural person that enters into a legal transaction for reasons that cannot be chiefly attributed to either their commercial or their self-employed occupation. Use of HIIT the Beat & BREAKLETICS for commercial purposes of any kind is expressly prohibited.\n\n',
      'de':
          'Voraussetzung für die Eröffnung eines Benutzerkontos und die Nutzung der Breakletics-Dienste ist, dass du mindestens 18 Jahre alt und voll geschäftsfähig bist. HIIT the Beat & BREAKLETICS richtet sich ausschließlich an Verbraucher. Verbraucher ist im Sinne der gesetzlichen Definition jede natürliche Person, die ein Rechtsgeschäft zu Zwecken abschließt, die überwiegend weder ihrer gewerblichen noch ihrer selbständigen beruflichen Tätigkeit zugerechnet werden können. Eine Nutzung von HIIT the Beat & BREAKLETICS zu gewerblichen Zwecken jedweder Art ist ausdrücklich untersagt.\n\n',
    },
    'yk8ovu46': {
      'en': '2.3. Additional terms and conditions\n\n',
      'de': '2.3. Zusätzliche Bedingungen\n\n',
    },
    'hlikr382': {
      'en':
          'We reserve the right to agree to additional terms and conditions for individual Breaketics Services. We will, however, notify you of this in good time prior to use.\n\n',
      'de':
          'Wir behalten uns vor, für einzelne Breaketics Dienste zusätzliche Bedingungen zu vereinbaren. Hierauf werden wir Dich jedoch rechtzeitig vor der Nutzung hinweisen.\n\n',
    },
    't636bn94': {
      'en':
          '3. Your Health\n\n3.1. Terms and conditions with regard to your health\n\n',
      'de':
          '3. Ihre Gesundheit\n\n3.1. Bedingungen in Bezug auf Ihre Gesundheit\n\n',
    },
    'm3z5s105': {
      'en':
          'Use of the HIIT the Beat & BREAKLETICS Services is at your own risk. In any case a condition for the use of the HIIT the Beat & BREAKLETICS Services is that you must be in a good general state of health. If you have knowledge of any pre-existing medical conditions we advise you to seek medical advice from a doctor urgently before you start the Breakletics Services (such as trainings or coachings). This applies in particular if you have knowledge of one or more of the following medical complaints/conditions/procedures: (i) cardiovascular disease, (ii) lung or respiratory disease (including asthma), (iii), spinal and/or joint problems, (iv) neuromuscular disease, (v) surgical procedures, (vi) any other health issues\n\nIn case of Breakletics Services related to nutrition, you are responsible for verifying that the foods and nutrients recommended as part of the coaching or guide do not contain any ingredients or contents to which you are allergic or which may cause food intolerance.\n\nFor our female customers it is important to mention, that our plans should not be used by pregnant or breastfeeding mothers.\n\nThe following general rules apply: Listen to what your body is telling you. Before using the Breakletics Services for the first time or while using Breakletics, if you have any doubts about your health (e.g. because you are experiencing considerable pain, a general malaise, shortness of breath, nausea or dizziness) consult your doctor before starting or continuing with Breakletics. Furthmore, please always ensure that you warm up appropriately. Never start a work out without a warm up.\n\n',
      'de':
          'Die Nutzung der HIIT the Beat & BREAKLETICS-Dienste erfolgt auf eigene Gefahr. Voraussetzung für die Nutzung der HIIT the Beat & BREAKLETICS-Dienste ist in jedem Fall, dass Sie sich in einem guten allgemeinen Gesundheitszustand befinden. Wenn Sie Kenntnis von Vorerkrankungen haben, raten wir Ihnen, vor Beginn der Breakletics-Dienste (wie Trainings oder Coachings) dringend ärztlichen Rat einzuholen. Dies gilt insbesondere, wenn Sie Kenntnis von einer oder mehreren der folgenden medizinischen Beschwerden/Erkrankungen/Verfahren haben: (i) Herz-Kreislauf-Erkrankungen, (ii) Lungen- oder Atemwegserkrankungen (einschließlich Asthma), (iii) Wirbelsäulen- und/oder Gelenkprobleme, (iv) neuromuskuläre Erkrankungen, (v) chirurgische Eingriffe, (vi) sonstige gesundheitliche Probleme\n\nBei Breakletics-Diensten im Zusammenhang mit Ernährung sind Sie dafür verantwortlich, zu überprüfen, dass die im Rahmen des Coachings oder Leitfadens empfohlenen Lebensmittel und Nährstoffe keine Zutaten oder Inhaltsstoffe enthalten, gegen die Sie allergisch sind oder die eine Nahrungsmittelunverträglichkeit verursachen können.\n\nFür unsere weiblichen Kunden ist es wichtig zu erwähnen, dass unsere Pläne nicht von schwangeren oder stillenden Müttern verwendet werden sollten. \n\nEs gelten folgende allgemeine Regeln: Hören Sie auf das, was Ihnen Ihr Körper sagt. Wenn Sie vor der ersten Nutzung der Breakletics-Dienste oder während der Nutzung von Breakletics Zweifel an Ihrem Gesundheitszustand haben (z. B. weil Sie erhebliche Schmerzen, allgemeines Unwohlsein, Kurzatmigkeit, Übelkeit oder Schwindel verspüren), konsultieren Sie Ihren Arzt, bevor Sie mit Breakletics beginnen oder fortfahren. Achten Sie außerdem immer darauf, dass Sie sich angemessen aufwärmen. Beginnen Sie ein Training nie ohne Aufwärmen.\n\n',
    },
    'sm1sodu1': {
      'en': '3.2. No substitute for medical advice\n\n',
      'de': '3.2. Kein Ersatz für ärztlichen Rat\n\n',
    },
    'ffp0wtwt': {
      'en':
          'The services and information offered by Breakletics and the Breakletics Services do not constitute medical advice or a doctor’s advice. Nor are they a substitute for a medical examination or treatment by a doctor.\n\n',
      'de':
          'Die von Breakletics und den Breakletics-Diensten angebotenen Dienste und Informationen stellen keine medizinische Beratung oder ärztliche Beratung dar. Sie sind auch kein Ersatz für eine medizinische Untersuchung oder Behandlung durch einen Arzt.\n\n',
    },
    '6eo5h3nf': {
      'en': '3.3. Training-/Dietary Methods\n\n',
      'de': '3.3. Trainings-/Ernährungsmethoden\n\n',
    },
    'xpfrkxye': {
      'en':
          'Fitness and/or nutritional advice is subject to constantly evolving knowledge in relation to health science, nutritional science and sports science. Although we base our trainings and nutritional tips on current studies and knowledge, we do not guarantee that these reflect the most up to date research findings or knowledge.\n\n',
      'de':
          'Fitness- und/oder Ernährungsberatungen unterliegen den sich ständig weiterentwickelnden Erkenntnissen der Gesundheitswissenschaften, Ernährungswissenschaften und Sportwissenschaften. Obwohl wir unsere Trainings und Ernährungstipps auf aktuelle Studien und Erkenntnisse stützen, übernehmen wir keine Garantie dafür, dass diese den aktuellsten Forschungsergebnissen und Erkenntnissen entsprechen.\n\n',
    },
    'yu6zti7y': {
      'en':
          '4. Breakletics Services and Prices\n\n4.1. Services free of charge or for a fee\n\n',
      'de':
          '4. Breakletics-Dienste und Preise\n\n4.1. Kostenlose oder kostenpflichtige Dienste\n\n',
    },
    '5lvxbu85': {
      'en':
          'The scope of the services included in Breakletics and the HIIT the Beat & BREAKLETICS Services and available for use by you depends on the type of HIIT the Beat & BREAKLETICS Service and whether you use the Breakletics Services free of charge or for a fee. If you use it free of charge you only have access to certain basic functions and information of the respective Breakletics Service. A more extensive range of functions is available to you if you enable the respective content modules separately in return for a one-off payment or as part of a subscription for the respective Breakletics Service. In case of nutrition coachings, please note that the foods suggested as part of the coaching are not part of the Breakletics Services and need to be purchased by you separately at your own cost.\n\n',
      'de':
          'Der Umfang der in Breakletics und den HIIT the Beat & BREAKLETICS Diensten enthaltenen und von Dir nutzbaren Dienste hängt von der Art des HIIT the Beat & BREAKLETICS Dienstes ab und davon, ob Du die Breakletics Dienste unentgeltlich oder entgeltlich nutzt. Bei der unentgeltlichen Nutzung hast Du lediglich Zugriff auf bestimmte Basisfunktionen und Informationen des jeweiligen Breakletics Dienstes. Ein umfangreicherer Funktionsumfang steht Dir zur Verfügung, wenn Du die jeweiligen Inhaltsmodule separat gegen eine einmalige Zahlung oder im Rahmen eines Abonnements des jeweiligen Breakletics Dienstes freischaltest. Bei Ernährungscoachings beachte bitte, dass die im Rahmen des Coachings vorgeschlagenen Lebensmittel nicht Bestandteil der Breakletics Dienste sind und von Dir separat und auf eigene Kosten erworben werden müssen.\n\n',
    },
    'ty2y8nz5': {
      'en': '4.2. Prices\n\n',
      'de': '4.2. Preise\n\n',
    },
    '71xw0cav': {
      'en':
          'Please consult the website www.hiit-the-beat.com for information on the respective current pricing and subscription models and the services that these include. All prices stated include the applicable VAT.\n\n',
      'de':
          'Die jeweils aktuellen Preis- und Abomodelle sowie die darin enthaltenen Leistungen findest du auf der Website www.hiit-the-beat.com. Alle angegebenen Preise verstehen sich inklusive der jeweils gültigen Mehrwertsteuer.\n\n',
    },
    '9ql8r61n': {
      'en': '5. User Account\n\n5.1. Registration process\n\n',
      'de': '5. Benutzerkonto\n\n5.1. Registrierungsprozess\n\n',
    },
    'vsj8gjz8': {
      'en':
          'In order to use the Breakletics Services you must first register and open a user account. The creation of an account can be done directly on our webpage www.breakletics.com. In the frame of this registration, we ask you to accept these terms and conditions and privacy terms. Alternatively you can open a user account by using your Facebook account. The registration process is completed, once you have entered your Facebook account details and clicked the “Confirm” button.\n\n',
      'de':
          'Um die Breakletics-Dienste nutzen zu können, müssen Sie sich zunächst registrieren und ein Benutzerkonto eröffnen. Die Erstellung eines Kontos kann direkt auf unserer Webseite www.breakletics.com erfolgen. Im Rahmen dieser Registrierung bitten wir Sie, diese Allgemeinen Geschäftsbedingungen und Datenschutzbestimmungen zu akzeptieren. Alternativ können Sie ein Benutzerkonto über Ihr Facebook-Konto eröffnen. Der Registrierungsvorgang ist abgeschlossen, sobald Sie Ihre Facebook-Kontodaten eingegeben und auf die Schaltfläche „Bestätigen“ geklickt haben.\n\n',
    },
    '4e3d0hbh': {
      'en': '6. Conclusion of a Contract\n\n',
      'de': '6. Vertragsabschluss\n\n',
    },
    'h3apvdkq': {
      'en':
          'How the respective contract is formed depends on the method by which you register for Breakletics for the first time and whether you sign up for additional fee-based services.\n\n',
      'de':
          'Wie der jeweilige Vertrag zustande kommt, hängt davon ab, auf welchem Weg Du Dich erstmals für Breakletics anmeldest und ob Du weitere kostenpflichtige Dienste buchst.\n\n',
    },
    'ki77838z': {
      'en': '6.1. Online registration on the website \n',
      'de': '6.1. Online-Registrierung auf der Website\n',
    },
    'wzkpsefd': {
      'en': 'www.hiit-the-beat.com\n\n',
      'de': 'www.hiit-the-beat.com\n\n',
    },
    '31k76pf9': {
      'en':
          'When signing up for our website www.breakletics.com a contract of usage between you and us is concluded after the completion of the registration process.\n\n',
      'de':
          'Bei der Registrierung auf unserer Website www.breakletics.com kommt nach Abschluss des Registrierungsvorgangs ein Nutzungsvertrag zwischen Ihnen und uns zustande.\n\n',
    },
    'ib00fpxh': {
      'en':
          '6.2. Conclusion of a contract for one off additional services for a fee or for subscriptions\n\n',
      'de':
          '6.2. Vertragsabschluss über einmalige entgeltliche Zusatzleistungen oder Abonnements\n\n',
    },
    'xuqboe95': {
      'en':
          'You can purchase individual additional services either by paying a one-off fee or as part of a subscription. If you purchase the respective additional service via the website www.breakletics.com (payment provider Digistore24), the contract is formed when you click on the field “Buy now”, or a similar field, and successfully enter your payment details.\n\n',
      'de':
          'Du kannst einzelne Zusatzleistungen entweder durch Zahlung einer einmaligen Gebühr oder im Rahmen eines Abonnements erwerben. Wenn Du die jeweilige Zusatzleistung über die Website www.breakletics.com (Zahlungsanbieter Digistore24) kaufst, kommt der Vertrag zustande, wenn Du auf das Feld „Jetzt kaufen“ oder ein ähnliches Feld klickst und Deine Zahlungsdaten erfolgreich eingibst.\n\n',
    },
    'ui3zn03n': {
      'en': '6.3. Correction of input errors\n\n',
      'de': '6.3. Berichtigung von Eingabefehlern\n\n',
    },
    'fv8y3eec': {
      'en':
          'If you would like to purchase a one-off additional service or a subscription on our website www.breakletics.com , you can interrupt the process at any time and correct any errors until you have successfully entered your payment details. We are not going to ask you for any payment information, since you purchase the service from Digistore24. Please contact Digistore24, if you would like to correct potential input errors.\n\n',
      'de':
          'Wenn Sie auf unserer Website www.breakletics.com einen einmaligen Zusatzdienst oder ein Abonnement erwerben möchten, können Sie den Vorgang bis zur erfolgreichen Eingabe Ihrer Zahlungsdaten jederzeit abbrechen und Eingabefehler korrigieren. Wir werden von Ihnen keine Zahlungsdaten abfragen, da Sie den Dienst bei Digistore24 erwerben. Bitte wenden Sie sich an Digistore24, wenn Sie Eingabefehler korrigieren möchten.\n\n',
    },
    'vlmser1l': {
      'en': '7. NEWSLETTER\n\n',
      'de': '7. NEWSLETTER\n\n',
    },
    'g5u2r96w': {
      'en':
          'Breakletics sends newsletters to registrated users. By accepting this AGB, the user accepts, that he will be sent the Brealetics Newsletter. With each receipt newsletter, the user has the opportunity to unsubscribe the newsletter. From this point on, the user will not receive the newsletter anymore.\n\n',
      'de':
          'Breakletics versendet an registrierte Nutzer Newsletter. Mit der Annahme dieser AGB erklärt sich der Nutzer mit der Zusendung des Breakletics Newsletters einverstanden. Bei jedem Newsletterempfang hat der Nutzer die Möglichkeit, den Newsletter abzubestellen. Ab diesem Zeitpunkt erhält der Nutzer keinen weiteren Newsletter mehr.\n\n',
    },
    'ps1dtmng': {
      'en': '8. Term of Validity\n\n8.1. User contract\n\n',
      'de': '8. Gültigkeitsdauer\n\n8.1. Nutzungsvertrag\n\n',
    },
    'jc7z55zd': {
      'en':
          'The user contract concluded between you and us once you register your account is valid for an indefinite period.\n\n',
      'de':
          'Der zwischen Ihnen und uns durch die Registrierung Ihres Accounts geschlossene Nutzungsvertrag gilt auf unbestimmte Zeit.\n\n',
    },
    '4d3hlx6o': {
      'en': '8.2. One-off additional services\n\n',
      'de': '8.2. Einmalige Zusatzleistungen\n\n',
    },
    'vui4k6jh': {
      'en':
          'One-off additional services may be offered for a fixed term. They will then end automatically at the end of the term without needing to be cancelled.\n\n',
      'de':
          'Einmalige Zusatzleistungen können für eine festgelegte Laufzeit angeboten werden. Diese enden dann automatisch zum Ende der Laufzeit, ohne dass es einer Kündigung bedarf.\n\n',
    },
    'kqtq006o': {
      'en': '8.3. Subscriptions\n\n',
      'de': '8.3. Abonnements\n\n',
    },
    't3jhk2h2': {
      'en':
          'Our subscriptions are offered with varying minimum terms of validity and are automatically renewed for the same minimum term that has been selected until you or we cancel them.\n\nIn order to avoid any misunderstanding, please note that the term of a subscription is determined by calendar and is independent from your use or extent of your use of the respective Breakletics Service.\n\n',
      'de':
          'Unsere Abonnements werden mit unterschiedlichen Mindestlaufzeiten angeboten und verlängern sich automatisch um die jeweils gewählte Mindestlaufzeit, bis sie von Dir oder uns gekündigt werden. \n\nUm Missverständnissen vorzubeugen, beachte bitte, dass die Laufzeit eines Abonnements kalendermäßig festgelegt ist und unabhängig von Deiner Nutzung bzw. Deinem Nutzungsumfang des jeweiligen Breakletics-Dienstes ist.\n\n',
    },
    '7654ar40': {
      'en': '9. Terms and Conditions of Payment\n\n9.1. Collection of fees\n\n',
      'de': '9. Zahlungsbedingungen \n\n9.1. Erhebung von Gebühren\n\n',
    },
    'pvseqxy7': {
      'en':
          'Fees are collected when the contract is concluded for purchases of additional services through the payment of a one-off sum. The fee is collected for the relevant minimum term when the contract is concluded for the purchase of a subscription. If the subscription is renewed\n\n',
      'de':
          'Die Entgelte werden bei Vertragsabschluss für den Erwerb zusätzlicher Dienste durch Zahlung eines einmaligen Betrags erhoben. Bei Vertragsabschluss für den Erwerb eines Abonnements wird die Gebühr für die jeweilige Mindestlaufzeit erhoben. Wird das Abonnement verlängert\n\n',
    },
    'pbbeomk4': {
      'en': '9.2. Payment default\n\n',
      'de': '9.2. Zahlungsverzug\n\n',
    },
    '79gjz5t0': {
      'en':
          'We reserve the right to assert further claims for late payments.\n\n',
      'de':
          'Die Geltendmachung weiterer Ansprüche wegen Zahlungsverzuges bleibt vorbehalten.\n\n',
    },
    '54h6ly65': {
      'en': '10. Payment Methods\n\n',
      'de': '10. Zahlungsmethoden\n\n',
    },
    'afmh446u': {
      'en':
          'An overview over our accepted payment methods can be found on the website: www.digistore24.com \nIf we incur costs and/or expenses because a payment is declined and this is your fault (e.g. because there are insufficient funds in the account or the credit card limit has already been exhausted), then we are entitled to bill you for the actual costs and/or expenses incurred. \nWhere there is a legitimate reason, we reserve the right for each purchase to refrain from offering certain payment methods and to specify alternative payment methods.\n\n',
      'de':
          'Eine Übersicht über unsere akzeptierten Zahlungsarten finden Sie auf der Website: www.digistore24.com \nEntstehen uns Kosten und/oder Aufwendungen, weil eine Zahlung abgelehnt wird und Sie dies zu vertreten haben (z.B. weil Ihr Konto nicht über die erforderliche Deckung verfügt oder das Kreditkartenlimit bereits ausgeschöpft ist), so sind wir berechtigt, Ihnen die tatsächlich entstandenen Kosten und/oder Aufwendungen in Rechnung zu stellen. \nAus berechtigten Gründen behalten wir uns bei jedem Kauf vor, bestimmte Zahlungsarten nicht anzubieten und alternative Zahlungsarten anzugeben.\n\n',
    },
    'uhh0b1hx': {
      'en': '11. Right to Cancel\n\n11.1. Cancellation policy\n\n',
      'de': '11. Widerrufsrecht\n\n11.1. Widerrufsbelehrung\n\n',
    },
    '8yugdc9t': {
      'en':
          'If you have entered into a contract for use of Breakletics or purchased a one-off additional service or a subscription, in each case, you are entitled to the following right of withdrawal. You have the right to cancel the contract within 14 days without stating any reasons. The cancellation period runs for 14 days from the conclusion of the contract.\n\nBreakletics GmbH\nMont-Cenis-Straße 6\n44623 Herne\ninfo@hiit-the-beat.com\n\nunequivocal notification (e.g. a letter sent by post, a fax or an email) of your decision to cancel the contract.\n\nIf you use this option, we will send you immediate (e.g. via email) acknowledgement of the receipt of such cancellation. To meet the deadline for cancellation it is sufficient to send us the notification of your wish to exercise your right of cancellation before the cancellation period expires.\n\n',
      'de':
          'Wenn Sie einen Vertrag zur Nutzung von Breakletics abgeschlossen oder einen einmaligen Zusatzdienst oder ein Abonnement erworben haben, steht Ihnen jeweils das folgende Widerrufsrecht zu. Sie haben das Recht, binnen 14 Tagen ohne Angabe von Gründen diesen Vertrag zu widerrufen. Die Widerrufsfrist beträgt 14 Tage ab Vertragsschluss.\n\nBreakletics GmbH \nMont-Cenis-Straße 6 \n44623 Herne \ninfo@hiit-the-beat.com\n\nmittels einer eindeutigen Erklärung (z.B. ein mit der Post versandter Brief, Telefax oder E-Mail) über Ihren Entschluss, diesen Vertrag zu widerrufen, informieren.\n\nMachen Sie von dieser Möglichkeit Gebrauch, so werden wir Ihnen unverzüglich (z.B. per E-Mail) eine Bestätigung über den Eingang eines solchen Widerrufs übermitteln. Zur Wahrung der Widerrufsfrist reicht es aus, dass Sie die Mitteilung über die Ausübung des Widerrufsrechts vor Ablauf der Widerrufsfrist absenden.\n\n',
    },
    'omzrmpqp': {
      'en': '12. Consequences of cancellation\n\n',
      'de': '12. Folgen des Widerrufs\n\n',
    },
    '3vz7vd1y': {
      'en':
          'If you cancel the contract we are obliged to refund all the payments that we have received from you, including the delivery costs (except for any additional costs incurred as a result of your choosing a different delivery method to the least expensive standard delivery method that we offer), promptly and at the latest within 14 days from the day on which we received the notification of your cancellation of the contract. For this refund we will use the same payment method that you used for the original transaction unless a different arrangement has been expressly agreed with you; under no circumstances will you be charged any fees in respect of this refund. If you asked for the services to start during the cancellation period you must pay us an appropriate amount, equal to the proportion of the services that have already been provided by the time you inform us that you are exercising your right to cancel this contract compared to the full scope of the services covered by the contract.\n\n',
      'de':
          'Wenn Sie diesen Vertrag widerrufen, haben wir Ihnen alle Zahlungen, die wir von Ihnen erhalten haben, einschließlich der Lieferkosten (mit Ausnahme der zusätzlichen Kosten, die sich daraus ergeben, dass Sie eine andere Art der Lieferung als die von uns angebotene, günstigste Standardlieferung gewählt haben), unverzüglich und spätestens binnen vierzehn Tagen ab dem Tag zurückzuzahlen, an dem die Mitteilung über Ihren Widerruf dieses Vertrags bei uns eingegangen ist. Für diese Rückzahlung verwenden wir dasselbe Zahlungsmittel, das Sie bei der ursprünglichen Transaktion eingesetzt haben, es sei denn, mit Ihnen wurde ausdrücklich etwas anderes vereinbart; in keinem Fall werden Ihnen wegen dieser Rückzahlung Entgelte berechnet. Haben Sie verlangt, dass die Dienstleistungen während der Widerrufsfrist beginnen sollen, so haben Sie uns einen angemessenen Betrag zu zahlen, der dem Anteil der bis zu dem Zeitpunkt, zu dem Sie uns von der Ausübung des Widerrufsrechts hinsichtlich dieses Vertrags unterrichten, bereits erbrachten Dienstleistungen im Vergleich zum Gesamtumfang der im Vertrag vorgesehenen Dienstleistungen entspricht.\n\n',
    },
    'efqeew33': {
      'en': '13. Lapse of the right of cancellation\n\n',
      'de': '13. Erlöschen des Widerrufsrechts\n\n',
    },
    '4owlal2e': {
      'en':
          'In the case of a contract for the provision of services the right of cancellation lapses if we have provided the service in full and only began to perform the service after you gave your express approval and simultaneously confirmed that you were aware that you would lose your right of cancellation if we had completely fulfilled the contract. \nIn the case of a contract for the delivery of digital content that is not stored on a physical data carrier the right of cancellation also lapses if we have begun to perform the contract after you gave your express approval and simultaneously confirmed that you were aware that you would lose your right of cancellation once we had begun to perform the contract.\n\n',
      'de':
          'Das Widerrufsrecht erlischt bei einem Vertrag zur Erbringung von Dienstleistungen, wenn wir die Dienstleistung vollständig erbracht haben und mit der Ausführung der Dienstleistung erst begonnen haben, nachdem Sie dazu Ihre ausdrückliche Zustimmung gegeben und gleichzeitig Ihre Kenntnis davon bestätigt haben, dass Sie Ihr Widerrufsrecht bei vollständiger Vertragserfüllung verlieren. \nBei einem Vertrag über die Lieferung von nicht auf einem körperlichen Datenträger gespeicherten digitalen Inhalten erlischt das Widerrufsrecht auch dann, wenn wir mit der Ausführung des Vertrags begonnen haben, nachdem Sie dazu Ihre ausdrückliche Zustimmung gegeben und gleichzeitig Ihre Kenntnis davon bestätigt haben, dass Sie Ihr Widerrufsrecht mit Beginn der Vertragserfüllung verlieren.\n\n',
    },
    'pau37e2r': {
      'en': '14. Liability for Defects\n\n14.1. Statutory Provisions\n\n',
      'de': '14. Mängelhaftung\n\n14.1. Gesetzliche Bestimmungen\n\n',
    },
    'vhehyub0': {
      'en':
          'Statutory provisions apply to claims due to defective services. Your consumer rights remain unaffected in any case.\n\n',
      'de':
          'Für Ansprüche wegen mangelhafter Leistungen gelten die gesetzlichen Vorschriften. Ihre Rechte als Verbraucher bleiben in jedem Fall unberührt.\n\n',
    },
    'k7tnva2g': {
      'en': '14.2. Disclaimer of guarantees\n\n',
      'de': '14.2. Gewährleistungsausschluss\n\n',
    },
    'z9zkzf9b': {
      'en':
          'We do not make any representations or guarantees that the use of the Breakletics Services will bring the training- or other result intended by you. We do not promise a concrete success. Also, the actual training result will depend on factors which cannot be influenced, such as, for example, physical disposition and preconditions. Consequently, results may vary strongly between individuals despite the same use of the Breakletics Services\n\n',
      'de':
          'Wir geben keine Zusicherungen oder Garantien dafür ab, dass die Nutzung der Breakletics-Dienste das von Dir beabsichtigte Trainings- oder sonstige Ergebnis bringt. Wir versprechen keinen konkreten Erfolg. Auch hängt das tatsächliche Trainingsergebnis von Faktoren ab, die nicht beeinflusst werden können, wie beispielsweise von körperlichen Voraussetzungen und Veranlagungen. Daher können die Ergebnisse trotz gleicher Nutzung der Breakletics-Dienste von Person zu Person stark variieren.\n\n',
    },
    'l3qqsfcx': {
      'en': '15. Liability\n\n15.1. General\n\n',
      'de': '15. Haftung\n\n15.1. Allgemeines\n\n',
    },
    '8qknkohw': {
      'en':
          'Concerning our Breakletics services, we are going to give you certain instructions like e.g. the right warm up and instructions for specific exercises and trainings. These instructions are to be followed by you closely. Otherwise you might have to face the risk of injuries and/or health risks.\n\nYou are required to respect our health annotations in Nr.3. Even if you are using our services frequently, you should never ignore the safety advice. \n\n',
      'de':
          'Im Rahmen unserer Breakletics-Leistungen erhalten Sie von uns bestimmte Hinweise, wie z. B. das richtige Aufwärmen und Anweisungen für bestimmte Übungen und Trainings. Diese Anweisungen sind von Ihnen genau zu befolgen. Andernfalls besteht die Gefahr von Verletzungen und/oder gesundheitlichen Risiken.\n\nSie sind verpflichtet, unsere Gesundheitshinweise in Nr. 3 zu beachten. Auch wenn Sie unsere Leistungen häufig nutzen, sollten Sie die Sicherheitshinweise niemals ignorieren.\n\n',
    },
    'oq7tsaam': {
      'en': '15.2. Liability for services provided free of charge\n\n',
      'de': '15.2. Haftung für unentgeltlich erbrachte Leistungen\n\n',
    },
    'mz0bocvt': {
      'en':
          'For services provided free of charge, we will be liable, regardless of the legal basis, exclusively for damage due to wilful conduct or gross negligence or the absence of a guaranteed feature. Our liability is not limited for wilful misconduct. In the event of gross negligence or the absence of a guaranteed feature our liability is limited to reasonable, foreseeable damage. Otherwise, our liability is excluded.\n\n',
      'de':
          'Bei unentgeltlich erbrachten Leistungen haften wir, gleich aus welchem Rechtsgrund, ausschließlich für Schäden, die auf Vorsatz oder grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft beruhen. Unsere Haftung ist bei Vorsatz nicht beschränkt. Bei grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft ist unsere Haftung auf den vernünftigerweise vorhersehbaren Schaden begrenzt. Im Übrigen ist unsere Haftung ausgeschlossen.\n\n',
    },
    'oe3trzns': {
      'en': '15.3. Liability for services provided for a fee\n\n',
      'de': '15.3. Haftung für entgeltliche Leistungen\n\n',
    },
    'rku3rm5m': {
      'en':
          'In the case of services provided for a fee we have, regardless of the legal basis, unlimited liability in principle for damage due to wilful conduct or gross negligence or the absence of a guaranteed feature.\nIf we breach a material contractual obligation as a result of slight negligence, our liability is limited to reasonable, foreseeable damage. A material contractual obligation is any obligation that is necessary to fulfil the purpose of the contract, and on the fulfilment of which you as the consumer can rely or ought to be able to rely.\n\nOur liability in the event of any injury to life, limb or health that is our fault remains unaffected by the above-mentioned limitations.\n\nOtherwise, our liability is excluded.\n\n',
      'de':
          'Bei entgeltlichen Leistungen haften wir, gleich aus welchem Rechtsgrund, grundsätzlich unbeschränkt für Schäden, die auf Vorsatz oder grober Fahrlässigkeit oder dem Fehlen einer garantierten Eigenschaft beruhen. \nVerletzen wir durch leichte Fahrlässigkeit eine wesentliche Vertragspflicht, ist unsere Haftung auf den vernünftigerweise vorhersehbaren Schaden begrenzt. Eine wesentliche Vertragspflicht ist jede Verpflichtung, die zur Erreichung des Vertragszwecks notwendig ist und auf deren Erfüllung Sie als Verbraucher vertrauen dürfen oder sollten. \n\nUnsere Haftung im Falle einer von uns zu vertretenden Verletzung von Leben, Körper und Gesundheit bleibt von den vorstehenden Beschränkungen unberührt. \n\nIm Übrigen ist unsere Haftung ausgeschlossen.\n\n',
    },
    'p6lin2o2': {
      'en': '15.4. Liability of our employees\n\n',
      'de': '15.4. Haftung unserer Mitarbeiter\n\n',
    },
    'miw7k3t8': {
      'en':
          'To the extent that our liability is excluded or limited, this exclusion or limitation also applies to our employees and agents.\n\n',
      'de':
          'Soweit unsere Haftung ausgeschlossen oder beschränkt ist, gilt dieser Ausschluss oder diese Beschränkung auch für unsere Mitarbeiter und Erfüllungsgehilfen.\n\n',
    },
    'js9juuko': {
      'en': '15.5. Product liability\n\n',
      'de': '15.5. Produkthaftung\n\n',
    },
    'asv0jmxc': {
      'en':
          'Claims under the German Product Liability Act remain unaffected by the above-mentioned liability exclusions or limitations.\n\n',
      'de':
          'Ansprüche nach dem Produkthaftungsgesetz bleiben von den vorstehenden Haftungsausschlüssen oder -beschränkungen unberührt.\n\n',
    },
    '6yrlztok': {
      'en': '16. Rights of Use over Breakletics Content\n\n',
      'de': '16. Nutzungsrechte an Breakletics-Inhalten\n\n',
    },
    'n7y81m8j': {
      'en':
          'The services offered by us are dependent on the unlocked contents. We grant you the single and non-transferrable right to use the contents in a non-commercial way within the frame of the contractual conditions. We inform you about the fact, that especially making content available to the public through e.g. webpages outside of Breakletics, is not permitted. The right of usage is eliminated once you are not granted access to the according service anymore (e.g. after cancellation of you subscription) or with the cancellation of the using conditions.\n\n',
      'de':
          'Die von uns angebotenen Dienste sind von den freigeschalteten Inhalten abhängig. Wir räumen Dir das einfache und nicht übertragbare Recht ein, die Inhalte im Rahmen der vertraglichen Bedingungen nicht kommerziell zu nutzen. Wir weisen Dich darauf hin, dass insbesondere die öffentliche Zugänglichmachung der Inhalte, z.B. über Webseiten außerhalb von Breakletics, nicht gestattet ist. Das Nutzungsrecht erlischt, wenn Dir der Zugriff auf den jeweiligen Dienst entzogen wird (z.B. nach Kündigung Deines Abonnements) oder mit Kündigung der Nutzungsbedingungen.\n\n',
    },
    'yrbx3mvu': {
      'en':
          '17. Responsibility for User-Generated Content\n\n17.1. Disclaimer of responsibility for third party content\n\n',
      'de':
          '17. Verantwortung für nutzergenerierte Inhalte\n\n17.1. Haftungsausschluss für Inhalte Dritter\n\n',
    },
    'ib8sasz3': {
      'en':
          'You are solely responsible for content that you post within the Breakletics Services. We accept no responsibility for this content, nor do we monitor it. (We retain the right to make use of relevant content for our social channel).\n\n',
      'de':
          'Für Inhalte, die Sie innerhalb der Breakletics-Dienste posten, sind ausschließlich Sie verantwortlich. Wir übernehmen für diese Inhalte keine Verantwortung und überwachen sie auch nicht. (Wir behalten uns das Recht vor, relevante Inhalte für unseren sozialen Kanal zu verwenden.)\n\n',
    },
    'ydoz9ho7': {
      'en': '17.2. ompliance with statutory provisions\n\n',
      'de': '17.2. Einhaltung gesetzlicher Bestimmungen\n\n',
    },
    'l0303fky': {
      'en':
          'When supplying your own content you are obliged to comply with all the applicable laws and other legislation of the Federal Republic of Germany. Regardless of whether or not it constitutes a criminal offence, it is prohibited to supply content of a pornographic, sexual, violent, racist, seditious, discriminatory, offensive and/or defamatory nature.\nIn addition you are also obliged to refrain from infringing any third-party rights. This applies in particular to personality rights of third parties as well as to third-party intellectual property rights (such as, for example, copyrights and trademark rights). In particular you must also hold the necessary rights over your profile picture or any other picture you post.\nWe are entitled to delete or remove any content that is unlawful or that infringes the abovementioned principles at any time. If you infringe the above-mentioned principles we are entitled to give you a warning or to temporarily block your user account or to cancel the user contract for good cause in accordance with clause 15.3.\n\n',
      'de':
          'Bei der Bereitstellung eigener Inhalte sind Sie verpflichtet, sämtliche geltenden Gesetze und sonstigen Vorschriften der Bundesrepublik Deutschland einzuhalten. Unabhängig davon, ob es sich um eine Straftat handelt oder nicht, ist die Bereitstellung von Inhalten pornografischer, sexueller, gewalttätiger, rassistischer, volksverhetzender, diskriminierender, beleidigender und/oder diffamierender Natur untersagt. \nDarüber hinaus sind Sie verpflichtet, keine Rechte Dritter zu verletzen. Dies gilt insbesondere für Persönlichkeitsrechte Dritter sowie für Rechte am geistigen Eigentum Dritter (wie beispielsweise Urheber- und Markenrechte). Insbesondere müssen Sie auch über die erforderlichen Rechte an Ihrem Profilbild oder anderen Bildern verfügen, die Sie veröffentlichen. \nWir sind berechtigt, Inhalte, die rechtswidrig sind oder gegen die vorgenannten Grundsätze verstoßen, jederzeit zu löschen oder zu entfernen. Bei einem Verstoß gegen die vorgenannten Grundsätze sind wir berechtigt, Sie abzumahnen oder Ihr Benutzerkonto vorübergehend zu sperren oder den Nutzungsvertrag aus wichtigem Grund gemäß Ziffer 15.3 zu kündigen.\n\n',
    },
    '1pryc2hu': {
      'en': '17.3. Indemnification\n\n',
      'de': '17.3. Schadloshaltung\n\n',
    },
    'w2ilxml6': {
      'en':
          'If you infringe the principles mentioned in clause 14.2 and that this is your fault (i.e. because you acted either negligently or with intent), you are obliged to indemnify us against any third-party claims arising from such infringement. We reserve the right to assert claims for damages and other claims\n\n',
      'de':
          'Sollten Sie gegen die in Ziffer 14.2 genannten Grundsätze verstoßen und dies ist Ihr Verschulden (also weil Sie entweder fahrlässig oder vorsätzlich gehandelt haben), sind Sie verpflichtet, uns von allen Ansprüchen Dritter freizustellen, die aus einem solchen Verstoß resultieren. Die Geltendmachung von Schadensersatzansprüchen und weiteren Ansprüchen bleibt vorbehalten.\n\n',
    },
    '3qvwxb9q': {
      'en': '18. Collected Data\n\n18.1. Nutzungsvertrag\n\n',
      'de': '18. Gesammelte Daten\n\n18.1. Nutzungsvertrag\n\n',
    },
    't3xjktet': {
      'en':
          'Breakletics is collecting data of its users through following services: Facebook SDK, Facebook Pixel, Google Analytics Tracking, Digistore24, Drift, Paypal, Stripe, Branch.io, Mailchimp, Vimeo, Youtube. Read more here, Privacy Policy.\n\n',
      'de':
          'Breakletics sammelt Daten seiner Benutzer über folgende Dienste: Facebook SDK, Facebook Pixel, Google Analytics Tracking, Digistore24, Drift, Paypal, Stripe, Branch.io, Mailchimp, Vimeo, Youtube. Lesen Sie hier mehr, Datenschutzrichtlinie.\n\n',
    },
    '35ng7cib': {
      'en': '19. Ending the Contract\n\n19.1. User contract\n\n',
      'de': '19. Beendigung des Vertrages\n\n19.1. Nutzungsvertrag\n\n',
    },
    'b3otr8id': {
      'en':
          'You have the right to cancel your user account at any time, without stating any reasons, thereby also ending your user contract. To do this you simply have to select the necessary settings in your profile. Please note that after you have cancelled your user account we will or may delete all the content and training results that you added, and you will no longer have access to content that you already purchased. If at the time of deleting your account you still have a current subscription or have booked an additional service that has not yet expired, any sum that you have already paid will not be refunded, not even on a pro rata basis.\n\nWe are entitled to cancel the user contract without stating any reasons by giving two (2) weeks’ written notice, but no earlier than at the end of the minimum contractual term or at the end of the respective renewal period of your subscription and/or at the end of the term of any additional service for which you have paid a one-off fee.\n\n',
      'de':
          'Du hast jederzeit das Recht, dein Benutzerkonto ohne Angabe von Gründen zu kündigen und damit auch deinen Nutzungsvertrag zu beenden. Hierzu musst du lediglich die erforderlichen Einstellungen in deinem Profil vornehmen. Bitte beachte, dass wir nach der Kündigung deines Benutzerkontos alle von dir eingestellten Inhalte und Trainingsergebnisse löschen bzw. löschen können und du auf bereits erworbene Inhalte keinen Zugriff mehr hast. Solltest du zum Zeitpunkt der Löschung deines Kontos noch ein laufendes Abonnement haben oder einen Zusatzdienst gebucht haben, dessen Laufzeit noch nicht abgelaufen ist, wird dir ein bereits gezahlter Betrag nicht zurückerstattet, auch nicht anteilig. \n\nWir sind berechtigt, den Nutzungsvertrag ohne Angabe von Gründen mit einer Frist von zwei (2) Wochen schriftlich zu kündigen, frühestens jedoch zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums deines Abonnements und/oder zum Ende der Laufzeit eines Zusatzdienstes, für den du eine einmalige Gebühr bezahlt hast.\n\n',
    },
    '2pdsce4w': {
      'en': '19.2. Subscription\n\n',
      'de': '19.2. Abonnement\n\n',
    },
    'goiheqn1': {
      'en':
          'Every subscription for a Breakletics Service must be cancelled individually. You can cancel the respective subscription without stating any reasons at any time effective at the end of the minimum contractual term or at the end of the respective renewal period. You can cancel any subscriptions purchased via our website www.breakletics.com by selecting the appropriate setting in your user profile. Alternatively, you may also cancel your subscription by email, sent to the address infos@breakletics.com, or by post. Subscriptions purchased via in-app purchase must be cancelled using the settings in the respective app store. If your subscription fee is collected via iTunes, contrary to the provisions above a notice period of 24 hours before the end of the minimum contractual term or before the end of the respective renewal period applies for technical reasons. Your user account and any other subscriptions will continue to exist after you have cancelled your subscription.\n\nWe are entitled to cancel your subscription with effect from the end of the minimum contractual term or with effect from the end of the respective renewal period by giving two (2) weeks’ written notice\n\n',
      'de':
          'Jedes Abonnement eines Breakletics-Dienstes muss einzeln gekündigt werden. Sie können das jeweilige Abonnement ohne Angabe von Gründen jederzeit zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums kündigen. Abonnements, die Sie über unsere Website www.breakletics.com erworben haben, können Sie kündigen, indem Sie die entsprechende Einstellung in Ihrem Benutzerprofil auswählen. Alternativ können Sie Ihr Abonnement auch per E-Mail an die Adresse infos@breakletics.com oder per Post kündigen. Abonnements, die über In-App-Käufe erworben wurden, müssen über die Einstellungen im jeweiligen App Store gekündigt werden. Wird Ihr Abonnementsbeitrag über iTunes eingezogen, gilt abweichend von den vorstehenden Bestimmungen aus technischen Gründen eine Kündigungsfrist von 24 Stunden vor Ende der Mindestvertragslaufzeit oder vor Ende des jeweiligen Verlängerungszeitraums. Ihr Benutzerkonto und etwaige weitere Abonnements bleiben auch nach der Kündigung Ihres Abonnements bestehen. \n\nWir sind berechtigt, Ihr Abonnement zum Ende der Mindestvertragslaufzeit oder zum Ende des jeweiligen Verlängerungszeitraums mit einer Frist von zwei (2) Wochen schriftlich zu kündigen.\n\n',
    },
    'p6kg6dti': {
      'en': '19.3. Cancellation for good cause\n\n',
      'de': '19.3. Kündigung aus wichtigem Grund\n\n',
    },
    'g4n94g96': {
      'en':
          'The right to cancel for good cause remains unaffected in the case of either party. In particular we are entitled to cancel your user contract or your subscription with immediate effect, and to cancel your user account, if you seriously or repeatedly breach the provisions of the user contract and/or these General Terms and Conditions of Business, or if you are in arrears with your payment obligations.\n\n',
      'de':
          'Das Recht zur Kündigung aus wichtigem Grund bleibt bei beiden Parteien unberührt. Wir sind insbesondere berechtigt, Ihren Nutzungsvertrag bzw. Ihr Abonnement mit sofortiger Wirkung zu kündigen sowie Ihr Benutzerkonto zu löschen, wenn Sie erheblich oder wiederholt gegen die Bestimmungen des Nutzungsvertrages und/oder dieser Allgemeinen Geschäftsbedingungen verstoßen oder mit Ihren Zahlungsverpflichtungen in Verzug sind.\n\n',
    },
    'jpyzqqj2': {
      'en':
          '20. Changes to the General Terms and Conditions of Business\n\n20.1 General \n\n',
      'de':
          '20. Änderungen der Allgemeinen Geschäftsbedingungen\n\n20.1 Allgemeines\n\n',
    },
    'gk9r2bya': {
      'en':
          'Breakletics retains the right to change these terms and conditions once in a while, in order to e.g. match legal requirements, become economically functional or to meet users interests and expectations. The terms and conditions document in their valid state can be found on the breakletics.com platform and in the apps.\n\n',
      'de':
          'Breakletics behält sich das Recht vor, diese Allgemeinen Geschäftsbedingungen von Zeit zu Zeit zu ändern, um sie beispielsweise rechtlichen Anforderungen anzupassen, wirtschaftlich sinnvoller zu gestalten oder den Interessen und Erwartungen der Nutzer gerecht zu werden. Die Allgemeinen Geschäftsbedingungen in ihrer jeweils aktuellen Fassung sind auf der Plattform breakletics.com und in den Apps abrufbar.\n\n',
    },
    'r783xvd9': {
      'en': '20.1 General \n\n20.2\n\n',
      'de': '20.1 Allgemeines \n\n20.2\n\n',
    },
    '3q14b4ur': {
      'en':
          'Changes of these terms and conditions require the approval of the registered user, with the exemption of the paragraph object of contract. If Breakletics wants to execute a change to the terms and conditions, they are going to inform the user as soon as possible. A likewise notification will happen on the relevant page of the breakletics.com webpage, or on every device that uses the services of Breakletics.\n\n',
      'de':
          'Änderungen dieser Allgemeinen Geschäftsbedingungen bedürfen der Zustimmung des registrierten Nutzers, mit Ausnahme des Paragraphen Vertragsgegenstand. Wenn Breakletics eine Änderung der Allgemeinen Geschäftsbedingungen vornehmen möchte, wird Breakletics den Nutzer hierüber so schnell wie möglich informieren. Eine entsprechende Benachrichtigung erfolgt auf der entsprechenden Seite der Webseite breakletics.com oder auf jedem Gerät, das die Dienste von Breakletics nutzt.\n\n',
    },
    'o17m6v2f': {
      'en': '20.3\n\n',
      'de': '20.3\n\n',
    },
    '2bm71bko': {
      'en':
          'If the user does not agree with the terms and conditions, he will not be able to use the products of Breakletics anymore.\n\n',
      'de':
          'Wenn der Nutzer mit den Allgemeinen Geschäftsbedingungen nicht einverstanden ist, kann er die Produkte von Breakletics nicht mehr nutzen.\n\n',
    },
    'hsr3g415': {
      'en': '20.4\n\n',
      'de': '20.4\n\n',
    },
    '3tqep5va': {
      'en':
          'Information on the provider\nBreakletics GmbH \nMont-Cenis-Str. 6\n44623 Herne\ninfo@hiit-the-beat.com\nCEO: Peter Sowinski\nCommercial register number at Amtsgericht Bochum: HRB 21945\nVAT–ID: DE307273612\n\n',
      'de':
          'Informationen zum Anbieter\nBreakletics GmbH \nMont-Cenis-Str. 6\n44623 Herne\ninfo@hiit-the-beat.com\nGeschäftsführer: Peter Sowinski\nHandelsregisternummer beim Amtsgericht Bochum: HRB 21945\nUmsatzsteuer-Identifikationsnummer: DE307273612\n\n',
    },
    'cu5i3e23': {
      'en': '21. Final Provision\n\n21.1. Applicable law\n\n',
      'de': '21. Schlussbestimmungen\n\n21.1. Geltendes Recht\n\n',
    },
    'r3ojk3jv': {
      'en':
          'Between the two parties, only German law and the excemption of the CISG UN right is applicable. Doing business with consumers within the European Union can use the current place of living of the consumer as an orientation and is only applicable if it concerns the necessary to-be-applied conditions of the consumer law.\n\n',
      'de':
          'Zwischen den Vertragspartnern gilt ausschließlich deutsches Recht unter Ausschluss des CISG-UN-Kaufrechts. Bei Geschäften mit Verbrauchern innerhalb der Europäischen Union kann der aktuelle Wohnsitz des Verbrauchers als Orientierung dienen und gilt nur dann, wenn es sich um zwingend anzuwendende Bestimmungen des Verbraucherrechts handelt.\n\n',
    },
    'wrhi807g': {
      'en': '21.2. Place of jurisdiction\n\n',
      'de': '21.2. Gerichtsstand\n\n',
    },
    'zy6371ym': {
      'en':
          'If you do not have a place of general jurisdiction in Germany or in another EU Member State, or if you have moved your permanent place of residence to a country outside the EU after these General Terms and Conditions of Business have entered into effect, or if your permanent place of residence or usual place of residence at the time the complaint is filed is not known, then the exclusive place of jurisdiction for all disputes arising from this contract will be our place of business.\n\n',
      'de':
          'Haben Sie keinen allgemeinen Gerichtsstand in Deutschland oder in einem anderen EU-Mitgliedsstaat oder haben Sie nach Wirksamkeit dieser Allgemeinen Geschäftsbedingungen Ihren festen Wohnsitz in ein Land außerhalb der EU verlegt oder ist Ihr Wohnsitz oder gewöhnlicher Aufenthaltsort im Zeitpunkt der Klageerhebung nicht bekannt, ist ausschließlicher Gerichtsstand für alle Streitigkeiten aus diesem Vertrag unser Geschäftssitz.\n\n',
    },
    'hgkcb24o': {
      'en': '21.3. Language of the contract\n\n',
      'de': '21.3. Vertragssprache\n\n',
    },
    '5brnidmm': {
      'en': 'The language of the contract is English.\n\n',
      'de': 'Die Vertragssprache ist Englisch.\n\n',
    },
    'wqw5peb4': {
      'en': '21.4. Severability clause\n\n',
      'de': '21.4. Salvatorische Klausel\n\n',
    },
    'v7kjdq5s': {
      'en':
          'Should any individual provisions of these General Terms and Conditions of Business be or become invalid in whole or in part, this will not affect the validity of the remaining provisions.',
      'de':
          'Sollten einzelne Bestimmungen dieser Allgemeinen Geschäftsbedingungen ganz oder teilweise unwirksam sein oder werden, so wird hierdurch die Wirksamkeit der übrigen Bestimmungen nicht berührt.',
    },
    'yzpmclom': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // PolicyPage
  {
    'q7l5wmel': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinie',
    },
    'h9xi9ngr': {
      'en': 'PRIVACY POLICY\n\n',
      'de': 'DATENSCHUTZRICHTLINIE\n\n',
    },
    'yygsl7cs': {
      'en':
          'Last updated: November 2024\n\n\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.\n\n',
      'de':
          'Zuletzt aktualisiert: November 2024\n\n\nDiese Datenschutzrichtlinie beschreibt unsere Richtlinien und Verfahren zur Erfassung, Verwendung und Offenlegung Ihrer Daten, wenn Sie den Dienst nutzen, und informiert Sie über Ihre Datenschutzrechte und wie das Gesetz Sie schützt.\n\nWir verwenden Ihre personenbezogenen Daten, um den Dienst bereitzustellen und zu verbessern. Indem Sie den Dienst nutzen, stimmen Sie der Erfassung und Verwendung von Informationen gemäß dieser Datenschutzrichtlinie zu.\n\n',
    },
    'qt1noxu3': {
      'en': 'INTERPRETATION AND DEFINITIONS\n\nInterpretation\n\n',
      'de': 'AUSLEGUNG UND DEFINITIONEN\n\nAuslegung\n\n',
    },
    '40v9nhjc': {
      'en':
          'The words of which the initial letter is capitalized have meanings defined under the following conditions.\n\n\nThe following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\n',
      'de':
          'Die Wörter, deren Anfangsbuchstabe groß geschrieben ist, haben unter den folgenden Bedingungen die definierten Bedeutungen.\n\n\nDie folgenden Definitionen haben unabhängig davon, ob sie in der Einzahl oder Mehrzahl stehen, die gleiche Bedeutung.\n\n',
    },
    '4idif6px': {
      'en': 'Definitions\n\n',
      'de': 'Definitionen\n\n',
    },
    'r0ivnhz3': {
      'en':
          'For the purposes of this Privacy Policy:\n\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable. Under GDPR (General Data Protection Regulation), You can be referred to as the Data Subject or as the User as you are the individual using the Service.\n\nCompany (referred to as either “the Company”, “We”, “Us” or “Our” in this Agreement) refers to Breakletics GmbH, Schliemannstr. 44, 10437 Berlin. For the purpose of the GDPR, the Company is the Data Controller.\n\nApplication means the software program provided by the Company downloaded by You on any electronic device, named HIIT the Beat by Breakletics\n\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where “control” means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\n\nAccount means a unique account created for You to access our Service or parts of our Service.\n\nWebsite refers to Breakletics Website, accessible from ',
      'de':
          'Für die Zwecke dieser Datenschutzrichtlinie:\n\nSie bezeichnet die Person, die auf den Dienst zugreift oder ihn nutzt, oder das Unternehmen oder eine andere juristische Person, in deren Namen diese Person auf den Dienst zugreift oder ihn nutzt, je nachdem, was zutrifft. Gemäß der DSGVO (Datenschutz-Grundverordnung) können Sie als betroffene Person oder als Benutzer bezeichnet werden, da Sie die Person sind, die den Dienst nutzt.\n\nUnternehmen (in dieser Vereinbarung als „das Unternehmen“, „Wir“, „Uns“ oder „Unser“ bezeichnet) bezeichnet Breakletics GmbH, Schliemannstr. 44, 10437 Berlin. Im Sinne der DSGVO ist das Unternehmen der Datenverantwortliche.\n\nAnwendung bezeichnet das vom Unternehmen bereitgestellte Softwareprogramm mit dem Namen „HIIT the Beat by Breakletics“, das Sie auf ein beliebiges elektronisches Gerät herunterladen können.\n\nVerbundenes Unternehmen bezeichnet eine Einheit, die eine Partei kontrolliert, von einer Partei kontrolliert wird oder mit einer Partei unter gemeinsamer Kontrolle steht, wobei „Kontrolle“ den Besitz von 50 % oder mehr der Aktien, Beteiligungen oder anderen Wertpapiere bedeutet, die zur Wahl von Direktoren oder anderen Leitungsorganen berechtigt sind.\n\nKonto bezeichnet ein einzigartiges Konto, das für Sie erstellt wird, um auf unseren Service oder Teile unseres Service zuzugreifen.\n\nWebsite bezeichnet die Breakletics-Website, zugänglich über\n\n',
    },
    'qjs6qly9': {
      'en': 'www.breakletics.com\n\n',
      'de': 'www.breakletics.com\n\n',
    },
    'on9v5aye': {
      'en':
          'Country refers to: Berlin, Germany\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\n\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used. For the purpose of the GDPR, Service Providers are considered Data Processors\n\nThird-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.\n\nPersonal Data is any information that relates to an identified or identifiable individual. For the purposes for GDPR, Personal Data means any information relating to You such as a name, an identification number, location data, online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity. For the purposes of the CCPA, Personal Data means any information that identifies, relates to, describes or is capable of being associated with, or could reasonably be linked, directly or indirectly, with You.\n\nCookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.\n\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\n\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\n\nData Controller, for the purposes of the GDPR (General Data Protection Regulation), refers to the Company as the legal person which alone or jointly with others determines the purposes and means of the processing of Personal Data.\n\nDo Not Track (DNT) is a concept that has been promoted by US regulatory authorities, in particular the U.S. Federal Trade Commission (FTC), for the Internet industry to develop and implement a mechanism for allowing internet users to control the tracking of their online activities across websites.\n\nBusiness, for the purpose of the CCPA (California Consumer Privacy Act), refers to the Company as the legal entity that collects Consumers’ personal information and determines the purposes and means of the processing of Consumers’ personal information, or on behalf of which such information is collected and that alone, or jointly with others, determines the purposes and means of the processing of consumers’ personal information, that does business in the State of California.\n\nConsumer, for the purpose of the CCPA (California Consumer Privacy Act), means a natural person who is a California resident. A resident, as defined in the law, includes (1) every individual who is in the USA for other than a temporary or transitory purpose, and (2) every individual who is domiciled in the USA who is outside the USA for a temporary or transitory purpose.\n\nSale, for the purpose of the CCPA (California Consumer Privacy Act), means selling, renting, releasing, disclosing, disseminating, making available, transferring, or otherwise communicating orally, in writing, or by electronic or other means, a Consumer’s Personal information to another business or a third party for monetary or other valuable consideration.\n\n',
      'de':
          'Land bezieht sich auf: Berlin, Deutschland\n\nDienstanbieter bezeichnet jede natürliche oder juristische Person, die die Daten im Auftrag des Unternehmens verarbeitet. Dies bezieht sich auf Drittunternehmen oder Einzelpersonen, die vom Unternehmen beauftragt werden, den Dienst zu ermöglichen, den Dienst im Auftrag des Unternehmens bereitzustellen, mit dem Dienst verbundene Dienste auszuführen oder das Unternehmen bei der Analyse der Nutzung des Dienstes zu unterstützen.\n\nDienstanbieter bezeichnet jede natürliche oder juristische Person, die die Daten im Auftrag des Unternehmens verarbeitet. Dies bezieht sich auf Drittunternehmen oder Einzelpersonen, die vom Unternehmen beauftragt werden, den Dienst zu ermöglichen, den Dienst im Auftrag des Unternehmens bereitzustellen, mit dem Dienst verbundene Dienste auszuführen oder das Unternehmen bei der Analyse der Nutzung des Dienstes zu unterstützen. Für die Zwecke der DSGVO gelten Dienstanbieter als Datenverarbeiter\n\nSocial-Media-Dienste von Drittanbietern beziehen sich auf jede Website oder jede Website eines sozialen Netzwerks, über die sich ein Benutzer anmelden oder ein Konto erstellen kann, um den Dienst zu verwenden.\n\nPersonenbezogene Daten sind alle Informationen, die sich auf eine identifizierte oder identifizierbare Person beziehen. Im Sinne der DSGVO sind unter personenbezogenen Daten sämtliche Informationen zu Ihrer Person zu verstehen, beispielsweise ein Name, eine Identifikationsnummer, Standortdaten, eine Online-Kennung oder ein oder mehrere Faktoren, die Ausdruck Ihrer physischen, physiologischen, genetischen, geistigen, wirtschaftlichen, kulturellen oder sozialen Identität sind. Im Sinne des CCPA sind personenbezogene Daten alle Informationen, die Sie identifizieren, sich auf Sie beziehen, Sie beschreiben oder mit Ihnen in Verbindung gebracht werden können oder vernünftigerweise direkt oder indirekt mit Ihnen in Verbindung gebracht werden könnten.\n\nCookies sind kleine Dateien, die von einer Website auf Ihrem Computer, Mobilgerät oder einem anderen Gerät abgelegt werden und die unter anderem die Details Ihres Browserverlaufs auf dieser Website enthalten.\n\nGerät ist jedes Gerät, das auf den Dienst zugreifen kann, z. B. ein Computer, ein Mobiltelefon oder ein digitales Tablet.\n\nNutzungsdaten sind automatisch erfasste Daten, die entweder durch die Verwendung des Dienstes oder durch die Dienstinfrastruktur selbst generiert werden (z. B. die Dauer eines Seitenbesuchs).\n\nDatenverantwortlicher ist im Sinne der DSGVO (Datenschutz-Grundverordnung) das Unternehmen als juristische Person, die allein oder gemeinsam mit anderen die Zwecke und Mittel der Verarbeitung personenbezogener Daten bestimmt.\n\nDo Not Track (DNT) ist ein Konzept, das wurde von US-amerikanischen Regulierungsbehörden, insbesondere der US-amerikanischen Federal Trade Commission (FTC), gefördert, damit die Internetbranche einen Mechanismus entwickelt und implementiert, der es Internetnutzern ermöglicht, die Verfolgung ihrer Online-Aktivitäten über Websites hinweg zu kontrollieren.\n\nUnternehmen bezeichnet im Sinne des CCPA (California Consumer Privacy Act) das Unternehmen als die juristische Person, die personenbezogene Daten von Verbrauchern erhebt und die Zwecke und Mittel der Verarbeitung personenbezogener Daten von Verbrauchern bestimmt oder in deren Namen solche Daten erhoben werden und die allein oder gemeinsam mit anderen die Zwecke und Mittel der Verarbeitung personenbezogener Daten von Verbrauchern bestimmt, die im Staat Kalifornien geschäftlich tätig ist.\n\nVerbraucher bezeichnet im Sinne des CCPA (California Consumer Privacy Act) eine natürliche Person mit Wohnsitz in Kalifornien. Ein Einwohner gemäß der gesetzlichen Definition umfasst (1) jede Person, die sich nicht nur vorübergehend oder vorübergehend in den USA aufhält, und (2) jede Person mit Wohnsitz in den USA, die sich nur vorübergehend oder vorübergehend außerhalb der USA aufhält.\n\nVerkauf bedeutet im Sinne des CCPA (California Consumer Privacy Act) den Verkauf, die Vermietung, die Freigabe, Offenlegung, Verbreitung, Bereitstellung, Übertragung oder anderweitige mündliche, schriftliche, elektronische oder sonstige Übermittlung der personenbezogenen Daten eines Verbrauchers an ein anderes Unternehmen oder einen Dritten gegen Geld oder eine sonstige wertvolle Gegenleistung.\n\n',
    },
    'qpw1v2a6': {
      'en':
          'COLLECTING AND USING YOUR PERSONAL DATA\n\nTypes of Data Collected\n\nPersonal Data\n\n',
      'de':
          'SAMMLUNG UND VERWENDUNG IHRER PERSONENBEZOGENEN DATEN\n\nArten der erfassten Daten\n\nPersönliche Daten\n\n',
    },
    'v9e1wahy': {
      'en':
          'While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n\n• Email address\n• First name and last name\n• Phone number\n• Address, State, Province, ZIP/Postal code, City\n• Bank account information in order to pay for products and/or services within the Service\n\nWhen You pay for a product and/or a service via bank transfer, We may ask You to provide information to facilitate this transaction and to verify Your identity. Such information may include, without limitation:\n\n• Date of birth\n• Passport or National ID card\n• Bank card statement\n• Other information linking You to an address\n\n',
      'de':
          'Während Sie unseren Service nutzen, bitten wir Sie möglicherweise, uns bestimmte personenbezogene Daten zur Verfügung zu stellen, die verwendet werden können, um Sie zu kontaktieren oder zu identifizieren. Personenbezogene Daten können Folgendes umfassen, sind aber nicht darauf beschränkt:\n\n\n• E-Mail-Adresse\n\n• Vor- und Nachname\n\n• Telefonnummer\n\n• Adresse, Staat, Provinz, Postleitzahl, Stadt\n\n• Bankkontoinformationen, um für Produkte und/oder Dienstleistungen innerhalb des Service zu bezahlen\n\nWenn Sie für ein Produkt und/oder eine Dienstleistung per Banküberweisung bezahlen, bitten wir Sie möglicherweise um die Angabe von Informationen, um diese Transaktion zu erleichtern und Ihre Identität zu bestätigen. Solche Informationen können Folgendes umfassen, sind aber nicht darauf beschränkt:\n\n• Geburtsdatum\n• Reisepass oder Personalausweis\n• Bankkartenauszug\n• Andere Informationen, die Sie mit einer Adresse verknüpfen\n\n',
    },
    'fogh6n3n': {
      'en': 'Usage Data\n\n',
      'de': 'Nutzungsdaten\n\n',
    },
    'z8w9f3qi': {
      'en':
          'Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Device’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.\n\n',
      'de':
          'Bei Verwendung des Dienstes werden Nutzungsdaten automatisch erfasst.\n\nNutzungsdaten können Informationen wie die Internetprotokolladresse (z. B. IP-Adresse) Ihres Geräts, den Browsertyp, die Browserversion, die von Ihnen besuchten Seiten unseres Dienstes, Uhrzeit und Datum Ihres Besuchs, die auf diesen Seiten verbrachte Zeit, eindeutige Gerätekennungen und andere Diagnosedaten umfassen.\n\nWenn Sie über ein mobiles Gerät auf den Dienst zugreifen, können wir bestimmte Informationen automatisch erfassen, darunter, aber nicht beschränkt auf, den Typ des von Ihnen verwendeten mobilen Geräts, die eindeutige ID Ihres mobilen Geräts, die IP-Adresse Ihres mobilen Geräts, Ihr mobiles Betriebssystem, den Typ des von Ihnen verwendeten mobilen Internetbrowsers, eindeutige Gerätekennungen und andere Diagnosedaten.\n\nWir können auch Informationen erfassen, die Ihr Browser sendet, wenn Sie unseren Dienst besuchen oder wenn Sie über ein mobiles Gerät auf den Dienst zugreifen.\n\n',
    },
    '7exfkd6n': {
      'en': 'Information from Third-Party Social Media Services\n\n',
      'de': 'Informationen von Social-Media-Diensten Dritter\n\n',
    },
    '92r57nzo': {
      'en':
          'The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:\n\n• Google\n• Apple\n\nIf You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service’s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.\n\nYou may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service’s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.\n\n',
      'de':
          'Das Unternehmen ermöglicht Ihnen, über die folgenden Social Media-Dienste Dritter ein Konto zu erstellen und sich zur Verwendung des Dienstes anzumelden:\n\n• Google\n• Apple\n\nWenn Sie sich über einen Social Media-Dienst Dritter registrieren oder uns auf andere Weise Zugriff darauf gewähren, können wir personenbezogene Daten erfassen, die bereits mit dem Konto Ihres Social Media-Dienstes Dritter verknüpft sind, wie etwa Ihren Namen, Ihre E-Mail-Adresse, Ihre Aktivitäten oder Ihre mit diesem Konto verknüpfte Kontaktliste.\n\nSie haben möglicherweise auch die Möglichkeit, über das Konto Ihres Social Media-Dienstes Dritter weitere Informationen mit dem Unternehmen zu teilen. Wenn Sie sich dazu entschließen, derartige Informationen und personenbezogenen Daten während der Registrierung oder auf andere Weise bereitzustellen, erteilen Sie dem Unternehmen die Erlaubnis, diese in einer mit dieser Datenschutzrichtlinie übereinstimmenden Weise zu verwenden, freizugeben und zu speichern.\n\n',
    },
    'bxyy1cxc': {
      'en': 'Information Collected while Using the Application\n\n',
      'de': 'Bei der Nutzung der Anwendung erfasste Informationen\n\n',
    },
    'd9pftf4l': {
      'en':
          'While using Our Application, in order to provide features of Our Application, We may collect, with your prior permission:\n\nInformation regarding your location\n\nWe use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company’s servers and/or a Service Provider’s server or it be simply stored on Your device.\n\nYou can enable or disable access to this information at any time, through Your Device settings. You can also enable or disable location services when You use Our Service at any time, through Your Device settings.\n\n',
      'de':
          'Während Sie unsere Anwendung verwenden, können wir, um Funktionen unserer Anwendung bereitzustellen, mit Ihrer vorherigen Zustimmung Folgendes erfassen:\n\nInformationen zu Ihrem Standort\n\nWir verwenden diese Informationen, um Funktionen unseres Dienstes bereitzustellen, unseren Dienst zu verbessern und anzupassen. Die Informationen können auf die Server des Unternehmens und/oder den Server eines Dienstanbieters hochgeladen oder einfach auf Ihrem Gerät gespeichert werden.\n\nSie können den Zugriff auf diese Informationen jederzeit über die Einstellungen Ihres Geräts aktivieren oder deaktivieren. Sie können Standortdienste auch jederzeit über die Einstellungen Ihres Geräts aktivieren oder deaktivieren, wenn Sie unseren Dienst verwenden.\n\n',
    },
    '6uh71371': {
      'en': 'Tracking Technologies and Cookies\n\n',
      'de': 'Tracking-Technologien und Cookies\n\n',
    },
    'f8lumrsd': {
      'en':
          'We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service.\n\nYou can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service.\n\nCookies can be “Persistent” or “Session” Cookies. Persistent Cookies remain on your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close your web browser.\n\nWe use both session and persistent Cookies for the purposes set out below:\n\n',
      'de':
          'Wir verwenden Cookies und ähnliche Tracking-Technologien, um die Aktivität auf unserem Service zu verfolgen und bestimmte Informationen zu speichern. Als Tracking-Technologien werden Beacons, Tags und Skripte verwendet, um Informationen zu sammeln und zu verfolgen und unseren Service zu verbessern und zu analysieren.\n\nSie können Ihren Browser anweisen, alle Cookies abzulehnen oder anzugeben, wann ein Cookie gesendet wird. Wenn Sie jedoch keine Cookies akzeptieren, können Sie möglicherweise einige Teile unseres Service nicht nutzen.\n\nCookies können „dauerhafte“ oder „Sitzungscookies“ sein. Dauerhafte Cookies verbleiben auf Ihrem PC oder Mobilgerät, wenn Sie offline gehen, während Sitzungscookies gelöscht werden, sobald Sie Ihren Webbrowser schließen.\n\nWir verwenden sowohl Sitzungscookies als auch dauerhafte Cookies für die unten aufgeführten Zwecke:\n\n',
    },
    '6dqc8pxy': {
      'en': 'Necessary / Essential Cookies\n\n',
      'de': 'Notwendige / essentielle Cookies\n\n',
    },
    'ny5uz6r3': {
      'en':
          'Type: Session Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.\n\n',
      'de':
          'Typ: Sitzungscookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies sind unerlässlich, um Ihnen die über die Website verfügbaren Dienste bereitzustellen und Ihnen die Nutzung einiger ihrer Funktionen zu ermöglichen. Sie helfen bei der Authentifizierung von Benutzern und verhindern die betrügerische Verwendung von Benutzerkonten. Ohne diese Cookies können die von Ihnen angeforderten Dienste nicht bereitgestellt werden, und wir verwenden diese Cookies nur, um Ihnen diese Dienste bereitzustellen.\n\n',
    },
    'leze0xj6': {
      'en': 'Cookies Policy / Notice Acceptance Cookies\n\n',
      'de': 'Cookie-Richtlinie / Hinweis zur Akzeptanz von Cookies\n\n',
    },
    'ug12olui': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies identify if users have accepted the use of cookies on the Website.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies identifizieren, ob Benutzer die Verwendung von Cookies auf der Website akzeptiert haben.\n\n',
    },
    'q19ygppd': {
      'en': 'Functionality Cookies\n\n',
      'de': 'Funktionscookies\n\n',
    },
    '2wgbtrnf': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Us\n\nPurpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Uns\n\nZweck: Diese Cookies ermöglichen es uns, Ihre Auswahl bei der Nutzung der Website zu speichern, z. B. Ihre Anmeldedaten oder Spracheinstellungen. Der Zweck dieser Cookies besteht darin, Ihnen ein persönlicheres Erlebnis zu bieten und zu vermeiden, dass Sie Ihre Einstellungen bei jeder Nutzung der Website erneut eingeben müssen.\n\n',
    },
    'oakw7vvn': {
      'en': 'Tracking and Performance Cookies\n\n',
      'de': 'Tracking und Performance Cookies\n\n',
    },
    'nxgvk8ra': {
      'en':
          'Type: Persistent Cookies\n\nAdministered by: Third-Parties\n\nPurpose: These Cookies are used to track information about traffic to the Website and how users use the Website. The information gathered via these Cookies may directly or indirectly identify you as an individual visitor. This is because the information collected is typically linked to a pseudonymous identifier associated with the device you use to access the Website. We may also use these Cookies to test new advertisements, pages, features or new functionality of the Website to see how our users react to them.\n\nFor more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy.\n\n',
      'de':
          'Typ: Dauerhafte Cookies\n\nVerwaltet von: Drittanbietern\n\nZweck: Diese Cookies werden verwendet, um Informationen über den Verkehr auf der Website und die Nutzung der Website durch Benutzer zu verfolgen. Die über diese Cookies gesammelten Informationen können Sie direkt oder indirekt als einzelnen Besucher identifizieren. Dies liegt daran, dass die gesammelten Informationen normalerweise mit einer pseudonymen Kennung verknüpft sind, die mit dem Gerät verknüpft ist, mit dem Sie auf die Website zugreifen. Wir können diese Cookies auch verwenden, um neue Anzeigen, Seiten, Funktionen oder neue Funktionen der Website zu testen, um zu sehen, wie unsere Benutzer darauf reagieren.\n\nWeitere Informationen zu den von uns verwendeten Cookies und Ihren Auswahlmöglichkeiten in Bezug auf Cookies finden Sie in unserer Cookie-Richtlinie.\n\n',
    },
    'z0zigdyo': {
      'en': 'Use of Your Personal Data\n\n',
      'de': 'Verwendung Ihrer persönlichen Daten\n\n',
    },
    'yqyv55rg': {
      'en':
          'The Company may use Personal Data for the following purposes:\n\nTo provide and maintain our Service, including to monitor the usage of our Service.\n\nTo manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n\nFor the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n\nTo contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application’s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n\n**To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n\nTo manage Your requests: To attend and manage Your requests to Us.\n\nWe may share your personal information in the following situations:\n\n\nWith Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to show advertisements to You to help support and maintain Our Service, to contact You, to advertise on third party websites to You after You visited our Service or for payment processing.\n\n\nFor Business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of our business to another company.\n\n\nWith Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.\n\n\nWith Business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.\n\n\nWith other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.\n\n',
      'de':
          'Das Unternehmen kann personenbezogene Daten für die folgenden Zwecke verwenden:\n\nZur Bereitstellung und Wartung unseres Dienstes, einschließlich der Überwachung der Nutzung unseres Dienstes.\n\nZur Verwaltung Ihres Kontos: zur Verwaltung Ihrer Registrierung als Benutzer des Dienstes. Die von Ihnen bereitgestellten personenbezogenen Daten können Ihnen Zugriff auf verschiedene Funktionen des Dienstes gewähren, die Ihnen als registrierter Benutzer zur Verfügung stehen.\n\nZur Erfüllung eines Vertrags: Entwicklung, Einhaltung und Durchführung des Kaufvertrags für die von Ihnen erworbenen Produkte, Artikel oder Dienstleistungen oder eines anderen Vertrags mit uns über den Dienst.\n\nZur Kontaktaufnahme: Zur Kontaktaufnahme mit Ihnen per E-Mail, Telefon, SMS oder anderen gleichwertigen Formen der elektronischen Kommunikation, wie z. B. Push-Benachrichtigungen einer mobilen Anwendung bezüglich Aktualisierungen oder informativer Mitteilungen in Bezug auf die Funktionen, Produkte oder vertraglich vereinbarten Dienstleistungen, einschließlich der Sicherheitsaktualisierungen, wenn dies für deren Umsetzung erforderlich oder angemessen ist.\n\n**Um Ihnen Neuigkeiten, Sonderangebote und allgemeine Informationen zu anderen von uns angebotenen Waren, Dienstleistungen und Veranstaltungen zukommen zu lassen, die denen ähnlich sind, die Sie bereits gekauft oder nach denen Sie sich erkundigt haben, sofern Sie sich nicht gegen den Erhalt solcher Informationen entschieden haben.\n\nZur Verwaltung Ihrer Anfragen: Zur Bearbeitung und Verwaltung Ihrer Anfragen an uns.\n\nWir können Ihre personenbezogenen Daten in den folgenden Situationen:\n\n\nAn Dienstanbieter: Wir können Ihre personenbezogenen Daten an Dienstanbieter weitergeben, um die Nutzung unseres Dienstes zu überwachen und zu analysieren, um Ihnen Werbung anzuzeigen, um unseren Dienst zu unterstützen und zu pflegen, um mit Ihnen Kontakt aufzunehmen, um Ihnen auf Websites von Drittanbietern Werbung anzuzeigen, nachdem Sie unseren Dienst besucht haben, oder für die Zahlungsabwicklung.\n\n\nFür Geschäftsübertragungen: Wir können Ihre personenbezogenen Daten im Zusammenhang mit oder während der Verhandlungen über eine Fusion, den Verkauf von Unternehmensvermögen, die Finanzierung oder den Erwerb unseres gesamten oder eines Teils unseres Unternehmens durch ein anderes Unternehmen weitergeben oder übertragen.\n\n\nAn verbundene Unternehmen: Wir können Ihre Daten an unsere verbundenen Unternehmen weitergeben. In diesem Fall verlangen wir von diesen verbundenen Unternehmen, diese Datenschutzrichtlinie einzuhalten. Zu den verbundenen Unternehmen zählen unser Mutterunternehmen und alle anderen Tochterunternehmen, Joint-Venture-Partner und andere Unternehmen, die von uns kontrolliert werden oder die mit uns unter gemeinsamer Kontrolle stehen.\n\n\nMit Geschäftspartnern: Wir können Ihre Informationen an unsere Geschäftspartner weitergeben, um Ihnen bestimmte Produkte, Dienstleistungen oder Werbeaktionen anzubieten.\n\n\nMit anderen Benutzern: Wenn Sie persönliche Informationen teilen oder auf andere Weise in den öffentlichen Bereichen mit anderen Benutzern interagieren, können diese Informationen von allen Benutzern eingesehen und öffentlich nach außen verbreitet werden. Wenn Sie mit anderen Benutzern interagieren oder sich über einen Social-Media-Dienst eines Drittanbieters registrieren, können Ihre Kontakte beim Social-Media-Dienst eines Drittanbieters Ihren Namen, Ihr Profil, Ihre Bilder und eine Beschreibung Ihrer Aktivität sehen. Ebenso können andere Benutzer Beschreibungen Ihrer Aktivitäten ansehen, mit Ihnen kommunizieren und Ihr Profil ansehen.\n\n',
    },
    'lmlrg8t2': {
      'en': 'Retention of Your Personal Data\n\n',
      'de': 'Aufbewahrung Ihrer persönlichen Daten\n\n',
    },
    '86duy0kl': {
      'en':
          'The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.\n\n',
      'de':
          'Das Unternehmen speichert Ihre personenbezogenen Daten nur so lange, wie dies für die in dieser Datenschutzrichtlinie dargelegten Zwecke erforderlich ist. Wir speichern und verwenden Ihre personenbezogenen Daten in dem Umfang, der erforderlich ist, um unseren gesetzlichen Verpflichtungen nachzukommen (beispielsweise, wenn wir Ihre Daten speichern müssen, um geltende Gesetze einzuhalten), Streitigkeiten beizulegen und unsere rechtlichen Vereinbarungen und Richtlinien durchzusetzen.\n\nDas Unternehmen speichert Nutzungsdaten auch für interne Analysezwecke. Nutzungsdaten werden im Allgemeinen für einen kürzeren Zeitraum gespeichert, es sei denn, diese Daten werden verwendet, um die Sicherheit zu stärken oder die Funktionalität unseres Dienstes zu verbessern, oder wir sind gesetzlich verpflichtet, diese Daten für längere Zeiträume zu speichern.\n\n',
    },
    'qvy4nn8z': {
      'en': 'Transfer of Your Personal Data\n\n',
      'de': 'Übermittlung Ihrer personenbezogenen Daten\n\n',
    },
    'etb00805': {
      'en':
          'Your information, including Personal Data, is processed at the Company’s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.\n\n',
      'de':
          'Ihre Informationen, einschließlich personenbezogener Daten, werden in den Betriebsbüros des Unternehmens und an allen anderen Orten verarbeitet, an denen sich die an der Verarbeitung beteiligten Parteien befinden. Dies bedeutet, dass diese Informationen an Computer außerhalb Ihres Staates, Ihrer Provinz, Ihres Landes oder einer anderen staatlichen Gerichtsbarkeit, in der andere Datenschutzgesetze als in Ihrer Gerichtsbarkeit gelten, übertragen und dort gespeichert werden können.\n\nIhre Zustimmung zu dieser Datenschutzrichtlinie und die anschließende Übermittlung dieser Informationen stellen Ihre Zustimmung zu dieser Übertragung dar.\n\nDas Unternehmen wird alle angemessenen Schritte unternehmen, um sicherzustellen, dass Ihre Daten sicher und in Übereinstimmung mit dieser Datenschutzrichtlinie behandelt werden. Es erfolgt keine Übertragung Ihrer personenbezogenen Daten an Organisationen oder Länder, ohne dass angemessene Kontrollen vorhanden sind, einschließlich der Sicherheit Ihrer Daten und anderer personenbezogener Informationen.\n\n',
    },
    'v4mc17m3': {
      'en': 'Disclosure of Your Personal Data\n\n',
      'de': 'Offenlegung Ihrer persönlichen Daten\n\n',
    },
    'w4t69g2v': {
      'en':
          'Business Transactions\nIf the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.\n\nLaw enforcement\nUnder certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).\n\nOther legal requirements\nThe Company may disclose Your Personal Data in the good faith belief that such action is necessary to:\n\n• Comply with a legal obligation\n\n• Protect and defend the rights or property of the Company\n\n• Prevent or investigate possible wrongdoing in connection with the Service\n\n• Protect the personal safety of Users of the Service or the public\n\n• Protect against legal liability\n\n',
      'de':
          'Geschäftstransaktionen\n\nWenn das Unternehmen an einer Fusion, Übernahme oder einem Verkauf von Vermögenswerten beteiligt ist, können Ihre personenbezogenen Daten übertragen werden. Wir benachrichtigen Sie, bevor Ihre personenbezogenen Daten übertragen werden und einer anderen Datenschutzrichtlinie unterliegen.\n\nStrafverfolgung\n\nUnter bestimmten Umständen kann das Unternehmen verpflichtet sein, Ihre personenbezogenen Daten offenzulegen, wenn dies gesetzlich vorgeschrieben ist oder als Reaktion auf gültige Anfragen von Behörden (z. B. einem Gericht oder einer Regierungsbehörde).\n\nAndere gesetzliche Anforderungen\n\nDas Unternehmen kann Ihre personenbezogenen Daten in dem guten Glauben offenlegen, dass eine solche Maßnahme erforderlich ist, um:\n\n• einer gesetzlichen Verpflichtung nachzukommen\n\n• die Rechte oder das Eigentum des Unternehmens zu schützen und zu verteidigen\n\n• mögliches Fehlverhalten im Zusammenhang mit dem Dienst zu verhindern oder zu untersuchen\n\n• die persönliche Sicherheit der Benutzer des Dienstes oder der Öffentlichkeit zu schützen\n\n• vor gesetzlicher Haftung zu schützen\n\n',
    },
    'ddjtk7g6': {
      'en': 'Security of Your Personal Data\n\n',
      'de': 'Sicherheit Ihrer persönlichen Daten\n\n',
    },
    'gbxyt7tf': {
      'en':
          'The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.\n\n',
      'de':
          'Die Sicherheit Ihrer persönlichen Daten ist uns wichtig. Bedenken Sie jedoch, dass keine Methode der Übertragung über das Internet oder der elektronischen Speicherung 100 % sicher ist. Obwohl wir uns bemühen, kommerziell akzeptable Mittel zum Schutz Ihrer persönlichen Daten einzusetzen, können wir deren absolute Sicherheit nicht garantieren.\n\n',
    },
    'smm1rjb7': {
      'en': 'DETAILED INFORMATION ON THE PROCESSING OF YOUR PERSONAL DATA\n\n',
      'de':
          'Detaillierte Informationen zur Verarbeitung Ihrer personenbezogenen Daten\n\n',
    },
    'm29j84b8': {
      'en':
          'Service Providers have access to Your Personal Data only to perform their tasks on Our behalf and are obligated not to disclose or use it for any other purpose.\n\n',
      'de':
          'Dienstleister haben nur Zugriff auf Ihre personenbezogenen Daten, um ihre Aufgaben in unserem Auftrag auszuführen, und sind verpflichtet, diese nicht offenzulegen oder für andere Zwecke zu verwenden.\n\n',
    },
    '8hap8oi9': {
      'en': 'Analytics\n\n',
      'de': 'Analyse\n\n',
    },
    '0ieb5q5v': {
      'en':
          'We may use third-party Service providers to monitor and analyze the use of our Service.\n\n',
      'de':
          'Wir beauftragen gegebenenfalls Drittanbieter mit der Überwachung und Analyse der Nutzung unseres Dienstes.\n\n',
    },
    'vbivi1lk': {
      'en': 'Google Analytics\n\n',
      'de': 'Google Analytics\n\n',
    },
    '0et8i7yy': {
      'en':
          'For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: ',
      'de':
          'Weitere Informationen zu den Datenschutzmaßnahmen von Google finden Sie auf der Webseite zu den Datenschutzbestimmungen und Nutzungsbedingungen von Google:',
    },
    '28h8rq59': {
      'en': 'https://policies.google.com/privacy?hl=en\n\n',
      'de': 'https://policies.google.com/privacy?hl=en\n\n',
    },
    'bzhcjmdm': {
      'en': 'Email Marketing\n\n',
      'de': 'E-Mail-Marketing\n\n',
    },
    'xqdhqe10': {
      'en':
          'We may use Your Personal Data to contact You with newsletters, marketing or promotional materials and other information that may be of interest to You. You may opt-out of receiving any, or all, of these communications from Us by following the unsubscribe link or instructions provided in any email We send or by contacting Us.\n\nWe may use Email Marketing Service Providers to manage and send emails to You.\n\n',
      'de':
          'Wir können Ihre personenbezogenen Daten verwenden, um Ihnen Newsletter, Marketing- oder Werbematerialien und andere Informationen zukommen zu lassen, die für Sie von Interesse sein könnten. Sie können den Erhalt einzelner oder aller dieser Mitteilungen von uns ablehnen, indem Sie dem Abmeldelink oder den Anweisungen in jeder von uns gesendeten E-Mail folgen oder indem Sie uns kontaktieren.\n\nWir können E-Mail-Marketing-Dienstleister verwenden, um E-Mails an Sie zu verwalten und zu senden.\n\n',
    },
    'd2pahrfn': {
      'en': 'Active Campaign\n\n',
      'de': 'Aktive Kampagne\n\n',
    },
    'oj6mgbfq': {
      'en':
          'Active Campaign is an email marketing sending service provided by The Rocket Science Group LLC.\n\nFor more information on the privacy practices of Mailchimp, please visit their Privacy policy: ',
      'de':
          'Active Campaign ist ein von The Rocket Science Group LLC bereitgestellter Dienst zum Versenden von E-Mail-Marketing.\n\nWeitere Informationen zu den Datenschutzpraktiken von Mailchimp finden Sie in deren Datenschutzrichtlinie:',
    },
    'cq136fzm': {
      'en': 'https://mailchimp.com/legal/privacy/\n\n',
      'de': 'https://mailchimp.com/legal/privacy/\n\n',
    },
    'vnxextye': {
      'en': 'Behavioral Remarketing\n\n',
      'de': 'Verhaltensbasiertes Remarketing\n\n',
    },
    'afnkwspd': {
      'en':
          'The Company uses remarketing services to advertise on third party websites to You after You visited our Service. We and Our third-party vendors use cookies to inform, optimize and serve ads based on Your past visits to our Service.\n\n',
      'de':
          'Das Unternehmen nutzt Remarketing-Dienste, um Ihnen auf Websites Dritter Werbung anzuzeigen, nachdem Sie unseren Service besucht haben. Wir und unsere Drittanbieter verwenden Cookies, um Anzeigen auf der Grundlage Ihrer früheren Besuche unseres Service zu erstellen, zu optimieren und bereitzustellen.\n\n',
    },
    'p2hajglx': {
      'en': 'Google Ads (AdWords)\n\n',
      'de': 'Google Ads (AdWords)\n\n',
    },
    'xcly9kgf': {
      'en':
          'Google Ads (AdWords) remarketing service is provided by Google Inc.\n\nYou can opt-out of Google Analytics for Display Advertising and customise the Google Display Network ads by visiting the Google Ads Settings page: ',
      'de':
          'Der Remarketing-Dienst Google Ads (AdWords) wird von Google Inc. bereitgestellt.\n\nSie können Google Analytics für Display-Werbung deaktivieren und die Anzeigen im Google Display-Netzwerk anpassen, indem Sie die Seite mit den Google Anzeigeneinstellungen aufrufen:',
    },
    '4nf22fzk': {
      'en': 'http://www.google.com/settings/ads\n\n',
      'de': 'http://www.google.com/settings/ads\n\n',
    },
    'vvored7w': {
      'en':
          'Google also recommends installing the Google Analytics Opt-out Browser Add-on – ',
      'de':
          'Google empfiehlt außerdem die Installation des Browser-Add-ons zur Deaktivierung von Google Analytics – ',
    },
    '7793d9q1': {
      'en': 'https://tools.google.com/dlpage/',
      'de': 'https://tools.google.com/dlpage/',
    },
    'ogw62cyt': {
      'en':
          ' – for your web browser. Google Analytics Opt-out Browser Add-on provides visitors with the ability to prevent their data from being collected and used by Google Analytics.\n\nFor more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: ',
      'de':
          ' – für Ihren Webbrowser. Das Browser-Add-on zur Deaktivierung von Google Analytics bietet Besuchern die Möglichkeit, die Erfassung und Verwendung ihrer Daten durch Google Analytics zu verhindern.\n\nWeitere Informationen zu den Datenschutzpraktiken von Google finden Sie auf der Webseite „Datenschutz und Nutzungsbedingungen“ von Google:',
    },
    'i20q2t87': {
      'en': 'https://policies.google.com/privacy?hl=en\n\n',
      'de': 'https://policies.google.com/privacy?hl=en\n\n',
    },
    '4zjjpp2h': {
      'en': 'Facebook\n\n',
      'de': 'auf facebook.\n\n',
    },
    'qhfp5nx4': {
      'en':
          'You can learn more about interest-based advertising from Facebook by visiting this page: ',
      'de':
          'Weitere Informationen zur interessenbasierten Werbung von Facebook finden Sie auf dieser Seite:',
    },
    'ciyooo7x': {
      'en': 'https://www.facebook.com/help/164968693837950\n\n',
      'de': 'https://www.facebook.com/help/164968693837950\n\n',
    },
    'z5xv7k5f': {
      'en':
          'To opt-out from Facebook’s interest-based ads, follow these instructions from Facebook: ',
      'de':
          'Um die interessensbasierten Anzeigen von Facebook abzulehnen, befolgen Sie diese Anweisungen von Facebook:',
    },
    '2u2do80s': {
      'en': 'https://www.facebook.com/help/568137493302217\n\n',
      'de': 'https://www.facebook.com/help/568137493302217\n\n',
    },
    '0xmywyyc': {
      'en':
          'Facebook adheres to the Self-Regulatory Principles for Online Behavioural Advertising established by the Digital Advertising Alliance. You can also opt-out from Facebook and other participating companies through the Digital Advertising Alliance in the USA ',
      'de':
          'Facebook hält sich an die von der Digital Advertising Alliance aufgestellten Selbstregulierungsgrundsätze für verhaltensbasierte Online-Werbung. Sie können sich auch über die Digital Advertising Alliance in den USA von Facebook und anderen teilnehmenden Unternehmen abmelden.',
    },
    'l874qh0d': {
      'en': 'http://www.aboutads.info/choices/',
      'de': 'http://www.aboutads.info/choices/',
    },
    '3gat2s8y': {
      'en': ', the Digital Advertising Alliance of Canada in Canada ',
      'de': ', die Digital Advertising Alliance of Canada in Kanada',
    },
    'm5vuw7ed': {
      'en': 'http://youradchoices.ca/',
      'de': 'http://youradchoices.ca/',
    },
    'p4281dp0': {
      'en':
          ', or the European Interactive Digital Advertising Alliance in Europe ',
      'de':
          'oder die European Interactive Digital Advertising Alliance in Europa',
    },
    '206tck0g': {
      'en': 'http://www.youronlinechoices.eu/',
      'de': 'http://www.youronlinechoices.eu/',
    },
    's9lght0j': {
      'en': ', or opt-out using your mobile device settings.\n\n',
      'de':
          ', oder deaktivieren Sie diese Option über die Einstellungen Ihres Mobilgeräts.\n\n',
    },
    '6qc6zm6w': {
      'en':
          'For more information on the privacy practices of Facebook, please visit Facebook’s Data Policy: ',
      'de':
          'Weitere Informationen zu den Datenschutzpraktiken von Facebook finden Sie in der Datenrichtlinie von Facebook:',
    },
    'wn8nligv': {
      'en': 'https://www.facebook.com/privacy/explanation\n\n',
      'de': 'https://www.facebook.com/privacy/explanation\n\n',
    },
    'dm54evlx': {
      'en': 'Payments\n\n',
      'de': 'Zahlungen\n\n',
    },
    'idhkf8s7': {
      'en':
          'We may provide paid products and/or services within the Service. In that case, we may use third-party services for payment processing (e.g. payment processors).\n\nWe will not store or collect Your payment card details. That information is provided directly to Our third-party payment processors whose use of Your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.\n\n',
      'de':
          'Wir können innerhalb des Dienstes kostenpflichtige Produkte und/oder Dienste anbieten. In diesem Fall können wir Dienste von Drittanbietern zur Zahlungsabwicklung nutzen (z. B. Zahlungsabwickler).\n\nWir werden Ihre Zahlungskartendaten nicht speichern oder sammeln. Diese Informationen werden direkt an unsere Drittanbieter-Zahlungsabwickler weitergegeben, deren Verwendung Ihrer persönlichen Daten durch ihre Datenschutzrichtlinie geregelt ist. Diese Zahlungsabwickler halten sich an die von PCI-DSS festgelegten Standards, die vom PCI Security Standards Council verwaltet werden, einem gemeinsamen Projekt von Marken wie Visa, Mastercard, American Express und Discover. Die PCI-DSS-Anforderungen tragen dazu bei, den sicheren Umgang mit Zahlungsinformationen zu gewährleisten.\n\n',
    },
    '9avj3mw2': {
      'en': 'Apple Store In-App Payments\n\n',
      'de': 'In-App-Zahlungen im Apple Store\n\n',
    },
    'gid3vnrr': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter',
    },
    '2l5kh7u8': {
      'en': 'https://www.apple.com/legal/privacy/en-ww/\n\n',
      'de': 'https://www.apple.com/legal/privacy/en-ww/\n\n',
    },
    '06orj1gg': {
      'en': 'Google Play In-App Payments\n\n',
      'de': 'In-App-Zahlungen bei Google Play\n\n',
    },
    'm73mluoo': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter',
    },
    'f20rfurq': {
      'en': 'https://www.google.com/policies/privacy/\n\n',
      'de': 'https://www.google.com/policies/privacy/\n\n',
    },
    'kk8cwriw': {
      'en': 'Stripe\n\n',
      'de': 'Streifen\n\n',
    },
    '9vmpo1cl': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter',
    },
    '7flaebfb': {
      'en': 'https://stripe.com/us/privacy\n\n',
      'de': 'https://stripe.com/us/privacy\n\n',
    },
    'pnnljlwu': {
      'en': 'PayPal\n\n',
      'de': 'PayPal\n\n',
    },
    'ydgmp0cd': {
      'en': 'Their Privacy Policy can be viewed at ',
      'de': 'Ihre Datenschutzrichtlinie finden Sie unter',
    },
    'm5yu4fr0': {
      'en': 'https://www.paypal.com/webapps/mpp/ua/privacy-full\n\n',
      'de': 'https://www.paypal.com/webapps/mpp/ua/privacy-full\n\n',
    },
    's73rkyhf': {
      'en':
          'When You use Our Service to pay a product and/or service via bank transfer, We may ask You to provide information to facilitate this transaction and to verify Your identity.\n\n',
      'de':
          'Wenn Sie unseren Service nutzen, um ein Produkt und/oder eine Dienstleistung per Banküberweisung zu bezahlen, bitten wir Sie möglicherweise um die Bereitstellung von Informationen, um diese Transaktion zu ermöglichen und Ihre Identität zu überprüfen.\n\n',
    },
    '74kzajxs': {
      'en':
          'GDPR PRIVACY\n\nLegal Basis for Processing Personal Data under GDPR\n\n',
      'de':
          'DSGVO DATENSCHUTZERKLÄRUNG\n\nRechtliche Grundlage für die Verarbeitung personenbezogener Daten gemäß DSGVO\n\n',
    },
    'uu8p04wx': {
      'en':
          'We may process Personal Data under the following conditions:\n\n• Consent: You have given Your consent for processing Personal Data for one or more specific purposes.\n\n• Performance of a contract: Provision of Personal Data is necessary for the performance of an agreement with You and/or for any pre-contractual obligations thereof.\n\n• Legal obligations: Processing Personal Data is necessary for compliance with a legal obligation to which the Company is subject.\n\n• Vital interests: Processing Personal Data is necessary in order to protect Your vital interests or of another natural person.\n\n• Public interests: Processing Personal Data is related to a task that is carried out in the public interest or in the exercise of official authority vested in the Company.\n\n• Legitimate interests: Processing Personal Data is necessary for the purposes of the legitimate interests pursued by the Company.\n\nIn any case, the Company will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n',
      'de':
          'Wir können personenbezogene Daten unter den folgenden Bedingungen verarbeiten:\n\n• Zustimmung: Sie haben Ihre Zustimmung zur Verarbeitung personenbezogener Daten für einen oder mehrere bestimmte Zwecke gegeben.\n\n• Vertragserfüllung: Die Bereitstellung personenbezogener Daten ist für die Erfüllung einer Vereinbarung mit Ihnen und/oder für vorvertragliche Verpflichtungen daraus erforderlich.\n\n• Gesetzliche Verpflichtungen: Die Verarbeitung personenbezogener Daten ist zur Erfüllung einer gesetzlichen Verpflichtung erforderlich, der das Unternehmen unterliegt.\n\n• Lebenswichtige Interessen: Die Verarbeitung personenbezogener Daten ist erforderlich, um Ihre lebenswichtigen Interessen oder die einer anderen natürlichen Person zu schützen.\n\n• Öffentliche Interessen: Die Verarbeitung personenbezogener Daten steht im Zusammenhang mit einer Aufgabe, die im öffentlichen Interesse oder in Ausübung öffentlicher Gewalt ausgeführt wird, die dem Unternehmen übertragen wurde.\n\n• Berechtigte Interessen: Die Verarbeitung personenbezogener Daten ist zur Wahrung der berechtigten Interessen des Unternehmens erforderlich.\n\nIn jedem Fall wird das Unternehmen Wir helfen gerne bei der Klärung der konkreten Rechtsgrundlage, auf der die Verarbeitung beruht, insbesondere ob die Bereitstellung der personenbezogenen Daten gesetzlich oder vertraglich vorgeschrieben oder für den Abschluss eines Vertrages erforderlich ist.\n\n',
    },
    '1kbwxdqe': {
      'en': 'Your Rights under the GDPR\n\n',
      'de': 'Ihre Rechte im Rahmen der DSGVO\n\n',
    },
    'wairoic1': {
      'en':
          'The Company undertakes to respect the confidentiality of Your Personal Data and to guarantee You can exercise Your rights.\n\nYou have the right under this Privacy Policy, and by law if You are within the EU, to:\n\n• Request access to Your Personal Data. The right to access, update or delete the information We have on You. Whenever made possible, you can access, update or request deletion of Your Personal Data directly within Your account settings section. If you are unable to perform these actions yourself, please contact Us to assist You. This also enables You to receive a copy of the Personal Data We hold about You.\n\n• Request correction of the Personal Data that We hold about You. You have the right to to have any incomplete or inaccurate information We hold about You corrected.\n\n• Object to processing of Your Personal Data. This right exists where We are relying on a legitimate interest as the legal basis for Our processing and there is something about Your particular situation, which makes You want to object to our processing of Your Personal Data on this ground. You also have the right to object where We are processing Your Personal Data for direct marketing purposes.\n\n• Request erasure of Your Personal Data. You have the right to ask Us to delete or remove Personal Data when there is no good reason for Us to continue processing it.\n\n• Request the transfer of Your Personal Data. We will provide to You, or to a third-party You have chosen, Your Personal Data in a structured, commonly used, machine-readable format. Please note that this right only applies to automated information which You initially provided consent for Us to use or where We used the information to perform a contract with You.\n\n• Withdraw Your consent. You have the right to withdraw Your consent on using your Personal Data. If You withdraw Your consent, We may not be able to provide You with access to certain specific functionalities of the Service.\n\n',
      'de':
          'Das Unternehmen verpflichtet sich, die Vertraulichkeit Ihrer personenbezogenen Daten zu respektieren und zu garantieren, dass Sie Ihre Rechte ausüben können.\n\nGemäß dieser Datenschutzrichtlinie und gesetzlich, wenn Sie sich innerhalb der EU befinden, haben Sie folgende Rechte:\n\n• Zugriff auf Ihre personenbezogenen Daten zu beantragen. Das Recht, auf die Informationen zuzugreifen, die wir über Sie haben, diese zu aktualisieren oder zu löschen. Wenn möglich, können Sie direkt in Ihren Kontoeinstellungen auf Ihre personenbezogenen Daten zugreifen, diese aktualisieren oder deren Löschung beantragen. Wenn Sie diese Aktionen nicht selbst durchführen können, wenden Sie sich bitte an uns, damit wir Ihnen helfen können. Auf diese Weise können Sie auch eine Kopie der personenbezogenen Daten erhalten, die wir über Sie gespeichert haben.\n\n• Korrektur der personenbezogenen Daten beantragen, die wir über Sie gespeichert haben. Sie haben das Recht, unvollständige oder ungenaue Informationen, die wir über Sie gespeichert haben, korrigieren zu lassen.\n\n• Widerspruch gegen die Verarbeitung Ihrer personenbezogenen Daten einzulegen. Dieses Recht besteht, wenn wir uns auf ein berechtigtes Interesse als Rechtsgrundlage für unsere Verarbeitung berufen und Ihre besondere Situation Sie dazu veranlasst, unserer Verarbeitung Ihrer personenbezogenen Daten aus diesem Grund zu widersprechen. Sie haben auch ein Widerspruchsrecht, wenn wir Ihre personenbezogenen Daten für Direktmarketingzwecke verarbeiten.\n\n• Löschung Ihrer personenbezogenen Daten verlangen. Sie haben das Recht, uns aufzufordern, personenbezogene Daten zu löschen oder zu entfernen, wenn es für uns keinen triftigen Grund gibt, sie weiterhin zu verarbeiten.\n\n• Übertragung Ihrer personenbezogenen Daten verlangen. Wir werden Ihnen oder einem von Ihnen ausgewählten Dritten Ihre personenbezogenen Daten in einem strukturierten, allgemein verwendeten und maschinenlesbaren Format bereitstellen. Bitte beachten Sie, dass dieses Recht nur für automatisierte Informationen gilt, deren Nutzung wir ursprünglich genehmigt haben, oder die wir zur Erfüllung eines Vertrags mit Ihnen verwendet haben.\n\n• Ihre Einwilligung widerrufen. Sie haben das Recht, Ihre Einwilligung zur Nutzung Ihrer personenbezogenen Daten zu widerrufen. Wenn Sie Ihre Einwilligung widerrufen, können wir Ihnen möglicherweise keinen Zugriff mehr auf bestimmte Funktionen des Dienstes gewähren.\n\n',
    },
    'h2jai3eu': {
      'en': 'Exercising of Your GDPR Data Protection Rights\n\n',
      'de': 'Ausübung Ihrer DSGVO-Datenschutzrechte\n\n',
    },
    'jpzo6iw4': {
      'en':
          'You may exercise Your rights of access, rectification, cancellation and opposition by contacting Us. Please note that we may ask You to verify Your identity before responding to such requests. If You make a request, We will try our best to respond to You as soon as possible.\n\nYou have the right to complain to a Data Protection Authority about Our collection and use of Your Personal Data. For more information, if You are in the European Economic Area (EEA), please contact Your local data protection authority in the EEA.\n\n',
      'de':
          'Sie können Ihr Recht auf Zugriff, Berichtigung, Löschung und Widerspruch ausüben, indem Sie uns kontaktieren. Bitte beachten Sie, dass wir Sie möglicherweise bitten, Ihre Identität zu bestätigen, bevor wir auf solche Anfragen antworten. Wenn Sie eine Anfrage stellen, werden wir unser Bestes tun, um Ihnen so schnell wie möglich zu antworten.\n\nSie haben das Recht, sich bei einer Datenschutzbehörde über unsere Erhebung und Verwendung Ihrer personenbezogenen Daten zu beschweren. Wenn Sie sich im Europäischen Wirtschaftsraum (EWR) befinden, wenden Sie sich für weitere Informationen bitte an Ihre lokale Datenschutzbehörde im EWR.\n\n',
    },
    'iaa7bfaf': {
      'en': 'GDPR PRIVACY\n\nYour Rights under the CCPA\n\n',
      'de': 'DSGVO DATENSCHUTZ\n\nIhre Rechte im Rahmen des CCPA\n\n',
    },
    'f1irwnw7': {
      'en':
          'Under this Privacy Policy, and by law if You are a resident of California, You have the following rights:\n\n• The right to notice. You must be properly notified which categories of Personal Data are being collected and the purposes for which the Personal Data is being used.\n\n• The right to access / the right to request. The CCPA permits You to request and obtain from the Company information regarding the disclosure of Your Personal Data that has been collected in the past 12 months by the Company or its subsidiaries to a third-party for the third party’s direct marketing purposes.\n\n• The right to say no to the sale of Personal Data. You also have the right to ask the Company not to sell Your Personal Data to third parties. You can submit such a request by visiting our “Do Not Sell My Personal Information” section or web page.\n\n• The right to know about Your Personal Data. You have the right to request and obtain from the Company information regarding the disclosure of the following:\n\n• The categories of Personal Data collected\n\n• The sources from which the Personal Data was collected\n\n• The business or commercial purpose for collecting or selling the Personal Data\n\n• Categories of third parties with whom We share Personal Data\n\n• The specific pieces of Personal Data we collected about You\n\n• The right to delete Personal Data. You also have the right to request the deletion of Your Personal Data that have been collected in the past 12 months.\n\n• The right not to be discriminated against. You have the right not to be discriminated against for exercising any of Your Consumer’s rights, including by:\n\n• Denying goods or services to You\n\n• Charging different prices or rates for goods or services, including the use of discounts or other benefits or imposing penalties\n\n• Providing a different level or quality of goods or services to You\n\n• Suggesting that You will receive a different price or rate for goods or services or a different level or quality of goods or services.\n\n',
      'de':
          'Gemäß dieser Datenschutzrichtlinie und per Gesetz haben Sie, wenn Sie in Kalifornien ansässig sind, folgende Rechte:\n\n• Das Recht auf Benachrichtigung. Sie müssen ordnungsgemäß darüber informiert werden, welche Kategorien personenbezogener Daten erfasst werden und zu welchen Zwecken die personenbezogenen Daten verwendet werden.\n\n• Das Recht auf Zugriff/das Recht auf Anfrage. Das CCPA gestattet Ihnen, vom Unternehmen Informationen bezüglich der Weitergabe Ihrer personenbezogenen Daten anzufordern und zu erhalten, die in den letzten 12 Monaten vom Unternehmen oder seinen Tochtergesellschaften an Dritte für Direktmarketingzwecke erfasst wurden.\n\n• Das Recht, dem Verkauf personenbezogener Daten zu widersprechen. Sie haben auch das Recht, das Unternehmen aufzufordern, Ihre personenbezogenen Daten nicht an Dritte zu verkaufen. Sie können eine solche Anfrage stellen, indem Sie unseren Abschnitt oder unsere Webseite „Meine personenbezogenen Daten nicht verkaufen“ besuchen.\n\n• Das Recht auf Kenntnis Ihrer personenbezogenen Daten. Sie haben das Recht, vom Unternehmen Informationen zur Offenlegung der folgenden Informationen anzufordern und zu erhalten:\n\n• Die Kategorien der erfassten personenbezogenen Daten\n\n• Die Quellen, aus denen die personenbezogenen Daten erfasst wurden\n\n• Der geschäftliche oder kommerzielle Zweck für die Erfassung oder den Verkauf der personenbezogenen Daten\n\n• Kategorien von Drittanbietern, mit denen wir personenbezogene Daten teilen\n\n• Die spezifischen personenbezogenen Daten, die wir über Sie erfasst haben\n\n• Das Recht auf Löschung personenbezogener Daten. Sie haben auch das Recht, die Löschung Ihrer personenbezogenen Daten zu verlangen, die in den letzten 12 Monaten erfasst wurden.\n\n\n• Das Recht, nicht diskriminiert zu werden. Sie haben das Recht, bei der Ausübung Ihrer Verbraucherrechte nicht diskriminiert zu werden, einschließlich durch:\n\n• Verweigerung von Waren oder Dienstleistungen an Sie\n\n• Erhebung unterschiedlicher Preise oder Tarife für Waren oder Dienstleistungen, einschließlich der Gewährung von Rabatten oder anderen Vorteilen oder der Verhängung von Strafen\n\n• Bereitstellung eines anderen Niveaus oder einer anderen Qualität von Waren oder Dienstleistungen an Sie\n\n• Andeutung, dass Sie für Waren oder Dienstleistungen einen anderen Preis oder Tarif oder ein anderes Niveau oder eine andere Qualität von Waren oder Dienstleistungen erhalten.\n\n',
    },
    'fzzvgesc': {
      'en': 'Exercising Your CCPA Data Protection Rights\n\n',
      'de': 'Ausübung Ihrer CCPA-Datenschutzrechte\n\n',
    },
    'og8tx98m': {
      'en':
          'In order to exercise any of Your rights under the CCPA, and if you are a California resident, You can email or call us or visit our “Do Not Sell My Personal Information” section or web page.\n\nThe Company will disclose and deliver the required information free of charge within 45 days of receiving Your verifiable request. The time period to provide the required information may be extended once by an additional 45 days when reasonable necessary and with prior notice.\n\n',
      'de':
          'Um Ihre Rechte gemäß CCPA auszuüben, können Sie uns als Einwohner Kaliforniens eine E-Mail senden, uns anrufen oder unseren Abschnitt oder unsere Webseite „Meine persönlichen Daten nicht verkaufen“ besuchen.\n\nDas Unternehmen wird die erforderlichen Informationen innerhalb von 45 Tagen nach Erhalt Ihrer überprüfbaren Anfrage kostenlos offenlegen und bereitstellen. Die Frist zur Bereitstellung der erforderlichen Informationen kann einmal um weitere 45 Tage verlängert werden, wenn dies angemessen und nach vorheriger Ankündigung erforderlich ist.\n\n',
    },
    'omp9zedd': {
      'en': 'Do Not Sell My Personal Information\n\n',
      'de': 'Verkaufen Sie meine persönlichen Daten nicht\n',
    },
    'low57xme': {
      'en':
          'We do not sell personal information. However, the Service Providers we partner with (for example, our advertising partners) may use technology on the Service that “sells” personal information as defined by the CCPA law.\n\nIf you wish to opt out of the use of your personal information for interest-based advertising purposes and these potential sales as defined under CCPA law, you may do so by following the instructions below.\n\nPlease note that any opt out is specific to the browser You use. You may need to opt out on every browser that you use.\n\n',
      'de':
          'Wir verkaufen keine personenbezogenen Daten. Die Dienstanbieter, mit denen wir zusammenarbeiten (z. B. unsere Werbepartner), können jedoch Technologien für den Dienst verwenden, die personenbezogene Daten im Sinne des CCPA-Gesetzes „verkaufen“.\n\nWenn Sie der Verwendung Ihrer personenbezogenen Daten für interessenbasierte Werbezwecke und diesen potenziellen Verkäufen im Sinne des CCPA-Gesetzes widersprechen möchten, können Sie dies tun, indem Sie die folgenden Anweisungen befolgen.\n\nBitte beachten Sie, dass jede Deaktivierung spezifisch für den von Ihnen verwendeten Browser ist. Möglicherweise müssen Sie die Deaktivierung in jedem von Ihnen verwendeten Browser durchführen.\n\n',
    },
    'unnve6su': {
      'en': 'Website\n\n',
      'de': 'Webseite\n\n',
    },
    '51fapj5l': {
      'en':
          'You can opt out of receiving ads that are personalized as served by our Service Providers by following our instructions presented on the Service:\n\n• From Our “Cookie Consent” notice banner\n\n• Or from Our “CCPA Opt-out” notice banner\n\n• Or from Our “Do Not Sell My Personal Information” notice banner\n\n• Or from Our “Do Not Sell My Personal Information” link\n\nThe opt out will place a cookie on Your computer that is unique to the browser You use to opt out. If you change browsers or delete the cookies saved by your browser, you will need to opt out again.\n\n',
      'de':
          'Sie können den Erhalt personalisierter Werbung unserer Dienstanbieter ablehnen, indem Sie unseren Anweisungen im Dienst folgen:\n\n• Über unser Hinweisbanner „Cookie-Einwilligung“\n\n• Oder über unser Hinweisbanner „CCPA-Opt-out“\n\n• Oder über unser Hinweisbanner „Meine persönlichen Daten nicht verkaufen“\n\n• Oder über unseren Link „Meine persönlichen Daten nicht verkaufen“\n\nDurch die Abmeldung wird auf Ihrem Computer ein Cookie platziert, das für den von Ihnen zur Abmeldung verwendeten Browser eindeutig ist. Wenn Sie den Browser wechseln oder die von Ihrem Browser gespeicherten Cookies löschen, müssen Sie die Abmeldung erneut vornehmen.\n\n',
    },
    'bb1h1993': {
      'en': 'Mobile Devices\n\n',
      'de': 'Mobile Geräte\n\n',
    },
    'zxt9q6jy': {
      'en':
          'Your mobile device may give you the ability to opt out of the use of information about the apps you use in order to serve you ads that are targeted to your interests:\n\n\n• “Opt out of Interest-Based Ads” or “Opt out of Ads Personalization” on Android devices\n\n\n• “Limit Ad Tracking” on iOS devices\n\n\nYou can also stop the collection of location information from Your mobile device by changing the preferences on your mobile device.\n\n',
      'de':
          'Auf Ihrem Mobilgerät haben Sie möglicherweise die Möglichkeit, die Verwendung von Informationen über die von Ihnen genutzten Apps abzulehnen, um Ihnen auf Ihre Interessen ausgerichtete Werbung anzuzeigen:\n\n\n• „Deaktivierung von interessensbasierten Anzeigen“ oder „Deaktivierung von personalisierter Werbung“ auf Android-Geräten\n\n\n• „Ad-Tracking beschränken“ auf iOS-Geräten\n\n\nSie können die Erfassung von Standortinformationen von Ihrem Mobilgerät auch beenden, indem Sie die Einstellungen auf Ihrem Mobilgerät ändern.\n\n',
    },
    'dlsenjv4': {
      'en':
          '“DO NOT TRACK” POLICY AS REQUIRED BY CALIFORNIA ONLINE PRIVACY PROTECTION ACT (CALOPPA)\n\n',
      'de':
          '„DO NOT TRACK“-RICHTLINIE GEMÄSS DEM CALIFORNIA ONLINE PRIVACY PROTECTION ACT (CALOPPA)\n\n',
    },
    '8nl3x4r5': {
      'en':
          'Our Service does not respond to Do Not Track signals.\n\n\nHowever, some third party websites do keep track of Your browsing activities. If You are visiting such websites, You can set Your preferences in Your web browser to inform websites that You do not want to be tracked. You can enable or disable DNT by visiting the preferences or settings page of Your web browser.\n\n',
      'de':
          'Unser Service reagiert nicht auf „Do Not Track“-Signale.\n\n\nEinige Websites von Drittanbietern verfolgen jedoch Ihre Browsing-Aktivitäten. Wenn Sie solche Websites besuchen, können Sie Ihre Einstellungen in Ihrem Webbrowser so festlegen, dass Websites darüber informiert werden, dass Sie nicht verfolgt werden möchten. Sie können DNT aktivieren oder deaktivieren, indem Sie die Einstellungs- oder Einstellungsseite Ihres Webbrowsers aufrufen.\n\n',
    },
    'r014fa2a': {
      'en': 'CHILDREN’S PRIVACY\n\n',
      'de': 'DATENSCHUTZ FÜR KINDER\n\n',
    },
    'trbr04fn': {
      'en':
          'Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n\n\nWe also may limit how We collect, use, and store some of the information of Users between 13 and 18 years old. In some cases, this means We will be unable to provide certain functionality of the Service to these users.\n\n\nIf We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent’s consent before We collect and use that information.\n\n',
      'de':
          'Unser Dienst richtet sich nicht an Personen unter 13 Jahren. Wir erfassen wissentlich keine personenbezogenen Daten von Personen unter 13 Jahren. Wenn Sie ein Elternteil oder Erziehungsberechtigter sind und wissen, dass Ihr Kind uns personenbezogene Daten übermittelt hat, nehmen Sie bitte Kontakt mit uns auf. Wenn uns bekannt wird, dass wir personenbezogene Daten von Personen unter 13 Jahren ohne Überprüfung der elterlichen Zustimmung erfasst haben, ergreifen wir Maßnahmen, um diese Informationen von unseren Servern zu entfernen.\n\n\n\nWir können außerdem die Art und Weise einschränken, wie wir einige Informationen von Benutzern zwischen 13 und 18 Jahren erfassen, verwenden und speichern. In einigen Fällen bedeutet dies, dass wir diesen Benutzern bestimmte Funktionen des Dienstes nicht zur Verfügung stellen können.\n\n\nWenn wir uns auf die Zustimmung als Rechtsgrundlage für die Verarbeitung Ihrer Informationen verlassen müssen und Ihr Land die Zustimmung eines Elternteils erfordert, benötigen wir möglicherweise die Zustimmung Ihres Elternteils, bevor wir diese Informationen erfassen und verwenden.\n\n',
    },
    '926799io': {
      'en':
          'YOUR CALIFORNIA PRIVACY RIGHTS (CALIFORNIA BUSINESS AND PROFESSIONS CODE SECTION 22581)\n\n',
      'de':
          'IHRE DATENSCHUTZRECHTE IN KALIFORNIEN (Kaliforniens Geschäfts- und Berufsgesetzbuch, Abschnitt 22581)\n\n',
    },
    '2yry8nux': {
      'en':
          'California Business and Professions Code section 22581 allow California residents under the age of 18 who are registered users of online sites, services or applications to request and obtain removal of content or information they have publicly posted.\n\n\nTo request removal of such data, and if you are a California resident, You can contact Us using the contact information provided below, and include the email address associated with Your account.\n\n\nBe aware that Your request does not guarantee complete or comprehensive removal of content or information posted online and that the law may not permit or require removal in certain circumstances.\n\n',
      'de':
          'Gemäß Abschnitt 22581 des California Business and Professions Code können in Kalifornien ansässige Personen unter 18 Jahren, die registrierte Benutzer von Online-Sites, -Diensten oder -Anwendungen sind, die Entfernung von Inhalten oder Informationen beantragen und erreichen, die sie öffentlich gepostet haben.\n\n\nUm die Entfernung solcher Daten zu beantragen, können Sie als Einwohner Kaliforniens uns über die unten angegebenen Kontaktinformationen erreichen und die mit Ihrem Konto verknüpfte E-Mail-Adresse angeben.\n\n\nBitte beachten Sie, dass Ihr Antrag keine vollständige oder umfassende Entfernung von online geposteten Inhalten oder Informationen garantiert und dass das Gesetz die Entfernung unter bestimmten Umständen nicht erlauben oder vorschreiben kann.\n\n',
    },
    'hp8gy5uc': {
      'en': 'LINKS TO OTHER WEBSITES\n\n',
      'de': 'LINKS ZU ANDEREN WEBSITES\n\n',
    },
    'rg3174q6': {
      'en':
          'Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party’s site. We strongly advise You to review the Privacy Policy of every site You visit.\n\n\nWe have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\n\n',
      'de':
          'Unser Service kann Links zu anderen Websites enthalten, die nicht von uns betrieben werden. Wenn Sie auf einen Link eines Drittanbieters klicken, werden Sie auf die Website dieses Drittanbieters weitergeleitet. Wir empfehlen Ihnen dringend, die Datenschutzrichtlinien aller von Ihnen besuchten Websites zu lesen.\n\n\nWir haben keine Kontrolle über und übernehmen keine Verantwortung für den Inhalt, die Datenschutzrichtlinien oder -praktiken von Websites oder Diensten Dritter.\n\n',
    },
    'jtu7qlu2': {
      'en': 'CHANGES TO THIS PRIVACY POLICY\n\n',
      'de': 'ÄNDERUNGEN DIESER DATENSCHUTZERKLÄRUNG\n\n',
    },
    'qce0iq8d': {
      'en':
          'We may update our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the “Last updated” date at the top of this Privacy Policy.\n\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n\n',
      'de':
          'Wir können unsere Datenschutzrichtlinie von Zeit zu Zeit aktualisieren. Wir werden Sie über alle Änderungen informieren, indem wir die neue Datenschutzrichtlinie auf dieser Seite veröffentlichen.\n\n\nWir werden Sie per E-Mail und/oder durch einen deutlichen Hinweis auf unserem Service informieren, bevor die Änderung wirksam wird, und das Datum „Zuletzt aktualisiert“ oben in dieser Datenschutzrichtlinie aktualisieren.\n\n\nEs wird Ihnen empfohlen, diese Datenschutzrichtlinie regelmäßig auf Änderungen zu überprüfen. Änderungen an dieser Datenschutzrichtlinie werden wirksam, wenn sie auf dieser Seite veröffentlicht werden.\n\n',
    },
    '7rnu9mj3': {
      'en': 'CONTACT US\n\n',
      'de': 'KONTAKTIEREN SIE UNS\n\n',
    },
    'kn6struv': {
      'en':
          'If you have any questions about this Privacy Policy, You can contact us:\n\n\nBy email:',
      'de':
          'Wenn Sie Fragen zu dieser Datenschutzrichtlinie haben, können Sie uns kontaktieren:\n\n\nPer E-Mail:',
    },
    '5x963izp': {
      'en': ' info@hiit-the-beat.com',
      'de': 'info@hiit-the-beat.com',
    },
    'jijfrnru': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // ImprintPage
  {
    'xprmaod8': {
      'en': 'Imprint',
      'de': 'Impressum',
    },
    '4vlpojcb': {
      'en': 'Website\n',
      'de': 'Webseite\n',
    },
    'ksxzeehf': {
      'en': 'Email\n',
      'de': 'E-Mail\n',
    },
    'bwendk48': {
      'en': 'Managed by\n',
      'de': 'Verwaltet von\n',
    },
    'twz86pg6': {
      'en': 'Registered court\n',
      'de': 'Eingetragenes Gericht\n',
    },
    'ntrdw5yy': {
      'en': 'VAT Tax ID\n',
      'de': 'Umsatzsteuer-Identifikationsnummer\n',
    },
    'h6zncems': {
      'en':
          'The content of these pages has been edited and controlled thoroughly. Breakletics® does not warrant for the topicality, correctness, completeness or quality of the provided information.\n\nClaims against Breakletics®, that relate to material or intellectual issues, that occurred through usage or non-usage of the provided information or the faulty and incomplete information, are excluded by any means, if no provable, intentional or negligent fault exists.\n\nBreakletics® reserves its rights to change parts, or the entire content of the webpage, to extend, to delete or to cancel the publication without prior notification.',
      'de':
          'Der Inhalt dieser Seiten wurde sorgfältig bearbeitet und kontrolliert. Breakletics® übernimmt keinerlei Gewähr für die Aktualität, Korrektheit, Vollständigkeit oder Qualität der bereitgestellten Informationen.\n\nAnsprüche gegen Breakletics®, die sich auf Schäden materieller oder ideeller Art beziehen, die durch die Nutzung oder Nichtnutzung der dargebotenen Informationen bzw. fehlerhafter und unvollständiger Informationen verursacht wurden, sind grundsätzlich ausgeschlossen, sofern kein nachweisbares, vorsätzliches oder grob fahrlässiges Verschulden vorliegt.\n\nBreakletics® behält sich das Recht vor, Teile der Seiten oder den gesamten Inhalt der Seite ohne vorherige Ankündigung zu verändern, zu ergänzen, zu löschen oder die Veröffentlichung einzustellen.',
    },
    'gh0xmelv': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // ProfilePage
  {
    'auupik7r': {
      'en': 'Plusmember',
      'de': 'PlusMember',
    },
    'tc938d2b': {
      'en': 'Edit profile',
      'de': 'Profil bearbeiten',
    },
    'upquf72x': {
      'en': 'Sign Up',
      'de': 'Melden Sie sich an',
    },
    'g0sl24xg': {
      'en': 'Become a Plusmember',
      'de': 'Werde PlusMember',
    },
    'j5hob92h': {
      'en': 'Manage subscription',
      'de': 'Abonnement verwalten',
    },
    'kauy94q7': {
      'en': 'HIIT the Beat Shop',
      'de': 'HIIT the Beat Shop',
    },
    'gcafpkr2': {
      'en': 'Style yourself for the most energized workout in the world',
      'de': 'Shoppe jetzt freshe Styles in unserem Shop',
    },
    'xhmag6ub': {
      'en': 'Watch the introductory video',
      'de': 'Schau dir das Einführungsvideo an',
    },
    'v600m13f': {
      'en': 'We’ll tell you more about the app',
      'de': 'Wir verraten dir mehr über die App',
    },
    'hy77uyxj': {
      'en': 'Change email',
      'de': 'E-Mail ändern',
    },
    'o52su2z8': {
      'en': 'Change password',
      'de': 'Kennwort ändern',
    },
    'nh8ptgtb': {
      'en': 'Add phone number',
      'de': 'Handynummer hinzufügen',
    },
    'q23yvtm6': {
      'en': 'Language',
      'de': 'Sprache',
    },
    'hnmc6b5n': {
      'en': 'Terms & conditions',
      'de': 'Allgemeine Geschäftsbedingungen',
    },
    'qopf0y37': {
      'en': 'Privacy policy',
      'de': 'Datenschutzrichtlinien',
    },
    '1rpkcydr': {
      'en': 'Imprint',
      'de': 'Impressum',
    },
    'i1kbaueb': {
      'en': 'Admin Panel',
      'de': 'Admin Panel',
    },
    'cjp0056j': {
      'en': 'Log out',
      'de': 'Abmelden',
    },
    'eqj9yd67': {
      'en': 'Follow us to dive deeper into our world and join our community!',
      'de':
          'Folge uns für noch mehr Motivation, Challenges und um unsere Community noch besser kennenzulernen',
    },
    'k60uavkn': {
      'en': 'Designed and developed by',
      'de': 'Entworfen und entwickelt von',
    },
    'oxm2sfzy': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // PasswordChangePage
  {
    '7x2848dd': {
      'en': 'To change password we’ll send a link to your email',
      'de':
          'Um Ihr Passwort zu ändern, senden wir Ihnen einen Link an Ihre E-Mail',
    },
    '4lzai42k': {
      'en': 'Send link',
      'de': 'Link senden',
    },
    'c86ezv2l': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // PasswordChangePage2
  {
    'tw4mqvkb': {
      'en': 'We sent the link to the',
      'de': 'Wir haben den Link zum',
    },
    'sv6lbbmf': {
      'en': 'Follow this link to recover your password',
      'de': 'Folgen Sie diesem Link, um Ihr Passwort zu ändern',
    },
    '5w8av4kw': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'o9ecc7qf': {
      'en': 'Resend',
      'de': 'Erneut senden',
    },
    'amsuas9l': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // ProfileEditPage
  {
    'nqxtmtlw': {
      'en': 'Edit profile',
      'de': 'Profil bearbeiten',
    },
    '8kodqpfs': {
      'en': 'Use PNG or JPG up to 5 MB',
      'de': 'Verwende PNG oder JPG bis zu 5 MB',
    },
    'ykfx9rrd': {
      'en': 'Name',
      'de': 'Name',
    },
    'y7c73v6l': {
      'en': '',
      'de': '',
    },
    'iucaudhi': {
      'en': 'Fill in the field',
      'de': 'Fülle das Feld aus',
    },
    'z32b285m': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
    },
    'go07m07e': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
    },
    '9i11qttu': {
      'en': '',
      'de': '',
    },
    'uw5rooxb': {
      'en': 'Surname',
      'de': 'Nachname',
    },
    'x94bsrmy': {
      'en': '',
      'de': '',
    },
    '49xzdd9n': {
      'en': 'Goal',
      'de': 'Ziel',
    },
    'xz3hzjuf': {
      'en': 'Date of birth',
      'de': 'Geburtsdatum',
    },
    'rf9zfcww': {
      'en': 'Weight (kg)',
      'de': 'Gewicht (kg)',
    },
    '3okxuvcp': {
      'en': '',
      'de': '',
    },
    'd640scwx': {
      'en': 'Height (cm)',
      'de': 'Größe (cm)',
    },
    'g972tlhg': {
      'en': '',
      'de': '',
    },
    '78w933u7': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'kg4rtnpu': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // StartPage
  {
    'i142h907': {
      'en': 'Home',
      'de': 'Home',
    },
    'q8fakecu': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
    },
  },
  // AdditionalsPage
  {
    'q9dc63ht': {
      'en': 'Additionals',
      'de': 'Extras',
    },
    'mb2mr8pm': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // SeasonWorkoutPage
  {
    'lmxhteh0': {
      'en': 'Workout collections',
      'de': 'Workout Sammlung',
    },
    'qw7pnzfy': {
      'en':
          'To enjoy the best experience, we recommend you to follow the order of the seasons',
      'de':
          'Für das beste Workout Erlebnis empfehlen wir dir, die Reihenfolge der Seasons einzuhalten',
    },
    'yrqvaylo': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // SeasonPage
  {
    'mxpx9rzm': {
      'en': 'Workouts',
      'de': 'Workouts',
    },
    'h6cdw51d': {
      'en': '~ ',
      'de': ' ~ ',
    },
    '9r70ns32': {
      'en': 'Follow the order we suggest to enjoy the best experience',
      'de':
          'Befolge die von uns empfohlene Reihenfolge für das beste Workout Erlebnis',
    },
    'p9o02uno': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // WorkoutPage
  {
    'hfc9tug4': {
      'en': 'Workout',
      'de': 'Workout',
    },
    '9uuwdann': {
      'en': '~ ',
      'de': ' ~ ',
    },
    'ogo05fgc': {
      'en': 'We recommend to have at least 1 day rest. See you on ',
      'de':
          'Wir empfehlen dir mindestens einen Restday zwischen den HIIT Einheiten einzulegen. Wir sehen uns am ',
    },
    'xqkxpz10': {
      'en': 'Follow the order we suggest to enjoy the best experience',
      'de':
          'Befolge die von uns empfohlene Reihenfolge für das beste Workout Erlebnis',
    },
    'ttmquoe5': {
      'en':
          'Late to the party?  We’re still glad you’re here! Let´s HIIT some Beats',
      'de':
          'Zu spät zur Party?  Wir freuen uns immer noch, dass Sie hier sind! Lass es uns vernichten!',
    },
    'p53fx38i': {
      'en': '1',
      'de': '1',
    },
    'hyj8qyc2': {
      'en': 'Warm Up',
      'de': 'Warm Up',
    },
    'q9ykafwt': {
      'en': 'Done',
      'de': 'Erledigt',
    },
    'd4zh2xau': {
      'en': 'Select one of ours or do you own',
      'de': 'Wähle dein warm up oder führe ein eigenes durch',
    },
    'ao6mwsco': {
      'en': 'Select one of ours',
      'de': 'Wähle dein Warm Up',
    },
    'rfuq6jtu': {
      'en': 'Done',
      'de': 'Done',
    },
    'dqu8vcqt': {
      'en': '2',
      'de': '2',
    },
    '3woy2uip': {
      'en': 'Workout',
      'de': 'Dein Workout',
    },
    'kop4kqqr': {
      'en': 'Done',
      'de': 'Erledigt',
    },
    'ki4vgbte': {
      'en': 'Tap on the video to start',
      'de': 'Tippe auf das Video, um das Workout zu starten',
    },
    'bd3xpxi8': {
      'en': 'Done',
      'de': 'Done',
    },
    'dxsm9yqn': {
      'en': '3',
      'de': '3',
    },
    '5rwsp51x': {
      'en': 'Cool Down',
      'de': 'Cool Down',
    },
    'lr3dsez4': {
      'en': 'Done',
      'de': 'Erledigt',
    },
    'qqc0qxqz': {
      'en': 'Select one of ours or do you own',
      'de': 'Wähle ein Cool Down oder mache dein eigenes',
    },
    'kr5agtv7': {
      'en': 'Select one of ours',
      'de': 'Wähle dein Cool Down',
    },
    'l4j7009c': {
      'en': 'Done',
      'de': 'Done',
    },
    'pf7q4dog': {
      'en': 'Let’s Go!',
      'de': 'Let’s go!',
    },
    '36253ub2': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAuth
  {
    'gn09rlzh': {
      'en': 'Log in',
      'de': 'Einloggen',
    },
    't1y0z9fy': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    '9dqjy81q': {
      'en': '',
      'de': '',
    },
    '89ryaonu': {
      'en': 'admin@gmail.com',
      'de': 'admin@gmail.com',
    },
    'lite8bzu': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'tledtni8': {
      'en': '',
      'de': '',
    },
    'ul82ygee': {
      'en': 'Log in',
      'de': 'Einloggen',
    },
    'ux2xiog2': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminUserManagement
  {
    'xvzqinso': {
      'en': 'users',
      'de': 'Benutzer',
    },
    'atu7e31q': {
      'en': 'Search by name & surname',
      'de': 'Suche nach Vor- und Nachnamen',
    },
    '777taxqm': {
      'en': 'Export to Excel',
      'de': 'Nach Excel exportieren',
    },
    '9k2mq9vi': {
      'en': 'Name',
      'de': 'Name',
    },
    '1z9ju4z5': {
      'en': 'Surname',
      'de': 'Nachname',
    },
    'yj7dmpyo': {
      'en': 'Gender',
      'de': 'Geschlecht',
    },
    '6lsi09wz': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'ojqqej2c': {
      'en': 'Progress',
      'de': 'Fortschritt',
    },
    '7x72k1pp': {
      'en': 'Date of birth',
      'de': 'Geburtsdatum',
    },
    'n11ijf50': {
      'en': 'Weight (kg)',
      'de': 'Gewicht (kg)',
    },
    'volnyvvf': {
      'en': 'Height (cm)',
      'de': 'Höhe (cm)',
    },
    '10c251t1': {
      'en': 'Status',
      'de': 'Status',
    },
    'oko5ro7j': {
      'en': 'Active',
      'de': 'Aktiv',
    },
    'xcjzr0am': {
      'en': 'Blocked',
      'de': 'Blockiert',
    },
    'em51kq6q': {
      'en': 'Deleted',
      'de': 'Gelöscht',
    },
    'be3znh29': {
      'en': 'Plusmember',
      'de': 'Plusmitglied',
    },
    'avlcdcx3': {
      'en': 'Yes',
      'de': 'Ja',
    },
    'j2z18xgk': {
      'en': 'No',
      'de': 'NEIN',
    },
    'k7k9x8vg': {
      'en': ' ',
      'de': '',
    },
    'c0gjbjr9': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminSettings
  {
    'gelx7em1': {
      'en': 'Settings',
      'de': 'Einstellungen',
    },
    'm03us9tr': {
      'en': 'Reset password',
      'de': 'Passwort zurücksetzen',
    },
    'xnsc4vlh': {
      'en': 'Change email',
      'de': 'E-Mail ändern',
    },
    'gpyj365m': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'xqkc5ff4': {
      'en': '',
      'de': '',
    },
    '2l2dyi4l': {
      'en': 'admin@gmail.com',
      'de': 'admin@gmail.com',
    },
    'sjmi3yh8': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditPromo
  {
    'tv5ek6oa': {
      'en': 'Edit promocode',
      'de': 'Promocode bearbeiten',
    },
    'ypng3kib': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'kbcfs0il': {
      'en': 'Text EN',
      'de': 'Text DE',
    },
    'ovc8cvch': {
      'en': '',
      'de': '',
    },
    '7nx3td4t': {
      'en': 'Text DE',
      'de': 'Text DE',
    },
    '1y2r3znx': {
      'en': '',
      'de': '',
    },
    'pr0wbgmi': {
      'en': 'Show',
      'de': 'Zeigen',
    },
    'pu38sslk': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminPromo
  {
    'rijazseg': {
      'en': 'Promocodes',
      'de': 'Aktionscodes',
    },
    'jakthcij': {
      'en': 'New promocode',
      'de': 'Neuer Aktionscode',
    },
    '7h16sw6x': {
      'en': 'Show',
      'de': 'Zeigen',
    },
    'a4k75jhp': {
      'en': 'Hide',
      'de': 'Verstecken',
    },
    'dskyrldf': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAddPromo
  {
    '87zojueq': {
      'en': 'Add promocode',
      'de': 'Aktionscode hinzufügen',
    },
    'qh84f4nm': {
      'en': 'Create',
      'de': 'Erstellen',
    },
    'jo23h4a1': {
      'en': 'Text EN',
      'de': 'Text EN',
    },
    'z1fmsedl': {
      'en': '',
      'de': '',
    },
    '14zti1gc': {
      'en': 'Become a Plusmember with a 30% discount until February 12',
      'de':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. Februar 30 % Rabatt',
    },
    '3ljsfn3c': {
      'en': 'Text DE',
      'de': 'Text DE',
    },
    '0uncxkv7': {
      'en': '',
      'de': '',
    },
    'p20o3tu6': {
      'en':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. Februar 30 % Rabatt',
      'de':
          'Werden Sie Plusmitglied und erhalten Sie bis zum 12. Februar 30 % Rabatt',
    },
    'quw9mgbq': {
      'en': 'Show',
      'de': 'Zeigen',
    },
    'mbnx66oq': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAdditional
  {
    '77s5yanw': {
      'en': 'Warm Ups & Cool Downs',
      'de': 'Warm Ups & Cool Downs',
    },
    'b3bc79im': {
      'en': 'New Warm Up',
      'de': 'Neue Warm Up',
    },
    '1lsyn0sh': {
      'en': 'New Cool Down',
      'de': 'Neue Cool Down',
    },
    'u4h5hqqi': {
      'en': 'views',
      'de': 'Ansichten',
    },
    '81xjo9ig': {
      'en': 'Free',
      'de': 'Free',
    },
    '7hr4cdd9': {
      'en': 'Paid',
      'de': 'Bezahlt',
    },
    '77uu1dze': {
      'en': ' ',
      'de': '',
    },
    'rc2idfec': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditAddit
  {
    'm6yc3x9u': {
      'en': 'Edit Warm Up',
      'de': 'Warm Up bearbeiten',
    },
    'x56bdoay': {
      'en': 'Edit Cool Down',
      'de': 'Cool Down bearbeiten',
    },
    'mjuo4hff': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'vzcz955w': {
      'en': 'Index',
      'de': 'Index',
    },
    'icuo94p4': {
      'en': '',
      'de': '',
    },
    'nbomdko0': {
      'en': '1',
      'de': '1',
    },
    'p2v8ys5r': {
      'en': 'EN',
      'de': 'EN',
    },
    'os1fl8o8': {
      'en': 'DE',
      'de': 'DE',
    },
    '5ha3oeng': {
      'en': 'Free',
      'de': 'Free',
    },
    'xvkbsivg': {
      'en': 'English',
      'de': 'English',
    },
    'rpn26dj9': {
      'en': 'Warm Up name EN',
      'de': 'Warm Up Name EN',
    },
    'ujuuc49j': {
      'en': 'Cool Down name EN',
      'de': 'Cool Down Name EN',
    },
    'iopg5y0r': {
      'en': '',
      'de': '',
    },
    'rooiquma': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'ekhzzmcu': {
      'en': '',
      'de': '',
    },
    '6b3x66z6': {
      'en': '0',
      'de': '0',
    },
    'yg4k3iuz': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    'iphpxtkk': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    '3txeb9yy': {
      'en': 'Upload video EN',
      'de': 'Video hochladen EN',
    },
    'zewgx4pi': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    'h3bfi1u0': {
      'en': 'German',
      'de': 'German',
    },
    'buxs1gtl': {
      'en': 'Warm Up name DE',
      'de': 'Warm Up Name DE',
    },
    'l1tnymiw': {
      'en': 'Cool Down name DE',
      'de': 'Cool Down Name DE',
    },
    'txfsz5ie': {
      'en': '',
      'de': '',
    },
    'yzha7pd1': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    'g2n637xm': {
      'en': '',
      'de': '',
    },
    'it2w9cud': {
      'en': '0',
      'de': '0',
    },
    'm6hmj6r0': {
      'en': 'Upload video DE',
      'de': 'Video hochladen DE',
    },
    '96iib9v7': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
    },
    'z8jiukxm': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAddAddit
  {
    'li9ykin1': {
      'en': 'New Warm Up',
      'de': 'Neues Warm Up',
    },
    'bnap8t8j': {
      'en': 'New Cool Down',
      'de': 'Neue Cool Down',
    },
    'w04vo6u2': {
      'en': 'Create',
      'de': 'Erstellen',
    },
    'djr3s131': {
      'en': 'Index',
      'de': 'Index',
    },
    '0thtr2yr': {
      'en': '',
      'de': '',
    },
    'orwvo7p5': {
      'en': '1',
      'de': '1',
    },
    'hv8l6mpj': {
      'en': 'EN',
      'de': 'EN',
    },
    'tlrj54oa': {
      'en': 'DE',
      'de': 'DE',
    },
    'lngt1mdz': {
      'en': 'Free',
      'de': 'Free',
    },
    '5ds441xf': {
      'en': 'English',
      'de': 'English',
    },
    '3ox0pfj1': {
      'en': 'Warm Up name EN',
      'de': 'Warm Up Name EN',
    },
    'ux9s1e27': {
      'en': 'Cool Down name EN',
      'de': 'Cool Down Name EN',
    },
    's9vjt5vy': {
      'en': '',
      'de': '',
    },
    'zxp2yfi8': {
      'en': 'Name',
      'de': 'Name',
    },
    'rpqg5xl8': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'jw4o1qmf': {
      'en': '',
      'de': '',
    },
    'lmw4ktlq': {
      'en': '0',
      'de': '0',
    },
    'ac5s54mj': {
      'en': '1 min',
      'de': '1 min',
    },
    'zafvdsdb': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    '6345i1ub': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'kekx3mro': {
      'en': 'Upload video EN',
      'de': 'Video hochladen DE',
    },
    'b46xusac': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    'ts9sj1ff': {
      'en': 'German',
      'de': 'German',
    },
    'cb5t91aq': {
      'en': 'Warm Up name DE',
      'de': 'Warm Up Name DE',
    },
    'y5eyacjj': {
      'en': 'Cool Down name DE',
      'de': 'Cool Down Name DE',
    },
    'pe9822o8': {
      'en': '',
      'de': '',
    },
    '9u69s762': {
      'en': 'Name',
      'de': 'Name',
    },
    'k2vvj2up': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    '4uf1prvi': {
      'en': '',
      'de': '',
    },
    '3gso6ivg': {
      'en': '0',
      'de': '0',
    },
    'yaaty63b': {
      'en': '1 min',
      'de': '1 min',
    },
    'vxeviion': {
      'en': 'Upload video DE',
      'de': 'Video hochladen DE',
    },
    '5qdwhnhr': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
    },
    'u9wb8snz': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditUser
  {
    'djmkap3s': {
      'en': 'Edit user',
      'de': 'Edit user',
    },
    'cw1eq8zs': {
      'en': 'Save changes',
      'de': 'Save changes',
    },
    '06fu407h': {
      'en': 'Use PNG or JPG up to 5 MB',
      'de': 'Verwende PNG oder JPG bis zu 5 MB',
    },
    '0nhdh5os': {
      'en': 'Email',
      'de': 'E-Mail',
    },
    'lxsulzdu': {
      'en': '',
      'de': '',
    },
    'ihzrzw6u': {
      'en': 'Fill in the field',
      'de': 'Füllen Sie das Feld aus',
    },
    'ihrmznn5': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
    },
    'nxgh7h6z': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
    },
    'sc5nthlx': {
      'en': '',
      'de': '',
    },
    'syd19zuu': {
      'en': 'Plusmember',
      'de': 'PlusMember',
    },
    'wbxrsh6z': {
      'en': 'Restore purchase',
      'de': 'Kauf wiederherstellen',
    },
    'j6da4yxq': {
      'en': 'Name',
      'de': 'Name',
    },
    'bmd9qp9g': {
      'en': '',
      'de': '',
    },
    '26r6h9y9': {
      'en': 'Fill in the field',
      'de': 'Füllen Sie das Feld aus',
    },
    '4pnvphai': {
      'en': 'Min 2 symbols',
      'de': 'Mindestens 2 Symbole',
    },
    'mrakndqv': {
      'en': 'Max 50 symbols',
      'de': 'Max. 50 Symbole',
    },
    'ctrhe5r4': {
      'en': '',
      'de': '',
    },
    'glxe2hyt': {
      'en': 'Surname',
      'de': 'Nachname',
    },
    '5w91srr5': {
      'en': '',
      'de': '',
    },
    'zb3jw32y': {
      'en': 'Goal',
      'de': 'Ziel',
    },
    '3f2jqkll': {
      'en': 'Date of birth',
      'de': 'Geburtsdatum',
    },
    '5hekzlcm': {
      'en': 'Weight (kg)',
      'de': 'Gewicht (kg)',
    },
    'j9xnxx2w': {
      'en': '',
      'de': '',
    },
    '4febrar1': {
      'en': 'Height (cm)',
      'de': 'Größe (cm)',
    },
    'y99d0n0l': {
      'en': '',
      'de': '',
    },
    'q7f4xm8e': {
      'en': 'App language',
      'de': 'App language',
    },
    'zsyq9u05': {
      'en': 'EN',
      'de': 'EN',
    },
    'b2onetjc': {
      'en': 'DE',
      'de': 'DE',
    },
    'ybyv6f40': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminZoom
  {
    'wgzytisv': {
      'en': 'Zoom Jam',
      'de': 'Zoom Jam',
    },
    'y3v0hxrm': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'yl3w1g6a': {
      'en': 'Zoom Jam name EN',
      'de': 'Zoom Jam Name EN',
    },
    '8rvg5ybd': {
      'en': '',
      'de': '',
    },
    '4r3l46uk': {
      'en': 'Name',
      'de': 'Name',
    },
    '3swidtvu': {
      'en': 'Zoom Jam name DE',
      'de': 'Zoom Jam-Name DE',
    },
    'lh4w0cfu': {
      'en': '',
      'de': '',
    },
    '79jx7e6f': {
      'en': 'Name',
      'de': 'Name',
    },
    'a5w1d81h': {
      'en': 'Description EN',
      'de': 'Beschreibung EN',
    },
    'ob5m78us': {
      'en': '',
      'de': '',
    },
    '8ls09u15': {
      'en': 'Description',
      'de': 'Beschreibung',
    },
    'd6atjeeo': {
      'en': 'Description DE',
      'de': 'Beschreibung DE',
    },
    'n75j5osl': {
      'en': '',
      'de': '',
    },
    '9wra1ysb': {
      'en': 'Description',
      'de': 'Beschreibung',
    },
    'uc9eltgi': {
      'en': 'Date',
      'de': 'Datum',
    },
    'x1isenlq': {
      'en': 'Time',
      'de': 'Zeit',
    },
    '8odpdrnd': {
      'en': 'Link to session',
      'de': 'Link zur Sitzung',
    },
    'lyewylh9': {
      'en': '',
      'de': '',
    },
    'l2szihcm': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
    },
    'oo8oxq93': {
      'en': 'Free',
      'de': 'Free',
    },
    'b2aqq3ce': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    'cs4zb2gs': {
      'en': 'Delete',
      'de': 'Löschen',
    },
    '7bxi498l': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminSeasons
  {
    'oig7j28e': {
      'en': 'Seasons & workouts',
      'de': 'Seasons & workouts',
    },
    'qux2atbf': {
      'en': 'New season',
      'de': 'Neue season',
    },
    '3hh3whgq': {
      'en': 'EN | DE',
      'de': 'EN | DE',
    },
    'a9lixe3f': {
      'en': 'EN',
      'de': 'EN',
    },
    'qgcmpmal': {
      'en': 'DE',
      'de': 'DE',
    },
    'uq0p7izl': {
      'en': 'workouts',
      'de': 'workouts',
    },
    'y0oz02a2': {
      'en': ' ~ ',
      'de': ' ~ ',
    },
    'gm62aabq': {
      'en': 'people passed',
      'de': 'people passed',
    },
    'svfbnltw': {
      'en': ' ',
      'de': ' ',
    },
    'tj8mt6ob': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminWorkouts
  {
    'yq3mgv9i': {
      'en': 'New workout',
      'de': 'New workout',
    },
    'f693yg8l': {
      'en': 'Workouts',
      'de': 'Workouts',
    },
    '2d5gapne': {
      'en': ' ~ ',
      'de': ' ~ ',
    },
    'o89bixfq': {
      'en': 'people passed',
      'de': 'people passed',
    },
    'ox50xj9k': {
      'en': 'people passed',
      'de': 'people passed',
    },
    'blbflywh': {
      'en': 'Free',
      'de': 'Free',
    },
    'lic07eyj': {
      'en': 'Paid',
      'de': 'Bezahlt',
    },
    'wnw7iud9': {
      'en': ' ',
      'de': '',
    },
    'zw5ilffg': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditSeason
  {
    'o3h7483w': {
      'en': 'Edit season',
      'de': 'Season bearbeiten',
    },
    'r23rfb42': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'phohmz0u': {
      'en': 'Season number',
      'de': 'Season nummer',
    },
    'fv8vpunc': {
      'en': '',
      'de': '',
    },
    'u2v0svud': {
      'en': 'EN',
      'de': 'EN',
    },
    'jq96hkb7': {
      'en': 'DE',
      'de': 'DE',
    },
    'hdzyi77v': {
      'en': 'Released at',
      'de': 'Veröffentlicht am',
    },
    'vb520c0e': {
      'en': 'English',
      'de': 'English',
    },
    'b97itzb4': {
      'en': 'Season name DE',
      'de': 'Season Name DE',
    },
    '8u8rnyyf': {
      'en': '',
      'de': '',
    },
    '8o6brksg': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'ndei1q31': {
      'en': '',
      'de': '',
    },
    'fk4odnpj': {
      'en': '0',
      'de': '0',
    },
    '87nfb7h8': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    'cug7xyn1': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'tc1iuqq8': {
      'en': 'German',
      'de': 'German',
    },
    'm0z1vm62': {
      'en': 'Season name EN',
      'de': 'Season Name EN',
    },
    '89wtibli': {
      'en': '',
      'de': '',
    },
    'uczseu0v': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    '0owrmr0a': {
      'en': '',
      'de': '',
    },
    'i43ohrcu': {
      'en': '0',
      'de': '0',
    },
    'pqj967bp': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAddSeason
  {
    'lwhe8eil': {
      'en': 'New season',
      'de': 'Neue season',
    },
    'axef6432': {
      'en': 'Create',
      'de': 'Erstellen',
    },
    'lbcfzno6': {
      'en': 'Season number',
      'de': 'Season nummer',
    },
    'izabwybn': {
      'en': '',
      'de': '',
    },
    'mvin63z3': {
      'en': '1',
      'de': '1',
    },
    'dhew6hn9': {
      'en': '1',
      'de': '1',
    },
    'k3621yid': {
      'en': 'EN',
      'de': 'EN',
    },
    'hmw34450': {
      'en': 'DE',
      'de': 'DE',
    },
    'oh7nq00v': {
      'en': 'Released at',
      'de': 'Veröffentlicht am',
    },
    'hdp91dxr': {
      'en': 'English',
      'de': 'English',
    },
    'w0kn9dxz': {
      'en': 'Season name DE',
      'de': 'Season Name DE',
    },
    'kt4ivcf7': {
      'en': '',
      'de': '',
    },
    '2wam3zle': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'bf8wp1ak': {
      'en': '',
      'de': '',
    },
    'q0ryofdv': {
      'en': '0',
      'de': '0',
    },
    '5mgmgq5j': {
      'en': '1 week',
      'de': '1 Woche',
    },
    'nzz20wyk': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    'hou6oc7l': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'n25i3mug': {
      'en': 'German',
      'de': 'German',
    },
    'o6h5ahhk': {
      'en': 'Season name EN',
      'de': 'Season Name EN',
    },
    'ix0pynut': {
      'en': '',
      'de': '',
    },
    'stbkn4a9': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    'zqn9ghwl': {
      'en': '',
      'de': '',
    },
    'tzs9gboe': {
      'en': '0',
      'de': '0',
    },
    '0yybkt0n': {
      'en': '1 week',
      'de': '1 Woche',
    },
    'fhw14264': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditWorkout
  {
    'o0ah9de5': {
      'en': 'Edit workout',
      'de': 'Workout bearbeiten',
    },
    '5vnaauls': {
      'en': 'Save changes',
      'de': 'Änderungen speichern',
    },
    'not633da': {
      'en': 'Season name',
      'de': 'Season Name',
    },
    'qm9i9lzs': {
      'en': '',
      'de': '',
    },
    'ekv5390o': {
      'en': 'Index',
      'de': 'Index',
    },
    'rdja5srr': {
      'en': '',
      'de': '',
    },
    '11pfe10u': {
      'en': '1',
      'de': '1',
    },
    'kuaoaku7': {
      'en': 'Points',
      'de': 'Punkte',
    },
    'nm9rq9ju': {
      'en': '',
      'de': '',
    },
    'zcxo8lr6': {
      'en': '0',
      'de': '0',
    },
    'a3q6jqxa': {
      'en': 'Free',
      'de': 'Free',
    },
    'yyvhcbie': {
      'en': 'English',
      'de': 'English',
    },
    'aa5q15ix': {
      'en': 'Workout name EN',
      'de': 'Workout Name EN',
    },
    '8cbqlxta': {
      'en': '',
      'de': '',
    },
    'c6jt6mbj': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'scixkvvi': {
      'en': '',
      'de': '',
    },
    'u6gx11y4': {
      'en': '0',
      'de': '0',
    },
    '2tjvv4xt': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    '0jbca4rk': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    '11s60ttn': {
      'en': 'Upload video EN',
      'de': 'Video hochladen DE',
    },
    't2rt72vg': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    '3xonbgyj': {
      'en': 'German',
      'de': 'German',
    },
    'tbuz2eja': {
      'en': 'Workout name DE',
      'de': 'Workout Name DE',
    },
    'oyt2xafo': {
      'en': '',
      'de': '',
    },
    'rrckpujg': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    'j6mkuqyr': {
      'en': '',
      'de': '',
    },
    '0khc2sss': {
      'en': '0',
      'de': '0',
    },
    'aswd0l0w': {
      'en': 'Upload video DE',
      'de': 'Video hochladen DE',
    },
    'pcrnqbsm': {
      'en': 'Delete',
      'de': 'Löschen',
    },
    '93a3eob5': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAddWorkout
  {
    'ywtiqc9h': {
      'en': 'New workout',
      'de': 'Neues workout',
    },
    'o426dww0': {
      'en': 'Create',
      'de': 'Erstellen',
    },
    'nbjxn7tv': {
      'en': 'Season name',
      'de': 'Season Name',
    },
    'srk0r6gj': {
      'en': '',
      'de': '',
    },
    'of1gw5qd': {
      'en': 'Index',
      'de': 'Index',
    },
    'xliegfd8': {
      'en': '',
      'de': '',
    },
    'e938m8da': {
      'en': '1',
      'de': '1',
    },
    'mhhur7vz': {
      'en': 'Points',
      'de': 'Punkte',
    },
    'jzzv72lh': {
      'en': '',
      'de': '',
    },
    '3ykb6x2d': {
      'en': '0',
      'de': '0',
    },
    'w325g05e': {
      'en': '0',
      'de': '0',
    },
    'egk94yj6': {
      'en': 'Free',
      'de': 'Free',
    },
    'wf8lkekp': {
      'en': 'English',
      'de': 'English',
    },
    'q139n58w': {
      'en': 'Workout name EN',
      'de': 'Workout Name EN',
    },
    '2e6151mc': {
      'en': '',
      'de': '',
    },
    'jqrenqge': {
      'en': 'Duration EN',
      'de': 'Dauer EN',
    },
    'cbpz9n4x': {
      'en': '',
      'de': '',
    },
    'eydck96e': {
      'en': '0',
      'de': '0',
    },
    'm7gznb8r': {
      'en': '1 week',
      'de': '1 Woche',
    },
    'ibr6zyfs': {
      'en': 'Upload cover',
      'de': 'Cover hochladen',
    },
    'rkvc9s49': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'cxf2viyu': {
      'en': 'Upload video EN',
      'de': 'Video hochladen DE',
    },
    '89nuuxts': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    '3rmfdnl2': {
      'en': 'German',
      'de': 'German',
    },
    'doiy32c3': {
      'en': 'Workout name DE',
      'de': 'Workout Name DE',
    },
    'o77330op': {
      'en': '',
      'de': '',
    },
    '0fex45fb': {
      'en': 'Duration DE',
      'de': 'Dauer DE',
    },
    'f9gd87wk': {
      'en': '',
      'de': '',
    },
    'itqj6ne0': {
      'en': '0',
      'de': '0',
    },
    'pdn17sk1': {
      'en': '1 week',
      'de': '1 Woche',
    },
    '8q3ky5s4': {
      'en': 'Upload video DE',
      'de': 'Video hochladen DE',
    },
    'eb76qwg4': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
    },
    'z8yo1ssl': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // SubscriptionPage
  {
    'px4yi7gk': {
      'en': 'Choose your plan',
      'de': 'Wähle dein Paket',
    },
    'e7bvr8te': {
      'en': 'Manage subscription',
      'de': 'Abonnement verwalten',
    },
    'tqv5js2f': {
      'en': 'GET 2.5 MONTHS FREE!',
      'de': 'SICHERE DIR 2,5 MONATE KOSTENLOS!',
    },
    '7tbrnflb': {
      'en': '76% of users commit to long-term result — join them today!',
      'de': '76 % der Nutzer bleiben langfristig dabei —\nsei einer von ihnen!',
    },
    '3j0q74op': {
      'en': 'Only \$2.40 / week — less than a coffee!',
      'de': 'Nur €2,40 / Woche — weniger als ein Kaffee!',
    },
    'hm7frjjm': {
      'en': 'Long-term motivation & continuous progress',
      'de': 'Langfristige Motivation & kontinuierliche Fortschritte',
    },
    'm345soo5': {
      'en': 'Maximum flexibility — cancel anytime',
      'de': 'Maximale Flexibilität — jederzeit kündbar',
    },
    'zn68g42o': {
      'en': 'Learn more about benefits',
      'de': 'Erfahren Sie mehr über die Vorteile',
    },
    'hivpj2fq': {
      'en':
          ' (billed annually, \$125 charged upfront). Cancel anytime! By taping «Start your 7-day free trial» you agree to the ',
      'de':
          '. Das Abonnement verlängert sich automatisch. Jederzeit im App Store kündbar. Durch Tippen auf «Jetzt 7 Tage gratis testen» erklärst du dich mit den ',
    },
    'e3lyamf9': {
      'en': 'privacy policy',
      'de': 'Datenschutzrichtlinien',
    },
    'tn4ewelj': {
      'en': ' and ',
      'de': ' und ',
    },
    'lp2f9po6': {
      'en': 'terms of use',
      'de': 'Nutzungsbedingungen',
    },
    'gc2akpkc': {
      'en': 'Restore purchase',
      'de': 'Kauf wiederherstellen',
    },
    'aemzehtp': {
      'en': 'Cancel current subscription',
      'de': 'Aktuelles Abonnement kündigen',
    },
    'ln2dlir2': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // videoPage
  {
    'kyhh86y5': {
      'en': 'EN',
      'de': 'EN',
    },
    'vx0s9zbp': {
      'en': 'DE',
      'de': 'DE',
    },
    'd64jz0xv': {
      'en': 'Home',
      'de': '',
    },
  },
  // AdminBanners
  {
    '65e2esxz': {
      'en': 'Home page banner',
      'de': 'Homepage-Banner',
    },
    'uel6b6ol': {
      'en': 'Edit',
      'de': 'Edit',
    },
    'fo6o0a4h': {
      'en': '+ Create new banner',
      'de': '+ Create new banner',
    },
    'de5q31ap': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminAddBanner
  {
    'kd55g6ls': {
      'en': 'New banner',
      'de': 'Neues banner',
    },
    'ak9xollk': {
      'en': 'Create',
      'de': 'Erstellen',
    },
    '2lfz2kwx': {
      'en': 'Index',
      'de': 'Index',
    },
    'kn922s2n': {
      'en': '',
      'de': '',
    },
    '90646c50': {
      'en': '1',
      'de': '1',
    },
    'm2dl3nl7': {
      'en': 'English',
      'de': 'English',
    },
    '0c8phvum': {
      'en': 'Link URL EN',
      'de': 'Link URL EN',
    },
    'wm6jgm93': {
      'en': '',
      'de': '',
    },
    'psflaza3': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
    },
    's7ug010d': {
      'en': 'Upload cover EN',
      'de': 'Upload cover EN',
    },
    'bkvglwta': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'm9mhf18c': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
    },
    'unj4zjc6': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    'n45gl6kd': {
      'en': 'German',
      'de': 'German',
    },
    'anlecwot': {
      'en': 'Link URL DE',
      'de': 'Link URL DE',
    },
    'f5gexflx': {
      'en': '',
      'de': '',
    },
    'yl6fphvo': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
    },
    'pqj9tpuh': {
      'en': 'Upload cover DE',
      'de': 'Upload cover DE',
    },
    '3qcrq5a0': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'j801cl1v': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
    },
    'wkcdvh91': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
    },
    'hltdbq2w': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // AdminEditBanner
  {
    'tbc56l0c': {
      'en': 'Edit banner',
      'de': 'Edit banner',
    },
    'v873e4x6': {
      'en': 'Save changes',
      'de': 'Save changes',
    },
    'b4ax7yqy': {
      'en': 'Index',
      'de': 'Index',
    },
    'jcqu4e0t': {
      'en': '',
      'de': '',
    },
    'dw28cpj1': {
      'en': '1',
      'de': '1',
    },
    '17cokrlt': {
      'en': 'English',
      'de': 'English',
    },
    '0a42mak6': {
      'en': 'Link URL EN',
      'de': 'Link URL EN',
    },
    'ms5b2eor': {
      'en': '',
      'de': '',
    },
    'v7od6pxa': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
    },
    'ti8l8o0q': {
      'en': 'Upload cover EN',
      'de': 'Upload cover EN',
    },
    'wkh3l298': {
      'en': 'Delete cover',
      'de': 'Delete cover',
    },
    'qn55hb3u': {
      'en': 'Upload video EN',
      'de': 'Upload video EN',
    },
    '1x017nqc': {
      'en': 'Delete video EN',
      'de': 'Delete video EN',
    },
    '7y58albq': {
      'en': 'German',
      'de': 'German',
    },
    'qma3h2kz': {
      'en': 'Link URL DE',
      'de': 'Link URL DE',
    },
    'kgflhwlv': {
      'en': '',
      'de': '',
    },
    '2uxu2y73': {
      'en': 'https://sessionlink.com/1212412',
      'de': 'https://sessionlink.com/1212412',
    },
    'uwjv83m3': {
      'en': 'Upload cover DE',
      'de': 'Upload cover DE',
    },
    'i5u63oi1': {
      'en': 'Delete cover DE',
      'de': 'Delete cover DE',
    },
    'rv0qyxy5': {
      'en': 'Upload video DE',
      'de': 'Upload video DE',
    },
    'c0rxnz70': {
      'en': 'Delete video DE',
      'de': 'Delete video DE',
    },
    'vu18d2pf': {
      'en': 'Home',
      'de': 'Home',
    },
  },
  // languageSelectDialog
  {
    't7llkirb': {
      'en': 'Select language',
      'de': 'Wähle die App Sprache aus',
    },
    'wacxmizm': {
      'en': 'English',
      'de': 'Englisch',
    },
    'yv7searm': {
      'en': 'Deutsch',
      'de': 'Deutsch',
    },
  },
  // signupSuccess
  {
    '135inf76': {
      'en': 'The account has been created',
      'de': 'Dein Konto wurde erstellt',
    },
    '7zjkfwfk': {
      'en': 'Have fun and enjoy the progress!',
      'de': 'Viel Spaß und zeige der Welt was du drauf hast',
    },
    'zsvpt7s3': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
    },
  },
  // emailChangeSuccess
  {
    '2jcj2ldj': {
      'en': 'The email has been changed',
      'de': 'Die E-Mail wurde geändert',
    },
    '1ok7vxs9': {
      'en': 'Now use it to log in',
      'de': 'Melden Sie sich damit jetzt an',
    },
    'syczmf7i': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // noInternet
  {
    '0qgwpmda': {
      'en': 'No internet',
      'de': 'Kein Internet',
    },
    'rfy39tpk': {
      'en': 'Please check your connection and try reconnecting',
      'de': 'Bitte überprüfe deine Internetverbindung und versuche es erneut',
    },
    'z97ynk5a': {
      'en': 'Reconnect',
      'de': 'Wieder verbinden',
    },
  },
  // LogOutDialog
  {
    'hfotr0i4': {
      'en': 'Are you sure you want to log out?',
      'de': 'Möchtest du dich wirklich abmelden?',
    },
    'fzw42eag': {
      'en': 'No, stay ',
      'de': 'Nein',
    },
    '7ty8j2tx': {
      'en': 'Yes, log out',
      'de': 'Ja, jetzt abmelden',
    },
  },
  // navbar
  {
    '6cm7wb2r': {
      'en': 'Workout collections',
      'de': 'Workout Sammlung',
    },
    'wo69idjh': {
      'en': 'Additionals',
      'de': 'Extras',
    },
    'c6q3xdkd': {
      'en': 'Profile',
      'de': 'Profil',
    },
  },
  // DeleteAccDialog
  {
    'ylms164a': {
      'en': 'Are you sure you want to delete your account?',
      'de': 'Bist du sicher, dass du dein Konto löschen möchtest?',
    },
    'r43zhius': {
      'en':
          'You’ll lose access to all training results and purchased content. You cannot cancel this action',
      'de':
          'Du verlierst den Zugriff auf alle Trainingsergebnisse und gekauften Inhalte. Diese Aktion kann nicht rückgängig gemacht werden.',
    },
    'j02dfqzf': {
      'en': 'No, stay ',
      'de': 'Nein, ich ziehe weiterhin durch!',
    },
    'h4ovms9z': {
      'en': 'Yes, delete account',
      'de': 'Ja, ich gebe auf',
    },
    'kkedx2u5': {
      'en': 'Account deleted',
      'de': 'Konto gelöscht',
    },
  },
  // SelectGoalDialog
  {
    'jz6n8pkd': {
      'en': 'Select goal',
      'de': 'Ziel auswählen',
    },
    'ahjzuukq': {
      'en': 'Confirm',
      'de': 'Bestätigen',
    },
  },
  // cancelSubs
  {
    'bh9vm2c1': {
      'en': 'The subscription has been canceled',
      'de': 'Das Abonnement wurde gekündigt',
    },
    '7oftg9h2': {
      'en': 'The current subscription will be valid until March 24',
      'de': 'Das aktuelle Abonnement ist bis zum 24. März gültig',
    },
    'onuo4q4p': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // changeSubs
  {
    'zyccxm66': {
      'en': 'The subscription has been changed',
      'de': 'Das Abonnement wurde geändert',
    },
    'na5tez6e': {
      'en': 'The current subscription will be valid until March 24',
      'de': 'Das aktuelle Abonnement ist bis zum 24. März gültig',
    },
    '8i3m9mrl': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // PromoDialog
  {
    'cbhc9jgz': {
      'en': 'Enter a promo code if you have one to get a discount',
      'de':
          'Geben Sie einen Aktionscode ein, falls Sie einen haben, um einen Rabatt zu erhalten',
    },
    'r99f03fi': {
      'en': 'Promocode',
      'de': 'Aktionscode',
    },
    'hv9a8esq': {
      'en': '',
      'de': '',
    },
    'p1itsm2k': {
      'en': 'The promocode doesn’t exist or it has expired',
      'de': 'Der Promocode existiert nicht oder ist abgelaufen',
    },
    'u818sw9e': {
      'en': 'Confirm',
      'de': 'Bestätigen',
    },
    'bfyly20q': {
      'en': 'I don\'t have a promo code',
      'de': 'Ich habe keinen Aktionscode',
    },
  },
  // successSubs
  {
    'xejf2ywy': {
      'en': 'Now it\'s time to begin your journey',
      'de': 'Viel Spaß bei deiner Transformation!',
    },
    '2cz1nu46': {
      'en': 'Welcome to the most fun and energy-driven workout in the world!',
      'de':
          'Willkommen zum abwechslungsreichsten und energiegeladensten Training der Welt.',
    },
    'tz6e6wqm': {
      'en': 'Let’s go!',
      'de': 'Let’s go!',
    },
  },
  // BecomeaHIITtheBeatTrainer
  {
    'kbwea8f2': {
      'en': 'Become a HIIT the Beat Trainer',
      'de': 'Werde HIIT the Beat Trainer',
    },
    'zh5yw60e': {
      'en': 'Expert & Godmode levels not included',
      'de':
          'Expert und Godmode Level sind nicht Bestandteil der Grundausbildung',
    },
  },
  // HIITtheBeatShop
  {
    'zel40k37': {
      'en': 'HIIT the Beat Shop',
      'de': 'HIIT the Beat Shop',
    },
    'idxlma6w': {
      'en': 'Style yourself for the most energized workout in the world',
      'de': 'Shoppe jetzt freshe Styles in unserem Shop',
    },
  },
  // Watchtheintroductoryvideo
  {
    '6exvv6ta': {
      'en': 'Watch the introductory video',
      'de': 'Schau dir das Einführungsvideo an',
    },
    'yhmws86v': {
      'en': 'We’ll tell you more about the app',
      'de': 'Wir verraten dir mehr über die App',
    },
  },
  // seasonComp
  {
    'ku2u1aem': {
      'en': 'Workouts',
      'de': 'Workouts',
    },
    'bcbfylss': {
      'en': ' ~ ',
      'de': ' ~ ',
    },
  },
  // GodModeDialog
  {
    'tiuu8jmr': {
      'en': 'Godmode already on the way',
      'de': 'Godmode ist bereits auf dem Weg',
    },
    'aahl1y8v': {
      'en': 'Get ready to become a warrior!',
      'de': 'Mach dich bereit ein Krieger zu werden!',
    },
    'uovtnjxr': {
      'en': 'Go back',
      'de': 'Geh zurück',
    },
  },
  // filterSeasonDialog
  {
    'pc4fuj50': {
      'en': 'Which seasons to show?',
      'de': 'Welche Seasons sollen angezeigt werden?',
    },
    'mt480vnq': {
      'en':
          'Some seasons are only available in one language. Therefore, follow the order of the seasons from top to bottom anyway, even if the order is broken',
      'de':
          'Einige Seasons sind nur in einer Sprache verfügbar. Befolge daher auf jeden Fall die Reihenfolge der Seasons von oben nach unten, auch wenn eine fehlt',
    },
    'inhsm2oq': {
      'en': 'Hide completed seasons and workouts',
      'de': 'Verstecke abgeschlossene Seasons und Workouts',
    },
    'z2v0b8ui': {
      'en': 'All',
      'de': 'Alle',
    },
    'qxe5c348': {
      'en': 'Only EN',
      'de': 'Nur EN',
    },
    '84rjp4gu': {
      'en': 'Only DE',
      'de': 'Nur DE',
    },
    'nzropwt1': {
      'en': 'Let’s Go',
      'de': 'Let\'s go',
    },
  },
  // becomeplusmember
  {
    'zvxsuk2p': {
      'en': 'Become a Plusmember  to get access to 80+ workouts',
      'de': 'Werden Sie Plusmitglied für über 80+ Workouts!',
    },
    '9k47luzn': {
      'en': 'Details & payment',
      'de': 'Details & Zahlung',
    },
  },
  // workoutComp
  {
    '66rk1jnv': {
      'en': 'Completed',
      'de': 'Completed',
    },
    '337qu9pr': {
      'en': 'times',
      'de': 'times',
    },
    'tro9fl3b': {
      'en': 'Not completed',
      'de': 'Not completed',
    },
    'exk17ls5': {
      'en': 'Free',
      'de': 'Free',
    },
  },
  // seasonMainComp
  {
    'txuwyqt0': {
      'en': 'EN | DE',
      'de': 'EN | DE',
    },
    '67y953ao': {
      'en': 'EN',
      'de': 'EN',
    },
    'gqe4yw0y': {
      'en': 'DE',
      'de': 'DE',
    },
    '67l2ulqn': {
      'en': 'Workouts',
      'de': 'Workouts',
    },
    'i0v52xtn': {
      'en': ' ~ ',
      'de': ' ~ ',
    },
    'ey2y48uy': {
      'en': 'Released on',
      'de': 'Veröffentlicht am',
    },
    'f6jing3j': {
      'en': 'Last activity',
      'de': 'Letzte Aktivität',
    },
    'ulmgxwkw': {
      'en': 'Progress',
      'de': 'Fortschritt',
    },
    'brstmsv1': {
      'en': '',
      'de': '',
    },
  },
  // apbar
  {
    '0axxkhiu': {
      'en': 'Unleash your potential',
      'de': 'Entfesseln Sie Ihr Potenzial',
    },
    '6s0bj9x8': {
      'en':
          'Become a Plusmember and say hello to a completely new body sensation!',
      'de':
          'Werden Sie Plusmember und begrüßen Sie ein völlig neues Körpergefühl!',
    },
  },
  // SelectWarmUpCoolDownDialog
  {
    'mm1w2qr0': {
      'en': 'Select Warm Up',
      'de': 'Wähle dein Warm Up',
    },
    '5dn60aaw': {
      'en': 'Select Cool Down',
      'de': 'Wähle dein Cool Down',
    },
    '2avtfd0j': {
      'en': 'Close',
      'de': 'Schließen',
    },
  },
  // PaymentDialog
  {
    '0gprl0cm': {
      'en': 'BECOME A PLUSMEMBER',
      'de': 'WERDE EIN PLUSMEMBER',
    },
    'cbv411z4': {
      'en': 'AND START TO TRANSFORM YOUR LIFE TODAY!',
      'de': 'UND BEGINNE NOCH HEUTE DEINE TRANSFORMATION!',
    },
    'may7byav': {
      'en': 'More energy, more motivation, more variety',
      'de': 'Mehr Energie, mehr Motivation, mehr Abwechslung',
    },
    '3vrpuapa': {
      'en': '100+ exercises & 80+ workouts for every fitness level',
      'de': '100+ Übungen & 80+ Workouts für jedes Level',
    },
    'wk6zijvt': {
      'en': 'New content regularly — no workout is ever the same',
      'de': 'Regelmäßige neue Inhalte — kein Training ist wie das andere',
    },
    'ygk6ddgn': {
      'en': 'Live Zoom training — work out with real coaches & the community!',
      'de':
          'Live-Trainings via Zoom — trainiere mit einem echten Coach & der Community!',
    },
    'cmlkzdeu': {
      'en':
          'Try HIIT the Beat for free for 7 days & experience the power of music-driven workouts!',
      'de':
          'Teste jetzt 7 Tage kostenlos & entdecke die Power von HIIT the Beat!',
    },
    '88csohcq': {
      'en': 'SELECT SUBSCRIPTION',
      'de': 'WÄHLE EIN ABONNEMENT',
    },
  },
  // GuestDialog
  {
    'q8lje3xj': {
      'en':
          'Join the community and unleash new energy within you, helping you become fitter than ever before!',
      'de':
          'Erlebe auch du, wie sehr Fitness auch Spaß machen kann und werde fitter als je zuvor. Und zwar mit dem abwechslungsreichsten und energiegeladenstes HIIT Bodyweight Workout der Welt.',
    },
    'oha358fe': {
      'en': 'Let´s Go ',
      'de': 'Let’s go!',
    },
    'nv4fzm78': {
      'en': 'Continue exploring the app',
      'de': 'App weiter erkunden',
    },
  },
  // SeasonDoneDialog
  {
    'f8v79pyt': {
      'en': 'SEASON',
      'de': 'SEASON',
    },
    'xpzitrhb': {
      'en': 'IS DONE!',
      'de': 'HAST DU DURCHGEROCKT!',
    },
    'u68427cb': {
      'en': 'You’re getting stronger. Let´s move to the next one',
      'de': 'Auf geht\'s zu nächsten Challenge!',
    },
    '93tk94wz': {
      'en': 'Go to next season',
      'de': 'Hier gehts zur nächsten Season',
    },
  },
  // BeginnerSeasonsDoneDialog
  {
    'tkqedvab': {
      'en': 'BEGINNER SEASONS ARE DONE!',
      'de': 'DU HAST ALLE ANFÄNGER SEASONS ABSOLVIERT',
    },
    'g17dzj1s': {
      'en':
          'Wow, you\'re really serious. Are you ready for the next level? Give it a try and go to the advanced level or just repeat your favorite workouts until we will release the next beginner season',
      'de':
          'Wow, das ist schonmal krass. Du meinst es wirklich ernst. Davon gibt es nicht viele. Bleib dran. Du kannst jetzt gerne die advanced workouts ausprobieren. Wenn du bei den Basic workouts bleiben möchtest. Kein Problem\n\nZieh einfach weiter deine Liebelingsworkouts durch, bis wir eine neue beginner Seasons veröffentlichen',
    },
    'knffcl10': {
      'en': 'Go to next season',
      'de': 'Auf zum nächsten Level',
    },
    '52ybjjba': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den beginner Workouts',
    },
  },
  // AdvancedSeasonsDoneDialog
  {
    'cqbtg9h3': {
      'en': 'ADVANCED SEASONS ARE DONE!',
      'de': 'DU BIST MIT ALLEN ADVANCED SEASONS DURCH!',
    },
    'xcnasq54': {
      'en':
          'You’re on your way to become a machine. Not bad. Now it is about to keep going. Repeat your favorite workouts or go to the expert level and give it a try. Everything is possible!',
      'de':
          'Du bist auf dem weg eine Maschine zu werden. Nicht schlecht. Ziehe deine Lieblingsworkouts noch öfter durch oder wage dich an die expert Seasons. Probiere sie gerne aus. Zurück kannst du immer noch. Stelle dich der Herausforderung',
    },
    '7p9tghh3': {
      'en': 'Go to next season',
      'de': 'Auf zum nächsten Level',
    },
    'oudqdqnd': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den beginner Workouts',
    },
  },
  // ExpertSeasonsDoneDialog
  {
    '78uywcju': {
      'en': 'EXPERT SEASONS ARE DONE!',
      'de': 'DU BIST MIT ALLEN EXPERT SEASONS DURCH!',
    },
    'ra1m2l77': {
      'en':
          'You‘re a monster. Just 3% of people on this planet are able to pass this level. You can be proud of yourself. Show us this skills on social media. People need to see your power. Do you love to inspire other people with your power? Apply to become a HIIT the Beat Trainer: ',
      'de':
          'Du bist ein Monster. Nur 3% der Menschen auf diesem Planeten schaffen es diese Workouts durchzuziehen. Vergesse nicht deinen Progress auf Social media zu teilen.  Das muss die Welt sehen. Du solltest HIIT the Beat Trainer werden. Schreibe uns eine e-Mail an ',
    },
    '0jfwfq4j': {
      'en': 'https://trainer.hiit-the-beat.com/en-trainer',
      'de': 'info@hiit-the-beat.com',
    },
    'hatl84jz': {
      'en': ' ',
      'de': ', wenn du Interesse hast ie welt als Trainer zu inspirieren',
    },
    '98y4o1pj': {
      'en': ' Send us a mail to',
      'de': 'Du willst noch mehr Workouts ? Schicke eine Mail an ',
    },
    'xjmrga16': {
      'en': ' info@breakletics.com\n',
      'de': ' info@breakletics.com',
    },
    'yrdxwaxv': {
      'en': 'So we will hurry up to release the godmode level',
      'de':
          ' und wir werden noch mehr reinhauen neue Workouts für dich zu erstellen',
    },
    'oyrgquuj': {
      'en': 'Write mail',
      'de': 'E-Mail schreiben',
    },
    '9jqu75he': {
      'en': 'Wait for new seasons',
      'de': 'Zurück zu den expert Workouts',
    },
  },
  // WorkoutSuccessDialog
  {
    'q6q0100i': {
      'en': 'points',
      'de': 'punkte',
    },
    '9es261xp': {
      'en': 'YOU ARE INSANE!',
      'de': 'YOU ARE INSANE!',
    },
    '4rgsh6mz': {
      'en': 'Keep up the great work',
      'de': 'Keep up the great work',
    },
    '27k05ixx': {
      'en': 'Warm Up',
      'de': 'Warm Up',
    },
    '5nmj1xo1': {
      'en': 'Workout',
      'de': 'Workout',
    },
    'wn9gl3cq': {
      'en': 'Cool Down',
      'de': 'Cool Down',
    },
    'bj8er4cy': {
      'en': 'Let’s Go!',
      'de': 'Let’s go!',
    },
  },
  // WorkoutSuccess3timesDialog
  {
    '0iji3oos': {
      'en': 'points',
      'de': 'punkte',
    },
    '1t6vwh32': {
      'en': 'NICELY DONE!',
      'de': 'NICELY DONE!',
    },
    'uuh2zkwa': {
      'en':
          'You\'ve done this workout 3 times. You’re a machine! Now you can move to the next challenge',
      'de':
          'You\'ve done this workout 3 times. You’re a machine! Now you can move to the next challenge',
    },
    'knyyti6y': {
      'en': 'Warm Up',
      'de': 'Warm Up',
    },
    'fl1vsckd': {
      'en': 'Workout',
      'de': 'Workout',
    },
    'g25b1yqv': {
      'en': 'Cool Down',
      'de': 'Cool Down',
    },
    'nig2c2xf': {
      'en': 'Let’s Go!',
      'de': 'Let’s go!',
    },
    'tnhvf7wk': {
      'en': 'I didn\'t have enough. Let\'s go to next workout!',
      'de': 'Da geht mehr, noch ein Workout!',
    },
  },
  // emptyList
  {
    'hhoj5w95': {
      'en': 'New season is coming soon',
      'de': 'Die neue Season kommt bald',
    },
  },
  // AdminNavBar
  {
    'tick9btn': {
      'en': 'User management',
      'de': 'User management',
    },
    'drznubl9': {
      'en': 'Seasons & Workouts',
      'de': 'Seasons & Workouts',
    },
    'm3gsbeo5': {
      'en': 'Warm Ups & Cool Downs',
      'de': 'Warm Ups & Cool Downs',
    },
    'zzsj42bs': {
      'en': 'Zoom jam',
      'de': 'Zoom jam',
    },
    'pri1d38w': {
      'en': 'Promocodes',
      'de': 'Promocodes',
    },
    'nxkzh44m': {
      'en': 'Home page banner',
      'de': 'Home page banner',
    },
    '4dqayonk': {
      'en': 'Settings',
      'de': 'Settings',
    },
    '4uzwmty6': {
      'en': 'Log out',
      'de': 'Log out',
    },
  },
  // AdminUserDialog
  {
    'lb25x687': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    'dvtiwz6k': {
      'en': 'Block',
      'de': 'Block',
    },
    'rxnnn430': {
      'en': 'Unblock',
      'de': 'Entsperren',
    },
    'yg69qf30': {
      'en': 'Delete',
      'de': 'Löschen',
    },
    'kkpnt18h': {
      'en': 'Undelete',
      'de': 'Wiederherstellen',
    },
  },
  // AdminPromoDialog
  {
    'nl8ado3z': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    'zu58z2ce': {
      'en': 'Delete',
      'de': 'Löschen',
    },
  },
  // AdminAdditionalDialog
  {
    '3t18wf8v': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    'yxv1s5km': {
      'en': 'Delete',
      'de': 'Löschen',
    },
  },
  // AdminSeasonsDialog
  {
    'znof1dn9': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    '5sfhq8hv': {
      'en': 'Delete',
      'de': 'Löschen',
    },
  },
  // AdminWorkoutDialog
  {
    'swxuh7uj': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    'gfuz0xjb': {
      'en': 'Delete',
      'de': 'Löschen',
    },
  },
  // ZOOMLiveWorkoutJam
  {
    'b7u7xmtu': {
      'en': 'ZOOM Live Workout Jam',
      'de': 'ZOOM Live Workout Jam',
    },
    'ff8izshk': {
      'en': 'Go!',
      'de': 'Go!',
    },
  },
  // AdminUserDelete
  {
    'vm6go066': {
      'en': 'Delete the user  ',
      'de': 'Löschen des Benutzers\n',
    },
    '2qiq18m8': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    'x9ca0b0h': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    'b7bw3uv3': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // AdminSeasonDelete
  {
    '44136c4q': {
      'en': 'Delete Season \n',
      'de': 'Season löschen \n',
    },
    'w4dp0y0m': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    'w46hcok7': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    'jctsbof6': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // AdminWorkoutDelete
  {
    '0hgaddei': {
      'en': 'Delete Workout\n',
      'de': 'Training löschen\n',
    },
    '9hauiwml': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    '14zp702l': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    'lpm1lmzc': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // AdminAdditDelete
  {
    'aynf9u5v': {
      'en': 'Delete ',
      'de': 'Löschen',
    },
    'zubjccwe': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    'zhby8sat': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    'qf8xstnf': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // AdminPromoDelete
  {
    'lhrc4wgb': {
      'en': 'Delete Promo\n',
      'de': 'Angebot löschen\n',
    },
    'k57jnz91': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    'io8po2vw': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    's3b1itgc': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // AdminSaveDialog
  {
    '7cb9tz2d': {
      'en': 'Save the changes before exiting?',
      'de': 'Änderungen vor dem Beenden speichern?',
    },
    'zzlh32ea': {
      'en': 'Yes, save',
      'de': 'Ja, speichern',
    },
    'rucud17i': {
      'en': 'Don’t save',
      'de': 'Nicht speichern',
    },
  },
  // AdminBannerDelete
  {
    'gyn03twp': {
      'en': 'Delete Home page banner #',
      'de': 'Startseitenbanner löschen #',
    },
    'huef6fdh': {
      'en': ' You’ll not be able to undo this action',
      'de': 'Sie können diese Aktion nicht rückgängig machen',
    },
    'tqmo743l': {
      'en': 'Yes, delete',
      'de': 'Ja, löschen',
    },
    'x5m4gglg': {
      'en': 'No, cancel',
      'de': 'Nein, abbrechen',
    },
  },
  // PaymentDialogStart
  {
    'yddbsx0v': {
      'en': 'START YOUR 7-DAY \nTRIAL — FOR FREE!',
      'de': 'STARTE DEINEN 7-TAGE-\nTRIAL – KOSTENLOS!',
    },
    'regbuahb': {
      'en': 'YOUR FIRST WORKOUT IS WAITING —\nFEEL THE DIFFERENCE INSTANTLY',
      'de': 'DEIN ERSTES WORKOUT WARTET – SPÜRE SOFORT DEN UNTERSCHIED!',
    },
    'ho2sfkjt': {
      'en': 'More energy, more motivation, more variety',
      'de': 'Mehr Energie, mehr Motivation, mehr Abwechslung',
    },
    'p773u3g7': {
      'en': '100+ exercises & 80+ workouts for every fitness level',
      'de': '100+ Übungen & 80+ Workouts für jedes Level',
    },
    '78caukbi': {
      'en': 'New content regularly — no workout is ever the same',
      'de': 'Regelmäßige neue Inhalte — kein Training ist wie das andere',
    },
    '0a9jj1ve': {
      'en': 'Live Zoom training — work out with real coaches & the community!',
      'de':
          'Live-Trainings via Zoom — trainiere mit einem echten Coach & der Community!',
    },
    'kxbtg83c': {
      'en':
          'Try HIIT the Beat for free for 7 days & experience the power of music-driven workouts!',
      'de':
          'Teste jetzt 7 Tage kostenlos & entdecke die Power von HIIT the Beat!',
    },
    '0rf1lodg': {
      'en': 'START YOUR FREE TRIAL',
      'de': 'JETZT KOSTENLOS TESTEN',
    },
  },
  // Miscellaneous
  {
    'pj6qeklk': {
      'en': 'Button',
      'de': 'Taste',
    },
    'jv1ob6ru': {
      'en': 'Button',
      'de': 'Taste',
    },
    '01pvmdwr': {
      'en': 'Button',
      'de': 'Geh zurück',
    },
    'wh79yjoi': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
    },
    'k43c5sxh': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
    },
    'c6kkyg7s': {
      'en':
          'In order to record audio for video, this app requires permission to access the microphone',
      'de':
          'Um Audio für Videos aufzunehmen, benötigt diese App die Berechtigung, auf das Mikrofon zuzugreifen',
    },
    'rlblj569': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
    },
    'gwyq325x': {
      'en':
          'In order to take a profile photo, this app requires permission to access the camera',
      'de':
          'Um ein Profilfoto aufzunehmen, benötigt diese App die Berechtigung, auf die Kamera zuzugreifen',
    },
    'ww67q1bf': {
      'en': 'No',
      'de': '',
    },
    'jm6so7ph': {
      'en': 'Incorrect password',
      'de': 'Falsches Passwort',
    },
    'u69dsnud': {
      'en': 'Password reset email sent!',
      'de': 'E-Mail zum Zurücksetzen des Passworts gesendet!',
    },
    'vpfdzl3u': {
      'en': 'Email required!',
      'de': 'E-Mail erforderlich!',
    },
    'nug5p501': {
      'en': 'Phone number required and has to start with +.',
      'de': 'Telefonnummer erforderlich und muss mit + beginnen.',
    },
    '7lo5s5n2': {
      'en': 'Passwords don\'t match',
      'de': 'Passwörter stimmen nicht überein',
    },
    '3haelhid': {
      'en': 'Enter SMS verification code',
      'de': 'Geben Sie den SMS-Bestätigungscode ein',
    },
    '6qgwe53g': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
      'de':
          'Seit der letzten Anmeldung ist zu viel Zeit vergangen. Melden Sie sich erneut an, bevor Sie Ihr Konto löschen.',
    },
    'jmjycs4n': {
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
      'de':
          'Seit der letzten Anmeldung ist es zu lange her. Melden Sie sich erneut an, bevor Sie Ihre E-Mail aktualisieren.',
    },
    'jjdb1l2z': {
      'en': 'Email change confirmation email sent!',
      'de': 'E-Mail zur Bestätigung der E-Mail-Änderung gesendet!',
    },
    'arun1945': {
      'en': 'Email already in use by another account',
      'de': 'E-Mail wird bereits von einem anderen Konto verwendet',
    },
    'ycndrg4i': {
      'en':
          'The supplied auth credential is incorrect, mailformed or has expired',
      'de':
          'Die angegebenen Authentifizierungsdaten sind falsch, wurden per E-Mail übermittelt oder sind abgelaufen',
    },
    'pquzm91j': {
      'en': 'Invalid file format',
      'de': 'Ungültiges Dateiformat',
    },
    'ymecmle0': {
      'en': 'Uploading file...',
      'de': 'Datei wird hochgeladen...',
    },
    '3belwmph': {
      'en': 'Success!',
      'de': 'Erfolg!',
    },
    'crlat6zs': {
      'en': 'Failed to upload data',
      'de': 'Daten konnten nicht hochgeladen werden',
    },
    '11vo54ai': {
      'en': '',
      'de': '',
    },
    'e1lysev9': {
      'en': 'Choose Source',
      'de': 'Quelle auswählen',
    },
    '9tws2a1y': {
      'en': 'Gallery',
      'de': 'Galerie',
    },
    'dpsjopc3': {
      'en': 'Gallery (Photo)',
      'de': 'Galerie (Foto)',
    },
    'jkw5dju5': {
      'en': 'Gallery (Video)',
      'de': 'Galerie (Video)',
    },
    'cqfxytrc': {
      'en': 'Camera',
      'de': 'Kamera',
    },
    'iyqtbg5l': {
      'en': '',
      'de': '',
    },
    'n7xxu8t2': {
      'en': '',
      'de': '',
    },
    '2biy8evf': {
      'en': '',
      'de': '',
    },
    'xgwnchts': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
