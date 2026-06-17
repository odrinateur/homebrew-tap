cask "cdesktop" do
  version "1.3.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.3.0/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "f78ad202044b689eb3cd0f93db90313c127346dcddae9db214449355a0cc3b0d"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.3.0/cdesktop-#{version}-macos-x64.dmg"
    sha256 "6f8ab66aafdfe3f2ea9f47774f02d5d234a81aed1feff5ddc731546e0b690e66"
  end

  name "cdesktop"
  desc "Coding-session desktop environment"
  homepage "https://github.com/odrinateur/cdesktop"

  app "cdesktop.app"

  # The app is ad-hoc signed but not notarized (no Apple Developer ID).
  # Strip the quarantine flag Homebrew adds on download so Gatekeeper does
  # not reject it with "cdesktop.app is damaged and can't be opened".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/cdesktop.app"]
  end

  zap trash: [
    "~/Library/Application Support/cdesktop",
    "~/Library/Preferences/cdesktop.plist",
    "~/Library/Caches/cdesktop",
  ]
end
