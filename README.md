# smart_app

Easy and simple way to design your application.

<p align="center">
<img src="https://github.com/worldwidee/files/raw/main/responsive.gif"> 
<img src="https://github.com/worldwidee/files/raw/main/modechange.gif"> 
</p>

## Features

You will be able to access these features easily from anywhere in the application.
TextStyle is hard to write again again in Text widget.
- Responsive textstyle(Especially for desktop apps)
- Dark/Light mode colors
- Internet connection checker
- Spesific settings 
- Language supported words/sentences
- Icon size
- Also you can define spesific textstyle, icon size, word/sentence, color
- Customizable Features
- All specified specifications may change(specified textstyles,iconsize,colors..)
- App size, width, height


Defined TextStyle types:
- xS, S, M, L, xL, mega

Defined App Colors:
- Background Color
- Text Color
- Second Background Color
- Second Text Color

Defined Settings

- App Language
- Internet Connection Checker
- Dark Mode
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
Start SmartAppPanel() in main function. 

```dart
late AppColors appColors;
late AppFonts appFonts;
late AppSettings appSettings;
late AppTexts appTexts;
late SmartAppPanel panel;
void main() {
  panel = SmartAppPanel();
  panel.start();
  appFonts = panel.appFonts;
  appColors = panel.appColors;
  appSettings = panel.appSettings;
  appTexts = panel.appTexts;
  runApp(MyApp());
}
```
Set listener for appSettings in every stateful widget. Because when you change some features, it needs setstate if you want show changes

```dart
  @override
  void initState() {
    appSettings.addListener(setStateHere);
    super.initState();
  }
  void setStateHere() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  void dispose() {
    appSettings.removeListener(setStateHere);
    super.dispose();
  }
```

Set application sizes 
in desktop/web=>

```dart
  //Turn false if you want static textstyle fonts
  bool isResposible = true;
  @override
  Widget build(BuildContext context) {
      appFonts.changeSizes(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          isResposible: isResposible);
    
  return Scaffold();
  }
```
in mobile=>
```dart
  bool started = false;
  bool isResposible = false;
  @override
  Widget build(BuildContext context) {
    if (!started) {
      appFonts.changeSizes(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          isResposible: isResposible);
      started = true;
    }
  return Scaffold();
  }
```
Thats it! You can fetch your defined fonts or settings

## AppFonts part

TextStyle parameters = color, isBold, fontWeight
But you dont need to define its parameters if its not special
```dart
    Text(
      "Hello",
      style: appFonts.L(
      isBold: true,
      color: appColors.textColor,
      fontWeight: FontWeight.normal),
        ),
```
- Fetching TextStyle
```dart
    Text(
       "Hello",
       style: appFonts.L(),
    )
```
- If you are working on Desktop/Web app also trying to get responsive textstyle, these textstyle sizes are calculated by multiplying the app width by some ratio
  Ratios : {
    "xS": 0.007,
    "S": 0.009,
    "M": 0.012,
    "L": 0.015,
    "xL": 0.020,
    "mega": 0.030
  }
  You can change these ratios with:
```dart
   appFonts.changeStaticSizeRatio(name:"L", ratio:0.012);
```
- If you want to work on mobile app or any app which is using static text size, static textstyle sizes like:
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
   appFonts.changeStaticSize(name:"L", size:20);
```

- Fetching app sizes
```dart
    double app_width=appFonts.appWidth;
    double app_height=appFonts.appHeight;
    double app_totalSize=appFonts.totalSize;
```
## AppColors

Application designs mostly need two common color for background fill. For example when you got left menu, second background color is waiting to fill it. 

- Imagine we got left menu design and page design which is designed with expanded widgets. You can design like that:

```dart
Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: appColors.secondColor,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: appColors.backGroundColor,
          ),
        )
      ],
    )
```
- Then we also need two text color too. These names are textColor, secondTextColor

## AppSettings

AppSettings is the control mechanism of everything.

-You can set init app language, dark mode, function which is working after changing internet status while starting SmartAppPanel() or with defined functions.
```dart
   appSettings.changeLanguage="English";
   appSettings.changeDarkMode=true;
   appSettings.afterConnectionFunc = (connection) {
      print("Current Conneciton:$connection");
    };
```

## AppTexts

When you are developing multi language application it can be hard to manage it. But with this way its so simple.
You need a txt file and fill with your app texts. File should design like that:
First Line:Languages
Other Lines:Your text variable name|=|meaning1|,|meaning2|,|meaning3|,|meaning4
Warning: Dont put empty line or space in beginning in your text file
For example:
- texts.txt file in Example/assets folder:
``
English,Turkish,German
hello|=|Hello|,|Merhaba|,|Hallo
lang|=|Language|,|Dil|,|Sprache
darkMode|=|Dark Mode|,|Karanlık Mod|,|Dunkler Modus
btnText|=|You have pushed the button this many times|,|Düğmeye bukadar çok bastın|,|Sie haben den Knopf so oft gedrückt
appbar_title|=|Smart App Design|,|Akıllı Uygulama Tasarımı|,|Intelligentes App-Design
``

- After design your app texts file you are ready to set your words. You can set texts with defined function or while starting SmartAppPanel()

```dart
   setTexts("assets/texts.txt");
```

- Now you are ready to fetch texts wherever you are

```dart
   Text(
        appTexts.getText("hello"),
        style: appFonts.L(),
        )
```
## Customizable Features

- Custom AppColor
```dart
   ColorItem color=ColorItem(darkColor:Colors.black,lightColor:Colors.white);
   String name="bgColor";
   appColors.addSpecificColor(name:name,color:color);
   // Then get your specific color
   Color color=appColors.specific("bgColor");
```
- Custom AppFonts
```dart
   double size=20;
   String name="middle";
   appFonts.addSpecificSize(name:name,size:size);
   // Then get your specific textstyle and size
   double size=appFonts.specificSize("middle");
   TextStyle specific=appFonts.specific(specificType:"middle");
```
- Custom AppSettings
```dart
    bool variable = false;
    appSettings.addSpecificVariable(variable: variable, name: "leftMenuOpened");
    appSettings.addSpecificSetting(
        function: () {
          appSettings.specificVariables["leftMenuOpened"] =
              !appSettings.specificVariables["leftMenuOpened"];
        },
        name: "changeLeftMenuStatus");
```
## Contributions
* If you **found a bug**, open an issue.
* If you **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.