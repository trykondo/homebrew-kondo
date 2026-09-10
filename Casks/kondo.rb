cask "kondo" do
  version "1.1.19"
  sha256 "9a250120b10eed781be3608964b4bcd1ef56b5fe42a6639b0d7865683089db7d"

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
  depends_on macos: :catalina

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
