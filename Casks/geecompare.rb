cask "geecompare" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "80e4b0ef9e312fffda762a6c194f4751acbe16c3f3cef9ddbe4a335483f22a8e",
         intel: "3545066943199f871e07d4335ec3f8d853a1b9b25d5bf86ebf2f60fc4364ff43"

  url "https://github.com/cmzy/geecompare/releases/download/v#{version}/GeeCompare_#{arch}.dmg",
      verified: "github.com/cmzy/geecompare/"
  name "GeeCompare"
  desc "Compare and merge folders, text, tables, pictures and more"
  homepage "https://github.com/cmzy/geecompare"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No `auto_updates`: `brew upgrade` upgrades GeeCompare like any cask. The app also updates
  # itself; brew, which does not see that, then reinstalls the version already running.
  depends_on macos: ">= :monterey"

  app "GeeCompare.app"
  binary "#{appdir}/GeeCompare.app/Contents/MacOS/geecompare"

  zap trash: [
    "~/Library/Application Support/app.geecompare.GeeCompare",
    "~/Library/Caches/app.geecompare.GeeCompare",
    "~/Library/Logs/GeeCompare",
    "~/Library/Preferences/app.geecompare.GeeCompare.plist",
    "~/Library/Saved Application State/app.geecompare.GeeCompare.savedState",
  ]
end
