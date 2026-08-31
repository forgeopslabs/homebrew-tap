cask "murmuration" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0-preview.3"
  sha256 arm:   "2a42f7d7713ba80a1ba1258b0ea20889b89b0b03878bc69bd13044d71eb68e61",
         intel: "b2118b2941c4a0ba66634751452fa8737f8f5d8ce0cc3bec7dc5f8ed39077393"

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
