class Engram < Formula
  desc "Local semantic knowledge base with MCP integration for AI coding tools"
  homepage "https://github.com/dgr8akki/engram"
  url "https://github.com/dgr8akki/engram/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "7102f795fedc00a7ab5cc0b1e34f4125024d95ff7cbdb2cf70b5c0d8580818ee"
  license "MIT"
  head "https://github.com/dgr8akki/engram.git", branch: "main"

  depends_on "python@3.12"

  def install
    # Isolated venv under libexec so Engram's deps don't touch the system Python
    venv = libexec/"venv"
    system "python3.12", "-m", "venv", venv
    system "#{venv}/bin/pip", "install", "--quiet", "--upgrade", "pip"
    system "#{venv}/bin/pip", "install", "--quiet", "-r", "requirements.txt"

    # Copy all runtime files into libexec
    libexec.install Dir["*.py", "*.yaml"]
    libexec.install "skill"
    libexec.install "scripts"

    # Wrapper so `engram` in PATH uses the venv Python
    (bin/"engram").write <<~BASH
      #!/bin/bash
      exec "#{libexec}/venv/bin/python3" "#{libexec}/engram_cli.py" "$@"
    BASH
  end

  def post_install
    # Initialise the database and wire up MCP + skill + hooks for detected tools.
    # Non-fatal — user may not have any AI coding tools installed yet.
    quiet_system bin/"engram", "init"
    quiet_system bin/"engram", "install"
  end

  def caveats
    <<~EOS
      Engram is installed and has been configured for any AI coding tools detected
      on your system (Claude Code, Cursor, Antigravity, Windsurf).

      If setup didn't complete or you install a new tool later:
        engram install

      To start the HTTP REST server (port 7823):
        engram serve

      To start the HTTP server automatically at every login (macOS LaunchAgent):
        engram autostart install

      To disable autostart:
        engram autostart remove

      Restart your IDE/AI tool to activate the MCP server, skill, and hooks.
    EOS
  end

  test do
    system bin/"engram", "--help"
  end
end
