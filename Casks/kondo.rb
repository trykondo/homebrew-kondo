cask "kondo" do
  version "1.1.52"
  sha256 "bf84efa250f0573a642de70cb35a249dfef6da2614f1c14c1fdca944afe43db4"

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
