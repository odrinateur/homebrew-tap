cask "cdesktop" do
  version "1.2.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.0/cdesktop-#{version}-macos-arm64.dmg"
    sha256 "fd3cae99975880341ad429e7269538978b8784e431ee49e545e07017d3c591e1"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.0/cdesktop-#{version}-macos-x64.dmg"
    sha256 "cc52d603558abd92d0d6602a5b48ed6b4c10e2d22b4ee8cf40de05e508560773"
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
