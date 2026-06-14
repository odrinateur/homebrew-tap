cask "altaltab" do
  version "10.15.2"
  sha256 "5c8d7c849c5121d7c52066baf0d0e97316391f5bb3b5b63031bcd7a3a619a7a8"

  url "https://github.com/odrinateur/alt-alt-tab-macos/releases/download/v#{version}/AltAtlTab-#{version}.zip",
      verified: "github.com/odrinateur/alt-alt-tab-macos/"
  name "AltAtlTab"
  desc "Windows-like alt-tab for macOS (AltTab fork)"
  homepage "https://github.com/odrinateur/alt-alt-tab-macos"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on :macos

  app "AltAtlTab.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AltAtlTab.app"],
                   must_succeed: false
  end

  uninstall quit: "com.local.altatltab"

  zap trash: [
    "~/Library/Application Support/com.local.altatltab",
    "~/Library/Caches/com.local.altatltab",
    "~/Library/HTTPStorages/com.local.altatltab",
    "~/Library/Preferences/com.local.altatltab.plist",
    "~/Library/LaunchAgents/com.local.altatltab.plist",
  ]
end
