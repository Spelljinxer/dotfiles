## windows-notification-state
[SHQueryUserNotificationState](https://msdn.microsoft.com/en-us/library/windows/desktop/bb762242(v=vs.85).aspx), implemented as a native Node addon. If you're looking for a simple solution to check whether or not you should send your user a notification, this is it.

```
npm install windows-notification-state
```

```
const { shQueryUserNotificationState, getNotificationState } = require('windows-notification-state`)

// This will print a number (corresponding with QUERY_USER_NOTIFICATION_STATE)
console.log(shQueryUserNotificationState())

// If you prefer your code to be more readable, you can use the string-based variant.
// This will print the name of the enum (so "QUNS_ACCEPTS_NOTIFICATIONS" instead of 5)
console.log(getNotificationState())
```

#### License
MIT, please see LICENSE for details. Copyright (c) 2017 Felix Rieseberg.
