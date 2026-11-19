cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "624ff67c5b77953890fa205365f5e69177c2d921af50f43598466f3cf8a3ee6b",
         intel: "13c8f5a56325437090df348d7a5ceab31e2e6978680252dfb558f7c109026bd5"

  url "https://github.com/cmzy/geetree/releases/download/v#{version}/GeeTree_#{arch}.dmg"
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
