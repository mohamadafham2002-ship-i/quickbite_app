QUICKBITE - HOW TO USE THIS ZIP
=================================

You already ran `flutter create quickbite_app` and opened it in VS Code.
This zip contains ONLY the files you need to add/replace inside that project.

STEPS:

1. Open pubspec_dependencies_ADD_THIS.yaml in this zip.
   Copy the "provider: ^6.1.2" line into YOUR project's pubspec.yaml
   (under the existing "dependencies:" section), matching the indentation.
   Save, then run: flutter pub get

2. Copy the "lib" folder from this zip into YOUR project folder,
   REPLACING your existing lib folder (it currently only has main.dart
   with the default counter app - that's fine, this replaces it).

   Your project structure should end up like:
   quickbite_app/
     lib/
       main.dart
       models/
         menu_item.dart
         cart_item.dart
       providers/
         cart_provider.dart
       screens/
         splash_screen.dart
         login_screen.dart
         home_screen.dart
         item_detail_screen.dart
         cart_screen.dart
         order_confirmation_screen.dart
         order_tracking_screen.dart
         profile_screen.dart

3. In VS Code, make sure an Android emulator is selected (bottom-right),
   then press F5 (or run `flutter run` in the terminal).

4. You should see: Splash screen (2 sec) -> Login screen -> tap
   "Continue as Guest" or "Login" -> Home screen with menu grid,
   search bar, and category filter chips -> tap any item -> Detail
   screen with quantity selector -> Add to Cart -> Cart screen with
   subtotal -> Checkout -> Order Confirmation with random order ID ->
   Track Order -> Order Status screen that auto-advances through
   Placed -> Preparing -> Ready for pickup over ~6 seconds.

   Profile screen is reachable via the person icon on the Home app bar.

If you hit an error, copy the exact red error text from the terminal
and share it - that's the fastest way to fix it.
