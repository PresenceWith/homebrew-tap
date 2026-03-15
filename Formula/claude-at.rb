class ClaudeAt < Formula
  desc "Schedule Claude Code CLI sessions via macOS launchd"
  homepage "https://github.com/PresenceWith/claude-at"
  url "https://github.com/PresenceWith/claude-at/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "6287c6810f9014bc38cd64b3c46454c9aa3f3b4bf81f79dde5a194841e8ef34d"
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
