class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.0.1"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.0.1/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "fe7a250522cdf8a0b468d6a902c7a3e2dcb33a9830548ead8e008aa802ca68da"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.0.1/cdesktop-#{version}-macos-x64.tgz"
    sha256 "ff20757237ddccf192a9c1d1524d932f99265efb291c4048998195bc7fa15462"
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
