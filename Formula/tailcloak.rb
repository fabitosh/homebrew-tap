class Tailcloak < Formula
  desc "Toggle Tailscale based on trusted default-gateway MAC addresses (macOS)"
  homepage "https://github.com/fabitosh/tailcloak"
  url "https://github.com/fabitosh/tailcloak/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a3d53a44fc9ff86f69c8464996bafa62aafa5ed40a8ccaabd37486cef02b70a0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/fabitosh/tailcloak.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      tailcloak runs as a per-user LaunchAgent. To install and start it:
        tailcloak service install

      To trust the current network's gateway:
        tailcloak trust-current

      See `tailcloak --help` for all commands.
    EOS
  end

  test do
    assert_match "tailcloak #{version}", shell_output("#{bin}/tailcloak --version")
  end
end
