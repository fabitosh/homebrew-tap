class Tailcloak < Formula
  desc "Toggle Tailscale based on trusted default-gateway MAC addresses (macOS)"
  homepage "https://github.com/fabitosh/tailcloak"
  url "https://github.com/fabitosh/tailcloak/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "78f280cecdf9c9aa1b30dad73fe8fa42c75c4c7c5012091152020271ccffc1f2"
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
