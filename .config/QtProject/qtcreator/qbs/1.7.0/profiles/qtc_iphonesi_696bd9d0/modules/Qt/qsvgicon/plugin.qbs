import qbs 1.0
import '../QtPlugin.qbs' as QtPlugin

QtPlugin {
    qtModuleName: "qsvgicon"
    Depends { name: "Qt"; submodules: []}

    className: "QSvgIconPlugin"
    staticLibsDebug: ["z", "m", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PlatformSupport_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Svg_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Widgets_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Gui_debug.a", "qtpng_debug", "qtharfbuzzng_debug", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Core_debug.a", "z", "qtpcre_debug", "m"]
    staticLibsRelease: ["z", "m", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PlatformSupport.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Svg.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Widgets.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Gui.a", "qtpng", "qtharfbuzzng", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Core.a", "z", "qtpcre", "m"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: ["-force_load", "/Users/chris/Developer/Qt/5.7/ios/plugins/platforms/libqios_debug.a"]
    linkerFlagsRelease: ["-force_load", "/Users/chris/Developer/Qt/5.7/ios/plugins/platforms/libqios.a"]
    frameworksDebug: ["MobileCoreServices", "Foundation", "UIKit", "CoreFoundation", "CoreText", "CoreGraphics", "OpenGLES"]
    frameworksRelease: ["MobileCoreServices", "Foundation", "UIKit", "CoreFoundation", "CoreText", "CoreGraphics", "OpenGLES"]
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "qsvgicon_debug"
    libNameForLinkerRelease: "qsvgicon"
    libFilePathDebug: "/Users/chris/Developer/Qt/5.7/ios/plugins/iconengines/libqsvgicon_debug.a"
    libFilePathRelease: "/Users/chris/Developer/Qt/5.7/ios/plugins/iconengines/libqsvgicon.a"
    cpp.libraryPaths: ["/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib"]
    isStaticLibrary: true
}
