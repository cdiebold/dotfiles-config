import qbs 1.0
import '../QtPlugin.qbs' as QtPlugin

QtPlugin {
    qtModuleName: "qmldbg_profiler"
    Depends { name: "Qt"; submodules: []}

    className: "QQmlProfilerServiceFactory"
    staticLibsDebug: ["z", "m", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PlatformSupport_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PacketProtocol_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Qml_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Network_debug.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Core_debug.a", "z", "qtpcre_debug", "m"]
    staticLibsRelease: ["z", "m", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PlatformSupport.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5PacketProtocol.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Qml.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Network.a", "/Users/chris/Developer/Qt/5.7/ios/lib/libQt5Core.a", "z", "qtpcre", "m"]
    dynamicLibsDebug: []
    dynamicLibsRelease: []
    linkerFlagsDebug: ["-force_load", "/Users/chris/Developer/Qt/5.7/ios/plugins/platforms/libqios_debug.a"]
    linkerFlagsRelease: ["-force_load", "/Users/chris/Developer/Qt/5.7/ios/plugins/platforms/libqios.a"]
    frameworksDebug: ["MobileCoreServices", "Foundation", "UIKit", "CoreFoundation", "Security", "SystemConfiguration"]
    frameworksRelease: ["MobileCoreServices", "Foundation", "UIKit", "CoreFoundation", "Security", "SystemConfiguration"]
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "qmldbg_profiler_debug"
    libNameForLinkerRelease: "qmldbg_profiler"
    libFilePathDebug: "/Users/chris/Developer/Qt/5.7/ios/plugins/qmltooling/libqmldbg_profiler_debug.a"
    libFilePathRelease: "/Users/chris/Developer/Qt/5.7/ios/plugins/qmltooling/libqmldbg_profiler.a"
    cpp.libraryPaths: ["/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib", "/Users/chris/Developer/Qt/5.7/ios/lib"]
    isStaticLibrary: true
}
