class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.1.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.1.0/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "a7406100382fbee69d795204836e510fe77853193a8e6726f23bdab7f8f0c8c2"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.1.0/cdesktop-#{version}-macos-x64.tgz"
    sha256 "87c889f6a14c9efbe3976d2e0355ee92228318465b790c2c59d7e3fee27f90eb"
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
