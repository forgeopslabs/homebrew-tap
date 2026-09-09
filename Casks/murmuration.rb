cask "murmuration" do
  version "0.1.0-preview.20"
  sha256 "80c66c9cfe87a3b78992379ca1ba7102cf47b2c13667a2d7f7381f1e35393f64"

  url "https://github.com/forgeopslabs/murmuration-releases/releases/download/v#{version}/murmuration-#{version}-macos-arm64.zip"
  name "Murmuration"
  desc "Observable, privacy-correct BitTorrent client with GUI, CLI, and TUI"
  homepage "https://github.com/forgeopslabs/murmuration-releases"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Murmuration.app"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmur"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmur-tui"
  binary "#{appdir}/Murmuration.app/Contents/Resources/bin/murmurd"

  uninstall script: {
    executable: RbConfig.ruby,
    args:       ["#{appdir}/Murmuration.app/Contents/Resources/uninstall.rb",
                 "--app", "#{appdir}/Murmuration.app",
                 "--homebrew-script", "#{HOMEBREW_LIBRARY_PATH}/brew.rb"],
    sudo:       false,
  }

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
