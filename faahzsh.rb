class Faahzsh < Formula
  desc "Zsh/Bash plugin that plays a faaaah sound when a command fails"
  homepage "https://github.com/dgr8akki/faahzsh"
  url "https://github.com/dgr8akki/faahzsh/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  license "MIT"

  def install
    prefix.install "faahzsh.plugin.zsh"
    prefix.install "faahzsh.plugin.bash"
    prefix.install "sounds"
  end

  def caveats
    <<~EOS
      To activate faahzsh, run ONE of the following (once) for your shell:

      zsh:
        echo 'source #{opt_prefix}/faahzsh.plugin.zsh' >> ~/.zshrc && source ~/.zshrc

      bash:
        echo 'source #{opt_prefix}/faahzsh.plugin.bash' >> ~/.bashrc && source ~/.bashrc
    EOS
  end

  test do
    assert_predicate prefix/"faahzsh.plugin.zsh", :exist?
    assert_predicate prefix/"faahzsh.plugin.bash", :exist?
    assert_predicate prefix/"sounds/faaaah.wav", :exist?
  end
end
