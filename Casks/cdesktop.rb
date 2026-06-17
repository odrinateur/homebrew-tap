cask "cdesktop" do
  version "1.2.3"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.3/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "ec032480e754dc761512adcc5fc215bc3a0fdad532f252a7f55414c5cecad4a5"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.3/cdesktop-#{version}-macos-x64.dmg"
    sha256 "436a2c598f07a8b5afa7945f3030a6f631af2b102e05c7f8b95451de96ac351b"
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
