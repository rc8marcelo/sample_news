# News++

## Summary
A sample Flutter project that uses:
* `go_router` for routing
* `flutter_bloc` for state management
* `dio` + `retrofit` for network API calls
* `freezed` and `equatable` to complete the architecture
* `animations` and `flutter_animate` for animations


## Setting up

1. Go to [newsapi.org](https://newsapi.org/) and create an account.
2. Get your API key from [the account page](https://newsapi.org/account).
3. Create a `.env` file at the root of the project (same level as lib folder).
4. Add `NEWS_API_KEY = 'yourApiKeyHere'` to the file and save.
5. Run `flutter pub get` 
6. Run `flutter pub run build_runner build`
7. Run the application.


