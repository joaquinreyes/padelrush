# Keep uni_links package
-keep class io.flutter.plugins.** { *; }
-keep class com.padelrush.bookandgo.** { *; }


# Keep components with intent filters declared in the manifest
-keep class * {
 public void onReceive(android.content.Context, android.content.Intent);
}

