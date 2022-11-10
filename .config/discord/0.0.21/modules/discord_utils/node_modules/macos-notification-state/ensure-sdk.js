const { execSync } = require("child_process");

console.log(
  `Trying to ensure that you have the right SDK version (> 11.0) to build this package. We'll run "xcrun --show-sdk-version" and compare the output. To disable this check, set the environment variable MACOS_NOTIFICATION_STATE_NO_SDK_CHECK`
);

function check() {
  if (process.env.MACOS_NOTIFICATION_STATE_NO_SDK_CHECK || process.platform !== "darwin") {
    return;
  }

  const result = parseFloat(
    execSync("xcrun --show-sdk-version").toString().trim()
  );

  if (result < 11) {
    throw new Error(
      `You do not have the required minimum macOS SDK. Version found: ${result}`
    );
  }

  console.log(`Test passed, found ${result}`);
}

check();
