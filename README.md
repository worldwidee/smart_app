# smart_app

<p align="center">
<img width=600 src="https://github.com/worldwidee/files/raw/main/responsive.gif"> 
<img width=600 src="https://raw.githubusercontent.com/worldwidee/files/main/settings.gif"> 
</p>

Easy and simple way to design your application.<br/>
Creating the application skeleton could be tough. You can use this skeleton we prepared for you, after you complete the simple steps below. Work on a single project to create your multi-platform app instead of separating your project for any specific platform. We have also prepared a lot of widgets to make your job easier.<br/>
Note: The application which was located inside example folder is ready to utilize. Just do your own fine tuning and go ahead start building your own, project with given features below.

## Features

Page management is ready to use.<br/>
Writing textstyle  again and again could become a boring task, you will have an access to your own textstyle.  <br/>
You will be able to access these features easily from anywhere in the application.<br/>  
- Page management
- Responsive textstyle(for mobile)
- Manage appearances of your application
- Adjustable custom settings 
- Language supported text and list of text
- Icon size
- Run your own function on change of internet connection status
- Also you can define spesific textstyle, icon size, word/sentence, color
- All given features are customizable to your own liking(textstyles,iconsize,colors..)
- Reach App size, width, height and the other variables anywhere on your project

Pre-defined TextStyle types:
- xS, S, M, L, xL, mega, giga

Appearance contains these variables:
- Background Color
- Text Color
- Hint Color
- Button Color
- Button Text Color
- Secondary Background Color
- Secondary Text Color
- Secondary Hint Color
- Secondary Button Color
- Secondary Button Text Color
- AppBar Background Color
- AppBar Text Color
- AppBar Hint Color
- AppBar Button Color
- AppBar Button Text Color
- Drawer Background Color
- Drawer Text Color
- Drawer Hint Color
- Drawer Button Color
- Drawer Button Text Color
- Dialog Background Color
- Dialog Text Color
- Dialog Hint Color
- Dialog Button Color
- Dialog Button Text Color

Pre-defined Settings

- Languages
- Device Type(Desktop-Mobile)
- Internet connection status


## Getting started

You must add the library as a dependency to your project.
```yaml
dependencies:
 smart_app: ^latest
```

Then run `flutter packages get`

## Example Project

There is a detailed example project in the `example` folder. You can directly run and start working on it. There are code snippets from example project below.

## Basic Setup
Run SmartApp.setup() in main function. 

```dart
void main() {
  SmartApp.setup(
      pages: appPages, languages: languages, appearances: appearances);
}
```
Set listener for AppSettings in every stateful widget. Set listener for AppSettings in every stateful widget. To be able to display the changes on your page setstate function must be run

```dart
  @override
  void initState() {
    SmartApp.appSettings.listenState(this);
    super.initState();
  }
```

Set application sizes on your page control panel(the dynamic place where you view your pages)<br/>
Helper: "example/app_design/page_control_panel.dart" here you can see how it could be done<br/>
Note: Setting staticSize as true on Desktop and false onMobile is suggested<br/>

```dart
  //Turn false if you want dynamic textstyle fonts or icon size
  bool setSizesAsStatic = true;
  @override
  Widget build(BuildContext context) {
    SmartApp.appFonts.init(context,staticSize: setSizesAsStatic);
    
  return Scaffold(
      backgroundColor: SmartApp.appColors.backGroundColor,
      body: SmartPage(),
    );
  }
```
Thats it! You can fetch your defined fonts or settings anywhere on your project!

## PageState(Page Management)
- Define your pages

```dart
  AppPages appPages = AppPages(pages: {
    "page1": const Page1(),
    "page2": const Page2(),
    "settings": const Settings(),
    "login": const LoginPage(),
  }, initPage: "page1");
```
- And put that inside setup function or set for PageState

```dart
  SmartApp.setup(pages: appPages);
```
```dart
  SmartApp.setAppPages(appPages);
```

- Full view
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppPages appPages = AppPages(pages: {
    "page1": const Page1(),
    "page2": const Page2(),
    "settings": const Settings(),
    "login": const LoginPage(),
  }, initPage: "page1");
  AppLanguages languages =
      AppLanguages(languages: ["English,Turkish"], initLanguge: "English");
  AppAppearances appearances = AppAppearances(appearances: [
    Appearance.dark(),
    Appearance.light(),
  ], initAppearance: Appearance.dark());
  SmartApp.setup(
      pages: appPages, languages: languages, appearances: appearances);
  runApp(const MyApp());
}
```

- SmartPage() is your dynamic page widget. Use this widget in the dynamic place where you want to display your pages. Then simply you can use it like the example below<br/>
Helper: "example/app_design/page_control_panel.dart" here you can see how we it could be done.

```dart
  Scaffold(
      backgroundColor: SmartApp.appColors.backGroundColor,
      body: SmartPage(),
    )
```

when there isn't a present have a signed in user, the current would be login page. In that case, widgets such as menus, appbar cannot be displayed. It could be difficult to set the dynamic part of the application in those situations. An example was given below to overcome this situation.

```dart
    return Scaffold(
      backgroundColor: SmartApp.appColors.backGroundColor,
      appBar: signIn ? MyAppbar() : null,
      body: signIn
          ? Row(
              children: [
                Expanded(
                  child: LeftMenu(),
                ),
                Expanded(
                  flex: 5,
                  child: SmartPage(),
                )
              ],
            )
          : SmartPage(),
    );
```

### Change Page
You have two ways to switch between pages

-via BuildContext:
```dart
   context.go(name: pageName); //Provide the defined name of the target page
```

-via PageState:
```dart
   SmartApp.pageState.go(name: pageName); //Provide the defined name of the target page
```

## AppFonts part

### Set Application Sizes
Set application sizes on your page control panel(the dynamic place where you view your pages)<br/>
Note: Setting staticSize as true on Desktop and false onMobile is suggested

```dart
  //Turn false if you want dynamic textstyle fonts or icon size
  bool setSizesAsStatic = true;
  @override
  Widget build(BuildContext context) {
    SmartApp.appFonts.init(context,staticSize: setSizesAsStatic);
    
  return Scaffold();
  }
```

TextStyle parameters = color, isBold, fontWeight, isStatic. These parameters have their own default values so you dont have to define them
```dart
    Text(
      "Hello",
      style: SmartApp.appFonts.L(
      isBold: true,
      color: SmartApp.appColors.textColor,
      fontWeight: FontWeight.normal),
        ),
```
Static and dynamic textstyle could be chosen in specific cases of your project<br/>
- Fetching TextStyle
```dart
    Text(
       "Hello",
       style: SmartApp.appFonts.L(isStatic: true),
    )
```
- If you are working with dynamic textstyle, these textstyle sizes are determined by the multiplication of  pre-determined rates and total size of application

```
  Ratios : {
    "xS": 0.009,
    "S": 0.012,
    "M": 0.015,
    "L": 0.020,
    "xL": 0.025,
    "mega": 0.030,
    "giga": 0.040
  }
```
These ratios could be changed with ratio parameter:
```dart
   SmartApp.appFonts.changeStaticSizeRatio(name:"L", ratio:0.012);
```
- Default value of each static size are given below:
```
  Sizes : {
    "xS": 8,
    "S": 12,
    "M": 16,
    "L": 20,
    "xL": 26,
    "mega": 40
  }
```

  These default values could be changed with code given below:

```dart
   SmartApp.appFonts.changeStaticSize(name:"L", size:20);
```

- Fetching app sizes
```dart
    double app_width=SmartApp.appFonts.appWidth;
    double app_height=SmartApp.appFonts.appHeight;
    double app_totalSize=SmartApp.appFonts.totalSize;
```
## AppColors

AppColors contains the color types of your application. Application's appearances have to be defined to be able to use that. 

### Set Appearances

-Define your appearances

```dart
  AppAppearances appearances = AppAppearances(appearances: [
    Appearance.dark(),
    Appearance.light(),
  ], initAppearance: Appearance.dark());
```

-And put that inside setup function or set your app's appearances through setAppAppearances function inside SmartApp

```dart
  SmartApp.setup(appearances: appearances);
```
```dart
  SmartApp.setAppAppearances(appearances);
```


### Variables of Appearance Class

- backgroundColor
- textColor
- hintColor
- btnColor
- btnTextColor
- iconColor
- secondaryBackgroundColor
- secondaryTextColor
- secondaryHintColor
- secondaryBtnColor
- secondaryBtnTextColor
- secondaryIconColor
- appBarBackgroundColor
- appBarTextColor
- appBarHintColor
- appBarBtnColor
- appBarBtnTextColor
- appBarIconColor
- drawerBackgroundColor
- drawerTextColor
- drawerHintColor
- drawerBtnColor
- drawerBtnTextColor
- drawerIconColor
- dialogBackgroundColor
- dialogTextColor
- dialogHintColor
- dialogBtnColor
- dialogBtnTextColor
- dialogIconColor

Applications usually requires at least two background colors to fill the entire page. Some apps might have left menus and in such cases it would be wise to use secondary background color. <br/>

-An example below was given for app with left menus :

```dart
Row(
  children: [
    Expanded(
      child: Container(
        width: 400,
        height: double.infinity,
        color: SmartApp.appColors.secondaryBackgroundColor,
        child: LeftMenu(),
      ),
    ),
    Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: SmartApp.appColors.backgroundColor,
        child: SmartPage(),
      ),
    )
  ],
)
```
-This would mean two text colors are required to design the app. Those variables are called textColor and secondaryTextColor

## AppSettings

AppSettings is the control mechanism of your app. When something gets updated in AppColors and AppFonts, this also triggers AppSettings. Which means AppColors and AppFonts dont need to be listened

AppSettings contains:
- Languages
- Device Type(Desktop-Mobile)
- Internet connection status
- Run your own function on change of internet connection status

### Languages
Languages of the app need to be defined to be able to use "App Language" option.

```dart
  AppLanguages languages =
      AppLanguages(languages: ["English,Turkish"], initLanguge: "English");
  SmartApp.setup(languages: languages);
```

### Device Type(Desktop-Mobile)
-AppFonts.init() function have to be called before using this feature<br/>
-This will give access to boolean variables below :<br/>
- isMobile:
The platform can be checked if it's phone
- isDesktop:
The platform can be checked if it's desktop
- isWeb:
The platform can be checked if it's web
- landScape:
Landscape mode can be checked with
- mobileMode:
Size of desktop app can be checked if it's downsized to mobileMode
- largeMode:
Size of desktop app can be checked if it's large mode
- midMode:
Size of desktop app can be checked if it's between large and mobile mode
- anyMobile:
if the app is multiplatform the size of app can be checked if it's in mobile sizes (this will return true either the platform is mobile or the sizes are in mobile sizes)

```dart
  bool isMobile=SmartApp.appSettings.isMobile;
  bool isDesktop=SmartApp.appSettings.isDesktop;
  bool isDesktop=SmartApp.appSettings.isWeb;
  bool landScape=SmartApp.appSettings.landScape;
  bool mobileMode=SmartApp.appSettings.mobileMode;
  bool largeMode=SmartApp.appSettings.largeMode;
  bool midMode=SmartApp.appSettings.midMode;
  bool anyMobile=SmartApp.appSettings.anyMobile;
```

### Internet Connection Checker

- Run your own function on change of internet connection status:
```dart
  SmartApp.appSettings.onConnectionChange=(status) {
    print("Connection status has changed");
  };
```

-Get connection status:
```dart
  bool connected=SmartApp.appSettings.connected!;
```

## SmartText

Managing the multi language development can be done with ease with the utilization of smartText widget.
- Make sure to define the languages of your app
- SmartText can be used to create single string translations
- SmartList can be used to create a list of translations for multiple strings <br/>

#### Warning: Parameters of SmartText&SmartList must be in same order with AppLanguages

### SmartText can be used inside text widget
```dart
Text(
  SmartText(["Page", "Sayfa"]).text,
  style: appFonts.giga(),
)
```
### SmartList

```dart
Text(
  SmartText(["Page", "Sayfa"]).text,
  style: appFonts.giga(),
)
for (var language in SmartList([
  ["Page1", "Page2", "Page3"],
  ["Seite1", "Seite2", "Seite3"]
]).texts)
  Text(language)
```
-A class that includes common words of an application can be designed the way it was done in the example given below

```dart
class AppTexts {
  static String get ok => SmartText(["ok", "tamam"]).text;
  static String get hello => SmartText(["Hello", "Merhaba"]).text;
  static String get lang => SmartText(["Language", "Dil"]).text;
  static String get page => SmartText(["Page", "Sayfa"]).text;
  static String get login => SmartText(["Login", "Giriş"]).text;
  static String get appbar_title =>
      SmartText(["Smart App Design", "Akıllı Uygulama Tasarımı"]).text;
  static String get settings => SmartText(["Settings", "Ayarlar"]).text;
  static String get signout => SmartText(["Signout", "Çıkış"]).text;
  static String get darkMode => SmartText(["Dark Mode", "Karanlık Mod"]).text;
  static String get btnText => SmartText([
        "You have pushed the button this many times",
        "Düğmeye bukadar çok bastın",
      ]).text;
  static List<String> get languages => SmartList([
        ["English", "Turkish"],
        ["İngilizce", "Türkçe"]
      ]).text;
  static List<String> get menus => SmartList([
        ["Page 1", "Page 2", "Settings", "Signout"],
        ["Sayfa 1", "Sayfa 2", "Ayarlar", "Çıkış"]
      ]).text;
}
```

-And it can be used as presented below:

```dart
Text(
  AppTexts.hello,
  style: appFonts.giga(),
)
```

## Customizable Features

- Custom AppFonts
```dart
   double size=20;
   String name="middle";
   SmartApp.appFonts.addSpecificSize(name:name,size:size);
   // Then get your specific textstyle and size
   double size=SmartApp.appFonts.specificSize("middle");
   TextStyle specific=SmartApp.appFonts.specific(specificType:"middle");
```
- Custom AppSettings
```dart
    bool variable = false;
    SmartApp.appSettings.addSpecificVariable(variable: variable, name: "leftMenuOpened");
    SmartApp.appSettings.addSpecificSetting(
        function: () {
          SmartApp.appSettings.specificVariables["leftMenuOpened"] =
              !SmartApp.appSettings.specificVariables["leftMenuOpened"];
        },
        name: "changeLeftMenuStatus");
```


## Widgets, Functions, Extensions

<img width=800 src="https://raw.githubusercontent.com/worldwidee/files/main/widgets.gif"> 


|      Widgets      |     Functions     |           Extensions         |
| -------------     |:-----------------:|:----------------------------:|
| CheckBox          | cropImage         | inCaps(String)               |
| CheckBoxList      | smartDialog       | allInCaps(String)            |
| ChildExpanded     |                   | allInCaps(String)            |
| CropImage         |                   | capitalizeFirstofEach(String)|
| DownloadButton    |                   | capitalize()(String)         |
| DropDown          |                   | go()(BuildContext)           |
| ExpandedContainer |                   |                              |
| ExpandedLine      |                   |                              |
| ExpandedText      |                   |                              |
| ExpandedWidget    |                   |                              |
| ExpandedButton    |                   |                              |
| FileIcon          |                   |                              |
| FileType          |                   |                              |
| GlassMorphism     |                   |                              |
| IconOfFile        |                   |                              |
| ImageAvatar       |                   |                              |
| InfContainer      |                   |                              |
| InfiniteText      |                   |                              |
| LineChart         |                   |                              |
| LiquidLoadingBar  |                   |                              |
| MiddleOfExpanded  |                   |                              |
| OnHover           |                   |                              |
| PasswordField     |                   |                              |
| ProfileAvatar     |                   |                              |
| RadioButtonList   |                   |                              |
| RegionBar         |                   |                              |
| SizedButton       |                   |                              |
| SmartTextField    |                   |                              |
| SmartTextFieldFull|                   |                              |
| ChatTextField     |                   |                              |
| ExpandedTextButton|                   |                              |
| SmartPlayer       |                   |                              |
| VideoPlayerMobile |                   |                              |
| VideoPlayerDesktop|                   |                              |

## To Contribute
* If you **found a bug** or **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.