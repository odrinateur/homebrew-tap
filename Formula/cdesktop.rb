class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.2.3"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.3/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "f6163c8d9f70bac3d6d49c7f70ee2e1ae0f160b7b2dcf3e2e3487482a1716df8"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.3/cdesktop-#{version}-macos-x64.tgz"
    sha256 "b105a22d938661a48e4df44f32b9fc34794b9e58acada11d8e5a9cd84d9ab81c"
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
