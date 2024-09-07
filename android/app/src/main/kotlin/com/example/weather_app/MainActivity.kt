package com.example.weather_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.util.Log


class MainActivity: FlutterActivity() {
    private val channel = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->

            if (call.method == "passDataToNative") {
                // Your code here
                val arguments = call.arguments as List<Map<String, Any>>
                val userName = arguments.first()["text"] as String
               println( "Received userName::: $userName")
                result.success("Received userName::: $userName")
               
            } else {
                result.notImplemented()
            }
        }
    }
}