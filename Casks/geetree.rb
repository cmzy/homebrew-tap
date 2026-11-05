cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "934ec14fe7ac82f14b150b24ae19dd532ed50d53067269ef4826db6cd975e03e",
         intel: "f9141206a1f87d15fd1d95eca1f998a38dff1d880a45e6b825f95ddf568063a1"

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
