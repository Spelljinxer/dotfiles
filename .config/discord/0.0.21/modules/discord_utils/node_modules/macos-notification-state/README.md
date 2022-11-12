## macos-notification-state
Do you want to check if you should display a notification to your user on macOS? This native module checks if the user is active, if the screen is locked, or if "do not disturb" is enabled.

```
npm install macos-notification-state
```

```
const { getNotificationState, getSessionState, getDoNotDisturb } = require('macos-notification-state`)

// This will brint a boolean (true if enabled, false if not)
console.log(getDoNotDisturb())

// This will print a string indiciating the current state, being one of the following:
// 'SESSION_SCREEN_IS_LOCKED'
// 'SESSION_ON_CONSOLE_KEY'
// 'DO_NOT_DISTURB'
// 'UNKNOWN'
// 'UNKNOWN_ERROR'
//
// If "do not disturb" is enabled, it takes precedence.
console.log(getNotificationState())

// This will print a string indiciating the current session state, being one of the following:
// 'SESSION_SCREEN_IS_LOCKED'
// 'SESSION_ON_CONSOLE_KEY'
// 'UNKNOWN'
console.log(getSessionState())
```

## Not working?

This package _needs_ to be compiled with at least the macOS 11.0 SDK. If not, the internal
operating system info will always return 10.16, rendering the package unusable.

To see the current version, run `xcrun --show-sdk-version`.

#### License
MIT, please see LICENSE for details. Copyright (c) 2019 Felix Rieseberg.
