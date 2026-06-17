class CdesktopCli < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.4.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.4.0/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "1f380c6b15c5fc0451842cdc3a815068c73d54bf8765c94d2ac6d8cffcb4c28a"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.4.0/cdesktop-#{version}-macos-x64.tgz"
    sha256 "a6333ea380efa8141801ff03d5443c5d2ca48c1389dd6f199cf8857df4402a20"
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
