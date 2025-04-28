import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var isDarkMode = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let savedTheme = UserDefaults.standard.value(forKey: "isDarkMode") as? Bool {
            isDarkMode = savedTheme
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeScreen(toggleTheme: toggleTheme))
        window?.makeKeyAndVisible()
        return true
    }

    func toggleTheme() {
        isDarkMode.toggle()
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        
        if isDarkMode {
            window?.rootViewController?.view.overrideUserInterfaceStyle = .dark
        } else {
            window?.rootViewController?.view.overrideUserInterfaceStyle = .light
        }
    }
}
