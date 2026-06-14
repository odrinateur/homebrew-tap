cask "cdesktop" do
  version "1.1.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.1.0/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "ad85d5641a2f05de7dea42177cbef8ac7b16245aee5b3a45be0d6f1e9a3f0c2f"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.1.0/cdesktop-#{version}-macos-x64.dmg"
    sha256 "16f2169b804a18ce0347afee239d4e3e89896ab78a029470904c0df2e1826350"
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
