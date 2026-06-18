cask "cdesktop" do
  version "1.5.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.5.0/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "12d509e5d1efb98e3ab1a399c7961efa92fae6efe9dd8947cca0b29be78c39ab"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.5.0/cdesktop-#{version}-macos-x64.dmg"
    sha256 "fb6df1df8c627e327f7511f54712a827c261c9c1638885753335414f808e942b"
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
