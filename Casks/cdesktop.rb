cask "cdesktop" do
  version "1.2.1"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.1/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "1c54ba58917e813730e64e3b2cda43e2909352b8e9095bbae18b36fa0e626056"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.1/cdesktop-#{version}-macos-x64.dmg"
    sha256 "9aff500be6d0d312cf93a0558466dc56f7378fcc1dcc5dbf04a38bab1e7bc8ce"
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
