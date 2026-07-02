class Eia < Formula
  desc "Enterprise Impact Analyzer for Terraform / OpenTofu plans"
  homepage "https://github.com/sudo-Oliver/Impact-Analyzer"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sudo-Oliver/Impact-Analyzer/releases/download/v0.1.0/eia-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b5079cf7a1cf51fe8a1ae9caa9876bece4a00af6b1bd9a6ed558ca2be001cc2d"
    else
      url "https://github.com/sudo-Oliver/Impact-Analyzer/releases/download/v0.1.0/eia-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c036e89271a316c123598a43411ab85ac2d2d2a98615a828caa7c6ef75950f63"
    end
  end

  on_linux do
    url "https://github.com/sudo-Oliver/Impact-Analyzer/releases/download/v0.1.0/eia-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7021ef6b737d4e67c72fc68e2ef54c56348a926f902f87366ac0e12604ab7479"
  end

  def install
    bin.install "eia"
  end

  test do
    system "#{bin}/eia", "--version"
  end
end
