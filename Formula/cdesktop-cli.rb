class CdesktopCli < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.5.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.5.0/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "86d1c2540fdfbf5f76c04df3a2cccc1a2db75aed0c4a28b1a933cd8914c0f01d"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.5.0/cdesktop-#{version}-macos-x64.tgz"
    sha256 "e879b9c189ee0c22e24d9a7c85989dd78eed123abd821aa2ab52eb1884f77412"
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"cdesktop").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/cli.js" "$@"
    EOS
    (bin/"cdesktop").chmod 0755
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cdesktop --version")
  end
end
