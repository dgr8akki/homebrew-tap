class ClaudeTabWatcher < Formula
  desc "Color iTerm2 tabs amber when Claude Code is waiting on you"
  homepage "https://github.com/dgr8akki/claude-tab-watcher"
  url "https://github.com/dgr8akki/claude-tab-watcher/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dd2dbadce91e22e431712d3540c714134201bed8818a6031f040b5a485656148"
  license "MIT"

  depends_on "jq"
  depends_on "terminal-notifier"
  depends_on :macos

  def install
    pkgshare.install "claude-tab-watcher.plugin.zsh", "lib", "hooks", "bin"
  end

  def caveats
    <<~EOS
      Add this line to your ~/.zshrc (before any plugin manager loads, if applicable):

        source #{opt_pkgshare}/claude-tab-watcher.plugin.zsh

      Then open a new iTerm2 tab. The plugin auto-registers its hooks in
      ~/.claude/settings.json on first load. Re-run manually with
      `ctw-install-hooks`, remove with `ctw-uninstall-hooks`.

      Requires iTerm2 and Claude Code.
    EOS
  end

  test do
    assert_predicate pkgshare/"claude-tab-watcher.plugin.zsh", :exist?
    assert_predicate pkgshare/"lib/tab.zsh", :exist?
    assert_predicate pkgshare/"hooks/on-waiting.sh", :exist?
    assert_predicate pkgshare/"hooks/on-working.sh", :exist?
    assert_predicate pkgshare/"bin/ctw-focus", :exist?
  end
end
