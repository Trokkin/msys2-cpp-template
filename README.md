# C++ template with CMake & Beginners guide to VSCode

A simple C++ project template with a guide for setting up CMake C++ environment in Windows using MSys2 MinGW compiler and ClangD intellisense. Designed to deliver a quick win for complete beginners in programming.

## Getting Started

### Program prerequisites

- **Visual Studio Code**. Found at <https://code.visualstudio.com/Download>
- **Git client**. Found at <https://git-scm.com/downloads>, or in the Source Control panel of VSCode (hotkey: `Ctrl+Shift+G + G`).
- **MSys2**. Found at <https://www.msys2.org/#installation>.

#### Updating the MSys2

After installing the MSys2 it should open a terminal of itself. Run the following command there, then press `Enter` on every prompt (e.g. `Proceed with installation? [Y/n]`. The default option is capitalized, in this case -- to proceed).

```bash
pacman -Syu
```

The last prompt will close the terminal. It's fine; we'll open a new one in the VSCode.

### Initial VSCode setup

#### Log in to VSCode with your GitHub account

At the bottom left there's menu for your accounts in VSCode. Sign in into VSCode with your GitHub account (create one if needed at <https://github.com>). Turn on Settings Sync. Trust me, you'll be grateful to have your settings synced once you'll get to another computer.

#### Clone this repository

Select `Clone repository` button in the VSCode Source Control panel (`Ctrl+Shift+G + G`), and paste the following URL when prompted for one (look at the top of the editor):

```url
git@github.com:Trokkin/msys2-cpp-template.git
```

Open the cloned repository in the VSCode. There should be a notification at the bottom-right about the successful repository clone, prompting you if you'd like to open it. Otherwise, you can do open the folder manually (`Ctrl+K Ctrl+O`).

Do it from the notification, or manually.

You can open this file in VSCode from the Explorer panel (`Ctrl+Shift+E`) or by using the "Go to File" (`Ctrl+P`) and typing `Readme` -- VSCode will suggest a list of items, and you can open the first one by pressing `Enter`.

#### Install VSCode extensions

In VSCode, open the Extensions tab (`Ctrl+Shift+X`), paste `@recommended` into search and install the extensions under Workspace Recommendations, at least the first three. Alternatively, you can find them by pasting these strings one by one:

- `ms-vscode.cpptools-extension-pack`
- `llvm-vs-code-extensions.vscode-clangd`
- `fougas.msys2`

These are the necessary extensions to work with C++ under VSCode, but I strongly recommend other quality of life extensions, and I advice you to later look on your own, most likely there's an extension and/or setting for every wish you could have. The rest of the recommended list is from my own collection, which I describe in more detail in the last part of this doc.

## Build tools setup

### Install necessary MSys2 packages

Open the Terminal panel in the VSCode (``Ctrl+(Shift)+` (tilde)``). In the top-right corner of the terminal panel there's a drop-down list next to the "New Terminal" button (looks like a plus sign), select the MSYS2 option there. The MSYS2 should open in that panel.

Paste the following lines (as one part) in the terminal and press `Enter`. It will install all the necessary MSYS2 packages; use the default option for every prompt during the process. The later 4 packages are not necessary for the C++ development, but for using graphics (e.g. olc::PixelGameEngine used in this example) and Lua scripting language integration.

```bash
pacman -S \
    base-devel \
    mingw-w64-x86_64-gdb-multiarch \
    mingw-w64-x86_64-tools-git \
    mingw-w64-x86_64-clang-tools-extra \
    mingw-w64-x86_64-cmake \
    \
    mingw-w64-x86_64-libpng \
    mingw-w64-x86_64-freeglut \
    mingw-w64-x86_64-glew \
    mingw-w64-x86_64-lua
```

### Set up CMake tools environment

Open the Command Palette in the VSCode (hotkey: `Ctrl+P`). Type `> cmake kit` and select the `CMake: Edit User-Local CMake Kits` option in the drop-down list.

It should open a file named `cmake-tools-kits.json`. Paste the following contents in the file:

***

<details>
<summary> <code>cmake-tools-kits.json</code> contents </summary>

```json
[
    {
        "name": "MinGW32",
    "preferredGenerator": {"name": "MinGW Makefiles"},
    "environmentVariables": {"PATH": "${command:mingw32.path}"},
    "compilers": {
        "C": "${command:mingw32.cc.exe}",
      "CXX": "${command:mingw32.cxx.exe}",
      "Fortran": "${command:mingw32.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "MinGW64",
    "preferredGenerator": {"name": "MinGW Makefiles"},
    "environmentVariables": {"PATH": "${command:mingw64.path}"},
    "compilers": {
        "C": "${command:mingw64.cc.exe}",
      "CXX": "${command:mingw64.cxx.exe}",
      "Fortran": "${command:mingw64.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "UCRT64",
    "preferredGenerator": {"name": "MinGW Makefiles"},
    "environmentVariables": {"PATH": "${command:ucrt64.path}"},
    "compilers": {
        "C": "${command:ucrt64.cc.exe}",
      "CXX": "${command:ucrt64.cxx.exe}",
      "Fortran": "${command:ucrt64.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "Clang32",
    "preferredGenerator": {"name": "MinGW Makefiles"},
    "environmentVariables": {"PATH": "${command:clang32.path}"},
    "compilers": {
        "C": "${command:clang32.cc.exe}",
      "CXX": "${command:clang32.cxx.exe}",
      "Fortran": "${command:clang32.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "Clang64",
    "preferredGenerator": {"name": "MinGW Makefiles"},
    "environmentVariables": {"PATH": "${command:clang64.path}"},
    "compilers": {
        "C": "${command:clang64.cc.exe}",
      "CXX": "${command:clang64.cxx.exe}",
      "Fortran": "${command:clang64.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "MSYS2",
    "preferredGenerator": {"name": "Unix Makefiles"},
    "environmentVariables": {"PATH": "${command:msys2.path}"},
    "compilers": {
        "C": "${command:msys2.cc.exe}",
      "CXX": "${command:msys2.cxx.exe}",
      "Fortran": "${command:msys2.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "Cygwin32",
    "preferredGenerator": {"name": "Unix Makefiles"},
    "environmentVariables": {"PATH": "${command:cygwin32.path}"},
    "compilers": {
        "C": "${command:cygwin32.cc.exe}",
      "CXX": "${command:cygwin32.cxx.exe}",
      "Fortran": "${command:cygwin32.fc.exe}"
    },
    "keep": true
  },
  {
      "name": "Cygwin64",
    "preferredGenerator": {"name": "Unix Makefiles"},
    "environmentVariables": {"PATH": "${command:cygwin64.path}"},
    "compilers": {
        "C": "${command:cygwin64.cc.exe}",
      "CXX": "${command:cygwin64.cxx.exe}",
      "Fortran": "${command:cygwin64.fc.exe}"
    },
    "keep": true
  }
]
```

</details>

***

**Restart the studio**. Now several prompts should appear: one at the top to select the CMake kit (select `MINGW64`), and one notification at the bottom-right if the clangd should use the executable that is specified by the settings (answer "yes").

### Test the environment

Press `F5` to run the build chain. It should build and run without problems and you'll see a Pixel Game Engine sample project window displaying random noise.

## Migrate C++ settings & further customization

You can migrate settings from this project's to your own settings so this setup persists to new C++ projects.

Open User Settings in VSCode (`Ctrl+, (comma)`) and open them as a file -- there's a button at the top-right to Open Settings (JSON). Copy there all the settings from the `.vscode/settings.json` file.

All customization related places are:

- `.clangd` for static code analysis and error highlighting. E.g., in this project the Narrow Conversion warning is disabled. Further reading here: <https://clangd.llvm.org/config>
- `.clang-format` for style that is held up by autoformatting throughout your code.
- `.vscode/launch.json` controls what launch options are available to you. It is already set up for debugging in vscode with gdb.

## Developement hints

### Debugging is easy

- In projects configured with this template, just press `F5`.
- Place breakpoints (red dots) in `.cpp` files, and program will pause itself at that point in program.
- Debug Panel should show itself but you can bring it up manually with `Ctrl+Shift+B`.
- Set up Watch expressions to evaluate context information, if Variables is not enough.
- `F5` resumes program execution.
- `F10` executes a single line under the pointer.
- `F11` steps into the first function in a line, if any (+1 to call stack).
- `Shift+F11` steps out of the current function, returning to its caller scope (-1 from call stack).

### Autocompletion is your friend

- Autocompletion shows each time you start to type a new token.
- You can summon autocompletion manually by pressing `Ctrl+Space`.
- Pressing `Enter` with autocomplete open, will complete the token with selected suggestion.
- Use arrow keys or mouse to navigate through autocomplete suggestions and select the one you need.
- Typing Capital letters lets you shorten names `VeryLongAndAwkwardClassName` -> `VLAACN`, which autocompletion would usually pick up on the third or fourth letter.

### Autoformatting is also your friend

- Pressing `Shift+Alt+F` formats your code with standard guidelines. `Ctrl+Z` will revert it back.
- You can use it when adding a new block to not spend time manually formatting your code.
- Since `clang-format` rules are pretty strict usually, braces are picked up from anywhere around.
- Watch out if your indentation changes, it probably means you forgot an opening bracket.

### Function argument lists

- When writing a function, an argument list helper is summoned.
- You can navigate overloads with arrow keys.
- If it's lost, an easy way to resummon is to retype the opening round bracket for the argument list.

### Inlay hints

- Clang displays argument names in line with its invocation. It's called "Inlay hints" and you can configure how they are displayed in the editor (although C_cpp extension settings does not affect clangd).

### Improve your Quality of Life

VSCode is powerful enough just as it is, but extensions take it a step further. Here's my go-to list:

- Visual improvements:
  - `jeff-hykin.better-cpp-syntax` - for better C++ syntax
  - `aaron-bond.better-comments` - comment custom colors for specific tags like '`// TODO`'
  - `vscode-icons-team.vscode-icons` - better visual clues for in-built file explorer
  - `itsjonq.owlet` - My go-to night theme is `Owlet (Outrun)`
  - `omagerio.tabsort` - sort tabs by file path, to match Open Editors sort order
  - `McSodbrenner.better-open-editors` - Open Editors that are grouped by folder path
    - setting `"betterOpenEditors.PackagePatterns": "**/*"` to separate files by unique folder paths
- Code assistance:
  - `EditorConfig.EditorConfig` - applies .editorconfig files that are often used to maintain tab and end-of-line styles
  - `DavidAnson.vscode-markdownlint` - markdown formatting
  - `christian-kohler.path-intellisense` - autocompletion for file paths
  - `TabNine.tabnine-vscode` - code and text autocompletion with AI (warning: may decently load your CPU)
  - `gruntfuggly.todo-tree` - find every TODO comment across the codebase
  - `ryu1kn.partial-diff` - compare code parts between each other
    - `Ctrl+A Ctrl+C` select&copy entire of the current file, go to another file, `Ctrl+K Ctrl+C` to compare them
- Utilities integration:
  - `eamodio.gitlens` - add tons of useful git features like line blame, code block authorship, and general UI for repo
  - `donjayamanne.githistory` - git context menu commands like view file history
  - `wakatime.vscode-wakatime` - tracks time you spend on your projects
  - `ms-vsliveshare.vsliveshare` - code together with your friends and collegues

You can improve performance and reduce distraction by disabling all language/platform-specific extensions globally, and turning them on only in relevant folders/workspaces. It is an option in context menu in the Extensions panel.

## Conclusion

Congratulations! You now have a working C++ environment in windows with awesome autocompletion from clangd and automatic build settings managed by CMake. This repository can be a template for your future C++ projects, containing all the necessary settings.

## Special Thanks

This article would be impossible without these

- [How to compile C++ code with VS Code and Clang](https://www.40tude.fr/compile-cpp-code-with-vscode-clang/)
- [Getting Started with Clang and Visual Studio Code on Windows with MSYS2 and MinGW-w64](https://solarianprogrammer.com/2021/06/11/install-clang-windows-msys2-mingw-w64/)
- [MSYS2/Cygwin/MinGW/Clang support](https://marketplace.visualstudio.com/items?itemName=fougas.msys2) extension for VSCode
- <https://github.com/filipdutescu/modern-cpp-template>
