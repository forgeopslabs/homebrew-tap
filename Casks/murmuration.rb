cask "murmuration" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0-preview.2"
  sha256 arm:   "94f55fad0b905c85f8653140524a4da8c2e70422b542f3ac902412f7f98fa28b",
         intel: "b296eb0b4537453e68dc65a1aaf64c922acf91fc4e413bb25b27b3e0f1d996df"

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
