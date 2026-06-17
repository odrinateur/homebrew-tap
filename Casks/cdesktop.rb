cask "cdesktop" do
  version "1.4.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.4.0/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "647dd11a63563199d9278d02f605edc502b865bc62d3c9675947bc9270e908a5"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.4.0/cdesktop-#{version}-macos-x64.dmg"
    sha256 "59ce3f16f3e853c01b1ba7e1f0f344e785b329eb6214271d1a06dbddba3a6b54"
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
