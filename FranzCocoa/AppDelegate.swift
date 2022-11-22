import Cocoa
import Foundation
import NoiseBackend
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  private lazy var updater = AutoUpdater()

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    updater.start(withInterval: 3600 * 4) { changes, version in
      WindowManager.shared.showUpdatesWindow(withChangelog: changes, andRelease: version)
    }

    FutureUtil.set(defaultErrorHandler: Error.alert(withError:))
    assert(Error.wait(Backend.shared.ping()) == "pong")
    WindowManager.shared.showWelcomeWindow()
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    WindowManager.shared.removeAllWorkspaces()
    Error.wait(Backend.shared.closeAllWorkspaces())
  }

  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  @IBAction func didPushWelcomeToFranzButton(_ sender: Any) {
    WindowManager.shared.showWelcomeWindow()
  }

  @IBAction func didPushNewConnectionButton(_ sender: Any) {
    WindowManager.shared.showWelcomeWindow()
    NotificationCenter.default.post(name: .NewConnectionRequested, object: nil)
  }

  @IBAction func didPushPreferencesButton(_ sender: Any) {
    WindowManager.shared.showPreferencesWindow()
  }

  @IBAction func didPushManualButton(_ sender: Any) {
    WindowManager.shared.openManual()
  }

  @IBAction func didPushCheckForUpdatesButton(_ sender: Any) {
    updater.resetCaches { [weak self] in
      self?.updater.checkForUpdates(
        rejectionHandler: {
          let alert = NSAlert()
          alert.messageText = "You're up to date!"
          alert.informativeText = "You are running the latest version of Franz available."
          alert.runModal()
        },
        completionHandler: { changes, version in
          WindowManager.shared.showUpdatesWindow(withChangelog: changes, andRelease: version)
        }
      )
    }
  }
}
