class Cdesktop < Formula
  desc "Coding-session desktop CLI"
  homepage "https://github.com/odrinateur/cdesktop"
  license "Apache-2.0"
  version "1.2.0"

  on_arm do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.0/cdesktop-#{version}-macos-arm64.tgz"
    sha256 "26de09cadfa0698ce8abef1977353ffc6c43f8594db67d069bfe89922ca9b019"
  end
  on_intel do
    url "https://github.com/odrinateur/cdesktop/releases/download/v1.2.0/cdesktop-#{version}-macos-x64.tgz"
    sha256 "024375c00f138fe43e747a0cc70c77c9e2ea66652429b391a6fb3a1cd0950446"
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
