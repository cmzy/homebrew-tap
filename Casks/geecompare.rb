cask "geecompare" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "01c5b092de27243ae93adf4991303d20c5221f0fd612735ad46fac7d5a4e6629",
         intel: "b4755ec31fb866c115252de675ccee7eb8dc374b4e56398eebed46b8f815a107"

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
