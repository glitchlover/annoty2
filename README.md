# Annoty⚡
~*A study tool for modern era* ❤️

Annoty aims to simplify studying pdf by providing you with easy and searchable annotation and backlinkings 🔗.


## Features✨

- Light/dark mode toggle
- Annotation manupulation tools
- Intelligent search
- Backlinking
- Cross platform


## Roadmap🗺️
![tasks](TASKME.md)



## Project Blueprint
- 📱 app/
   |- 💼 core/         <!-- shared code like constants, logger, routes, theme -->
       |- 🗂️ consts
       |- 🗂️ routes
       |- 🗂️ themes
       |- 🗂️ utils
       |- 🗂️ loggers   <!-- 🔮 will wrap it into resource folder when error handling comes -->
   |- 💼 database/     <!-- has the information of types of data, where they are and how to change them -->
       |- 🗂️ sources
           - 🗂️ system
           - 🗂️ local
           - 🗂️ remote
       |- 🗂️ models    <!-- enums, abstraction and models are here -->
       |- 🗂️ apis      <!-- changing data -->
   |- 💼 provider/     <!-- (⚠️ not about state) provides new data to database to change data -->
       |- 🗂️ entities
       |- 🗂️ functions
       |- 🗂️ infrastructure
   |- 💼 presentation/ <!-- where ui renderes and trigger generates -->
       |- 🗂️ shared
           |- 🗂️ widgets
           |- 🗂️ dialogs
           |- 🗂️ layouts
       |- 🗂️ ui
   |- 📜 app.dart
|- 📜 main.dart


















