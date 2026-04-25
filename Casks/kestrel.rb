cask "kestrel" do
  version "0.1.0"
  sha256 "fa20a1f876c90a21f29c709737f999388741964eadb1fb84bbf17948209140cb"

  url "https://github.com/dgr8akki/kestrel/releases/download/v#{version}/Kestrel-#{version}.zip"
  name "Kestrel"
  desc "Local menu-bar recorder for USB-C HDMI capture cards"
  homepage "https://github.com/dgr8akki/kestrel"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Kestrel.app"

  # The app is ad-hoc codesigned, not Apple-notarised, so Gatekeeper would
  # block it on first launch. Strip the quarantine xattr that Homebrew sets
  # on downloaded artefacts so the app opens cleanly. The tradeoff is
  # documented in `caveats` below.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Kestrel.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/dev.dgr8akki.Kestrel",
    "~/Library/Preferences/dev.dgr8akki.Kestrel.plist",
    "~/Library/Saved Application State/dev.dgr8akki.Kestrel.savedState",
  ]

  caveats <<~EOS
    Kestrel is ad-hoc codesigned (not Apple-notarised). This cask removes
    the quarantine attribute on install so it opens without a Gatekeeper
    warning. Recordings land in ~/Movies/Kestrel/ by default.

    On first launch, grant Camera (and optionally Microphone) access in
    System Settings → Privacy & Security so Kestrel can read your USB-C
    capture card.
  EOS
end
