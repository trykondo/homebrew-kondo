cask "kondo" do
  version "1.2.49"
  sha256 "8b7090738afb7f358e838d8f12b77a8c6f1083357f1237ef9220dd95135a96b2"

  url "https://releases.trykondo.com/desktop/Kondo_#{version}_universal.dmg"
  name "Kondo"
  desc "Inbox manager for messaging accounts"
  homepage "https://www.trykondo.com/"

  livecheck do
    url "https://releases.trykondo.com/desktop/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "Kondo.app"

  uninstall quit: "com.trykondo.desktop"

  zap trash: [
    "~/Library/Application Support/com.trykondo.desktop",
    "~/Library/Caches/com.trykondo.desktop",
    "~/Library/HTTPStorages/com.trykondo.desktop",
    "~/Library/Preferences/com.trykondo.desktop.plist",
    "~/Library/Saved Application State/com.trykondo.desktop.savedState",
    "~/Library/WebKit/com.trykondo.desktop",
  ]
end
