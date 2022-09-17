import Cocoa

class WelcomeWindowController: NSWindowController {
  private var split: SplitViewController!

  convenience init() {
    self.init(windowNibName: "WelcomeWindowController")
  }

  override func windowDidLoad() {
    super.windowDidLoad()

    window?.isMovableByWindowBackground = true
    window?.center()

    split = SplitViewController()
    split.addSplitViewItem(NSSplitViewItem(viewController: WelcomeWindowContentViewController()))
    split.addSplitViewItem(NSSplitViewItem(sidebarWithViewController: WelcomeWindowConnectionsViewController()))
    contentViewController = split
  }
}

// MARK: -NSSplitViewController
fileprivate class SplitViewController: NSSplitViewController {
  override func splitView(_ splitView: NSSplitView, effectiveRect proposedEffectiveRect: NSRect, forDrawnRect drawnRect: NSRect, ofDividerAt dividerIndex: Int) -> NSRect {
    return NSRect()
  }
}
