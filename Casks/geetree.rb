cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.6"
  sha256 arm:   "469ad17bdab5a6ee4fb43f2800eab45524a8e72370bb79e1c0f9b4529e3a0a76",
         intel: "52b805f4c13ce88e5bb35f6ee4fcab1b520acc35eb04a1ec7cb34cf8fd2e2420"

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
