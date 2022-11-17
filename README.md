# smart_app

<p align="center">
<img src="https://github.com/worldwidee/files/raw/main/responsive.gif"> 
<img src="https://github.com/worldwidee/files/raw/main/modechange.gif"> 
</p>

Easy and simple way to design your application.
Creating the application skeleton may be tough. You can use this skeleton we prepared for you after you complete the simple steps ahead. Develop applications for mobile and desktop platforms at the same time. We also prepared a lot of widgets to make your job easier.
Note: The application which is inside example folder is ready to develop(Just edit some specific things). You don't have to deal with these following features

## Features

Page management is ready  
TextStyle is hard to write again again in Text widget.  
You will be able to access these features easily from anywhere in the application.  
- Page management
- Responsive textstyle(Mobile)
- Manage appearances of your application
- Internet connection checker
- Spesific settings 
- Language supported words/sentences
- Icon size
- Also you can define spesific textstyle, icon size, word/sentence, color
- Customizable Features
- All specified specifications may change(specified textstyles,iconsize,colors..)
- Reach App size, width, height and the other variables from everywhere


Defined TextStyle types:
- xS, S, M, L, xL, mega

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

Defined Settings

- Languages
- Device Type(Desktop-Mobile)
- Definable function which is working after changing internet connection status


## Getting started

You must add the library as a dependency to your project.
```yaml
dependencies:
 smart_app: ^latest
```

Then run `flutter packages get`

## Example Project

There is a detailed example project in the `example` folder. You can directly run and play on it. There are code snippets from example project below.

## Basic Setup
Run SmartAppPanel.setup() in main function. 

```dart
void main() {
  SmartAppPanel.setup(
      pages: appPages, languages: languages, appearances: appearances);
}
```
Set listener for AppSettings in every stateful widget. Because when you change some features, it needs setstate if you want to show changes

```dart
  @override
  void initState() {
    SmartAppPanel.appSettings.listenState(this);
    super.initState();
  }
```

Set application sizes in your page control panel(the dynamic place where you view your pages)
Note: We suggest you to set staticSize as true on Desktop and opposite on Mobile

```dart
  //Turn false if you want dynamic textstyle fonts or icon size
  bool setSizesAsStatic = true;
  @override
  Widget build(BuildContext context) {
    SmartAppPanel.appFonts.init(context,staticSize: setSizesAsStatic);
    
  return Scaffold();
  }
```
Thats it! You can fetch your defined fonts or settings from everywhere!

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
  SmartAppPanel.setup(pages: appPages);
```
```dart
  SmartAppPanel.setAppPages(appPages);
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
  SmartAppPanel.setup(
      pages: appPages, languages: languages, appearances: appearances);
  runApp(const MyApp());
}
```

- SmartPage() is your dynamic page widget.Use this widget in the dynamic place where you want to display your pages.Then simply you can use like below the example

```dart
  Scaffold(
      backgroundColor: SmartAppPanel.appColors.backGroundColor,
      body: SmartPage(),
    )
```

in cases where user can login
Login page mostly doesn't have appbar or menu. Thats why below example designed like that
```dart
    return Scaffold(
      backgroundColor: SmartAppPanel.appColors.backGroundColor,
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
You have two ways to change the current page

-via BuildContext:
```dart
   context.go(name: pageName); //Provide the defined name of the target page
```

-via PageState:
```dart
   SmartAppPanel.pageState.go(name: pageName); //Provide the defined name of the target page
```

## AppFonts part

### Set Application Sizes
Set application sizes in your page control panel(the dynamic place where you view your pages)
Note: We suggest you to set staticSize as true on Desktop and opposite on Mobile

```dart
  //Turn false if you want dynamic textstyle fonts or icon size
  bool setSizesAsStatic = true;
  @override
  Widget build(BuildContext context) {
    SmartAppPanel.appFonts.init(context,staticSize: setSizesAsStatic);
    
  return Scaffold();
  }
```

TextStyle parameters = color, isBold, fontWeight, isStatic
But you dont need to define its parameters
```dart
    Text(
      "Hello",
      style: SmartAppPanel.appFonts.L(
      isBold: true,
      color: SmartAppPanel.appColors.textColor,
      fontWeight: FontWeight.normal),
        ),
```
Specifically, you may need static/dynamic textstyle
- Fetching TextStyle
```dart
    Text(
       "Hello",
       style: SmartAppPanel.appFonts.L(isStatic: true),
    )
```
- If you are working with responsive textstyle, these textstyle sizes are calculated by multiplying the total app size(app width + app height) by some ratio
  Ratios : {
    "xS": 0.009,
    "S": 0.012,
    "M": 0.015,
    "L": 0.020,
    "xL": 0.025,
    "mega": 0.030,
    "giga": 0.040
  }
  You can change these ratios with:
```dart
   SmartAppPanel.appFonts.changeStaticSizeRatio(name:"L", ratio:0.012);
```
- If you are working with static textstyle, static textstyle sizes like:
  Sizes : {
    "xS": 8,
    "S": 12,
    "M": 16,
    "L": 20,
    "xL": 26,
    "mega": 40
  }
  You can change these sizes with:
```dart
   SmartAppPanel.appFonts.changeStaticSize(name:"L", size:20);
```

- Fetching app sizes
```dart
    double app_width=SmartAppPanel.appFonts.appWidth;
    double app_height=SmartAppPanel.appFonts.appHeight;
    double app_totalSize=SmartAppPanel.appFonts.totalSize;
```
## AppColors

AppColors contains the color types of your application. You need to set your application's appearances to use that. 

### Set Appearances

-Define your appearances

```dart
  AppAppearances appearances = AppAppearances(appearances: [
    Appearance.dark(),
    Appearance.light(),
  ], initAppearance: Appearance.dark());
```

- And put that inside setup function or set your app's appearances through setAppAppearances function inside SmartAppPanel

```dart
  SmartAppPanel.setup(appearances: appearances);
```
```dart
  SmartAppPanel.setAppAppearances(appearances);
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

Application designs mostly need two common color for background fill. For example when you got left menu, second background color is waiting to fill it. 

- Imagine you got left menu and design like that:

```dart
Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: SmartAppPanel.appColors.secondaryBackgroundColor,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: SmartAppPanel.appColors.backgroundColor,
          ),
        )
      ],
    )
```
- Then we also need two text color too. These names are textColor, secondaryTextColor

## AppSettings

AppSettings is the control mechanism of your app. When something updated in AppColors and AppFonts, this also trigger to AppSettings. Which means you dont need to listen the other statements.

AppSettings contains:
- Languages
- Device Type(Desktop-Mobile)
- Definable function which is working after changing internet connection status

### Languages
-You need to set languages of your app to use "App Language" option and put it inside setup function

```dart
  AppLanguages languages =
      AppLanguages(languages: ["English,Turkish"], initLanguge: "English");
  SmartAppPanel.setup(languages: languages);
```

### Device Type(Desktop-Mobile)
-Make sure you have called AppFonts.init() function before using this feature
-You'll be able to reach these bool variables:
- isMobile:
You can check if the user is connected by phone
- isDesktop:
You can check if the user is connected with the desktop
- isWeb:
You can check if the user is connected via the web
- landScape:
You can check if the user is holding the phone sideways
- mobileMode:
You can check if the user has downsized the desktop app to the size of the mobile app
- largeMode:
You can check if the user is using the desktop application in high sizes
- midMode:
You can check if the user is using the desktop application in sizes that between Mobile Mode and Large Mode
- anyMobile:
If you are developing crossplatform application and want check if it is in mobile sizes, you can use this

```dart
  bool isMobile=SmartAppPanel.appSettings.isMobile;
  bool isDesktop=SmartAppPanel.appSettings.isDesktop;
  bool isDesktop=SmartAppPanel.appSettings.isWeb;
  bool landScape=SmartAppPanel.appSettings.landScape;
  bool mobileMode=SmartAppPanel.appSettings.mobileMode;
  bool largeMode=SmartAppPanel.appSettings.largeMode;
  bool midMode=SmartAppPanel.appSettings.midMode;
  bool anyMobile=SmartAppPanel.appSettings.anyMobile;
```

### Internet Connection Checker

-Set your function which is working after changing internet connection status:
```dart
  SmartAppPanel.appSettings.onConnectionChange=(status) {
    print("Connection status has changed");
  };
```

-Get connection status:
```dart
  bool connected=SmartAppPanel.appSettings.connected!;
```

## SmartText

When you are developing multi language application it can be hard to manage it. But with this way its so simple.
- Make sure to set the languages of your app
- Use SmartText for variable of type String, SmartList for variable of type List<String>
- 
### Use SmartText inside your Text() widget

```dart
Text(
  SmartText(["Page", "Sayfa"]).text,
  style: appFonts.giga(),
)
```
### Design your word class that includes your common words like this way:

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

And use it:

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
   SmartAppPanel.appFonts.addSpecificSize(name:name,size:size);
   // Then get your specific textstyle and size
   double size=SmartAppPanel.appFonts.specificSize("middle");
   TextStyle specific=SmartAppPanel.appFonts.specific(specificType:"middle");
```
- Custom AppSettings
```dart
    bool variable = false;
    SmartAppPanel.appSettings.addSpecificVariable(variable: variable, name: "leftMenuOpened");
    SmartAppPanel.appSettings.addSpecificSetting(
        function: () {
          SmartAppPanel.appSettings.specificVariables["leftMenuOpened"] =
              !SmartAppPanel.appSettings.specificVariables["leftMenuOpened"];
        },
        name: "changeLeftMenuStatus");
```

## Widgets, Functions, Extensions

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

## Contributions
* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.