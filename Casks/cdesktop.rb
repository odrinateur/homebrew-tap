cask "cdesktop" do
  version "1.2.2"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.2/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "e8cc94f62176e0202915f864f14ca86920467296ef30f61210b5e8e4ccaddc47"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.2/cdesktop-#{version}-macos-x64.dmg"
    sha256 "b519f584b80d5cdd6d6135730d3034b935c22bd48d1ea9be87b905fea85655c4"
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
