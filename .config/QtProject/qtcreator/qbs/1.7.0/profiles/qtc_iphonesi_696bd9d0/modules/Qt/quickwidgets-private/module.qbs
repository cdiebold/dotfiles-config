import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "QuickWidgets"
    Depends { name: "Qt"; submodules: ["core-private", "gui-private", "qml-private", "quick-private", "widgets-private", "quickwidgets"]}

    hasLibrary: false
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: ""
    libNameForLinkerRelease: ""
    libFilePathDebug: ""
    libFilePathRelease: ""
    cpp.defines: []
    cpp.includePaths: ["/Users/chris/Developer/Qt/5.7/ios/include/QtQuickWidgets/5.7.1", "/Users/chris/Developer/Qt/5.7/ios/include/QtQuickWidgets/5.7.1/QtQuickWidgets"]
    cpp.libraryPaths: []
    isStaticLibrary: true
}
