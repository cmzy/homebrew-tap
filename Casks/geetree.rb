cask "geetree" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "b053c2470f9f4767971c43b23be55971d96c1ed33ccf22daa11e4259948a8321",
         intel: "2bd45dfbbe3d3e132f3ade4f41f2f65defd137a0454c7781b6ac12c0e97f26a7"

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
