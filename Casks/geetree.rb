cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "8a5fd97306d214c61a30948e66672cbfb08840f8c5014a70d0afb80539ba78da",
         intel: "6a0c5dbd8ac188a46ff3a3fc72481adec09b60b13a8a7924daa2a8efa281cb65"

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
