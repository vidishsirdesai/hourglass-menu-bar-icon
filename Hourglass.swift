import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var timer: Timer?
    var currentFrame = 0
    
    // Using Apple's native SF Symbols for the animation frames
    let frames = [
        "hourglass.bottomhalf.fill",
        "hourglass",
        "hourglass.tophalf.fill"
    ]

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the menu bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Create a dropdown menu with a Quit option
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit Hourglass", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
        
        startAnimation()
    }
    
    func startAnimation() {
        // Triggers the updateIcon function every 0.5 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateIcon), userInfo: nil, repeats: true)
    }
    
    @objc func updateIcon() {
        currentFrame = (currentFrame + 1) % frames.count
        if let button = statusItem.button {
            // Fetch the SF Symbol and apply it to the menu bar button
            let config = NSImage.SymbolConfiguration(scale: .medium)
            if let image = NSImage(systemSymbolName: frames[currentFrame], accessibilityDescription: "Hourglass Animation")?.withSymbolConfiguration(config) {
                button.image = image
            }
        }
    }
}

// Initialize and run the application
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

// .accessory ensures the app runs in the menu bar only, hiding the Dock icon
app.setActivationPolicy(.accessory) 
app.run()
