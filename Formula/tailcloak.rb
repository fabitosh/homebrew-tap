class Tailcloak < Formula
  desc "Automate Tailscale state and exit node per network (macOS)"
  homepage "https://github.com/fabitosh/tailcloak"
  url "https://github.com/fabitosh/tailcloak/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7b2dba66be577553050054403201457d72c48d16f1f2061b9b589a84c3d3f34b"
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
