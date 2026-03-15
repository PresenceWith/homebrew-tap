class ClaudeAt < Formula
  desc "Schedule Claude Code CLI sessions via macOS launchd"
  homepage "https://github.com/PresenceWith/claude-at"
  url "https://github.com/PresenceWith/claude-at/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "7fd6699a806289b924933345106c407a718f8d31ee2f7a2d4cede38be633279b"
  license "MIT"

  depends_on :macos

  def install
    bin.install "claude-at.sh" => "claude-at"
    bin.install_symlink "claude-at" => "ca"
  end

  def caveats
    <<~EOS
      claude-at requires the Claude Code CLI to be installed.
      Install it via: npm install -g @anthropic-ai/claude-code

      If you have an existing alias for 'ca' in your .zshrc or .bashrc,
      remove it to avoid conflicts with the Homebrew-installed version.
    EOS
  end

  test do
    assert_match "claude-at", shell_output("#{bin}/claude-at --version")
  end
end
