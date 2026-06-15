class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.2.1"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.1/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "406013a1f93140d4d7e7e51bae40a5a4aec4c15a9ee769d61e130b0d94cfb767"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.1/cdesktop-#{version}-macos-x64.tgz"
    sha256 "ebbd53b54ced410323f8f68062e089beab293650fddc5e8775c594648ae16102"
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
