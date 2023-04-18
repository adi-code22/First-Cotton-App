# Add project specific ProGuard rules here.
## You can control the set of applied configuration files using the
## proguardFiles setting in build.gradle.
##
## For more details, see
##   http://developer.android.com/guide/developing/tools/proguard.html
#
## If your project uses WebView with JS, uncomment the following
## and specify the fully qualified class name to the JavaScript interface
## class:
##-keepclassmembers class fqcn.of.javascript.interface.for.webview {
##   public *;
##}
#
## Uncomment this to preserve the line number information for
## debugging stack traces.
##-keepattributes SourceFile,LineNumberTable
#
## If you keep the line number information, uncomment this to
## hide the original source file name.
##-renamesourcefileattribute SourceFile
#
#
#-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
#-optimizationpasses 5
#-allowaccessmodification
#
#-dontusemixedcaseclassnames
#-dontskipnonpubliclibraryclasses
#-verbose
#
## Preserve some attributes that may be required for reflection.
#-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod
#
#-dontnote com.android.vending.licensing.ILicensingService
#-dontnote com.google.vending.licensing.ILicensingService
#-dontnote com.google.android.vending.licensing.ILicensingService
#
## For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
#-keepclasseswithmembernames class * {
#    native <methods>;
#}
#
## Keep setters in Views so that animations can still work.
#-keepclassmembers public class * extends android.view.View {
#    void set*(***);
#    *** get*();
#}
#
## We want to keep methods in Activity that could be used in the XML attribute onClick.
#-keepclassmembers class * extends android.app.Activity {
#    public void *(android.view.View);
#}
#
## For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
#-keepclassmembers enum * {
#    public static **[] values();
#    public static ** valueOf(java.lang.String);
#}
#
#-keepclassmembers class * implements android.os.Parcelable {
#    public static final ** CREATOR;
#}
#
#-keepclassmembers class **.R$* {
#    public static <fields>;
#}
#
## Preserve annotated Javascript interface methods.
#-keepclassmembers class * {
#    @android.webkit.JavascriptInterface <methods>;
#}
#
## The support libraries contains references to newer platform versions.
## Don't warn about those in case this app is linking against an older
## platform version. We know about them, and they are safe.
#-dontnote android.support.**
#-dontnote androidx.**
#-dontwarn android.support.**
#-dontwarn androidx.**
#
## This class is deprecated, but remains for backward compatibility.
#-dontwarn android.util.FloatMath
#
## Understand the @Keep support annotation.
#
#-keep class androidx.annotation.Keep
#
#
#-keep @androidx.annotation.Keep class * {*;}
#
#
#-keepclasseswithmembers class * {
#    @androidx.annotation.Keep <methods>;
#}
#
#
#-keepclasseswithmembers class * {
#    @androidx.annotation.Keep <fields>;
#}
#
#
#
#-keepclasseswithmembers class * {
#    @androidx.annotation.Keep <init>(...);
#}
#
## These classes are duplicated between android.jar and org.apache.http.legacy.jar.
#-dontnote org.apache.http.**
#-dontnote android.net.http.**
#
## These classes are duplicated between android.jar and core-lambda-stubs.jar.
#-dontnote java.lang.invoke.**
#


-dontwarn com.google.firebase.messaging.TopicOperation$TopicOperations