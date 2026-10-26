cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "cbca62b48b8e89fa0d40640f5758a82d85359bd91baf20485d64d13022621826",
         intel: "14310bbc2fce52b5672b9e9453af9f702eb6f62e4183a78eee3c6196ea8681f6"

  url "https://github.com/cmzy/geetree/releases/download/v#{version}/GeeTree_#{arch}.dmg",
      verified: "github.com/cmzy/geetree/"
  name "GeeTree"
  desc "Pure-GPU-rendered, professional Git client"
  homepage "https://geetree.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No `auto_updates`: `brew upgrade` upgrades GeeTree like any cask. The app also updates
  # itself; brew, which does not see that, then reinstalls the version already running.
  depends_on macos: :monterey

  app "GeeTree.app"

  zap trash: [
    "~/Library/Application Support/dev.geetree.GeeTree",
    "~/Library/Caches/dev.geetree.GeeTree",
    "~/Library/Preferences/dev.geetree.GeeTree.plist",
    "~/Library/Saved Application State/dev.geetree.GeeTree.savedState",
  ]
end
