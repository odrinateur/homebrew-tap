cask "cdesktop" do
  version "1.0.1"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.0.1/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "caa202b487d7047c941de9a3b8c9616fcab5d55d043af516672d6a9e29f2adb8"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.0.1/cdesktop-#{version}-macos-x64.dmg"
    sha256 "3d75ed94b83257560ed5c9c041acdee2995bfa378cbf5b342e7172df814115ff"
  end

  name "cdesktop"
  desc "Coding-session desktop environment"
  homepage "https://github.com/odrinateur/cdesktop"

  app "cdesktop.app"

  zap trash: [
    "~/Library/Application Support/cdesktop",
    "~/Library/Preferences/cdesktop.plist",
    "~/Library/Caches/cdesktop",
  ]
end
