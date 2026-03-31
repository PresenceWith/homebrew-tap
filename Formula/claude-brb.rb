class ClaudeBrb < Formula
  desc "Schedule Claude Code CLI sessions via macOS launchd"
  homepage "https://github.com/PresenceWith/claude-brb"
  url "https://github.com/PresenceWith/claude-brb/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ce37aa936b3e10c1b8c6cce9c52e2e9e1791d805e22495c0dc50d3001563e44b"
  license "MIT"

  depends_on :macos

  def install
    bin.install "claude-brb.sh" => "claude-brb"
    bin.install_symlink "claude-brb" => "brb"
  end

  def caveats
    <<~EOS
      claude-brb requires the Claude Code CLI to be installed.
      Install it via: npm install -g @anthropic-ai/claude-code

      If you have an existing alias for 'ca' in your .zshrc or .bashrc,
      remove it to avoid conflicts with the Homebrew-installed version.
    EOS
  end

  test do
    assert_match "claude-brb", shell_output("#{bin}/claude-brb --version")
  end
end
