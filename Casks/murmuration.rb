cask "murmuration" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0-preview.4"
  sha256 arm:   "b870c88e9806f03477b4bfdefc6baa34da94bd2b16d7cb765255437b86dc26fa",
         intel: "7ffe18070d75697387fae1f122d8c860456bff8c08f3eaf932d715fe6a44bd2f"

  url "https://github.com/forgeopslabs/murmuration-releases/releases/download/v#{version}/murmuration-#{version}-macos-#{arch}.zip"
  name "Murmuration"
  desc "Observable, privacy-correct BitTorrent client with GUI, CLI, and TUI"
  homepage "https://github.com/forgeopslabs/murmuration-releases"

  depends_on macos: :big_sur

  app "Murmuration.app"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmur"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmur-tui"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmurd"

  uninstall signal: [
    ["TERM", "org.murmuration-bt.murmuration"],
    ["TERM", "org.murmuration-bt.murmuration.murmurd"],
  ]

  zap trash: [
    "~/Library/Application Support/Murmuration",
    "~/Library/Caches/org.murmuration-bt.murmuration",
    "~/Library/Logs/Murmuration",
    "~/Library/Preferences/org.murmuration-bt.murmuration.plist",
    "~/Library/Saved Application State/org.murmuration-bt.murmuration.savedState",
  ]

  caveats <<~EOS
    This preview is ad-hoc signed and has not been notarized by Apple.
    On first launch, macOS may block it. Open System Settings > Privacy &
    Security and choose Open Anyway for Murmuration. Do not disable Gatekeeper.
  EOS
end
