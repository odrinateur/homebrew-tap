cask "altaltab" do
  version "10.15.1"
  sha256 "182ffdb4b3a5d468bbc8f8b13070f7c4ff207a07a76c401497dfef862be700db"

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
