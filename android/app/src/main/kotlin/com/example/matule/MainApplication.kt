package com.example.matule
import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
  override fun onCreate() {
    super.onCreate()
    // MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
    // MapKitFactory.setApiKey("YOUR_API_KEY") // Your generated API key
  }
}