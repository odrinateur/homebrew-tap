class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.2.2"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.2/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "b5694ae370c0570743720e4b737e54f2a6d0fbd23c0fb3280510df602caef244"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.2/cdesktop-#{version}-macos-x64.tgz"
    sha256 "5393d5e8ef10e50fe7647b0e83958112f06052ed76c68f7c93728a2f90acaee0"
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
