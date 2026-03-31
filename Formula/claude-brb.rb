class ClaudeBrb < Formula
  desc "Schedule Claude Code CLI sessions via macOS launchd"
  homepage "https://github.com/PresenceWith/claude-brb"
  url "https://github.com/PresenceWith/claude-brb/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "6bcbec614a8e0a38f6c3c0bfda5eee7f97991cfa5c22998f7d4a39d0e1805c11"
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
