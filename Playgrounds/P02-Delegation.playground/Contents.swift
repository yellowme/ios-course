// iOS Course Delegation
// Author: Luis Burgos <luis@yellowme.mx>
//
// Delegation is a design pattern that enables a class or structure to
// hand off (or delegate) some of its responsibilities to an instance of another type.
//
// Steps:
// 1. Create a delegate protocol that defines the responsibilities of the delegate. Call it "SongLoaderResponder"
// 2. Create a delegate property in the delegating class to keep track of the delegate. The delegating class should be called "SongLoader"
// 3. Adopt and implement the delegate methods in the delegate class.
// 4. Call the delegate from the delegating object.

import UIKit
import PlaygroundSupport

/**
 * Flag to determine which controller show on this playground
 */
var currentStep = 1

// MARK: - Setup
// This is the code base for this module
class StepOneViewController : UIViewController {
    
    // MARK: - Properties
    var label : UILabel!
    
    // MARK: - Controller
    
    /**
     * We setuo view elements inside this method cause we are not using storyboards
     */
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.backgroundColor = .yellow
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    override func viewDidLoad() {
        label.text = "Are you ready?"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.center = view.center
    }

}

// MARK: - Step 1.
// Create a delegate protocol that defines the responsibilities of the delegate.

protocol SongLoaderResponder {
    func willBeginDownload()
    func didFinishDownload()
}

// MARK: - Step 2.
// Create a delegate property in the delegating class to keep track of the delegate.

class SongLoader {
    var delegate: SongLoaderResponder?
    
    func prepareCrowdScream() {
        delegate?.willBeginDownload()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.didFinishDownload()
        }
    }
}

// MARK: - Step 3.
// currentStep = 3
// Adopt and implement the delegate methods in the delegate class.

class StepThreeViewController : UIViewController {
    
    // MARK: - Properties
    var label : UILabel!
    
    // MARK: - Controller
    
    /**
     * We setuo view elements inside this method cause we are not using storyboards
     */
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.backgroundColor = .yellow
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    override func viewDidLoad() {
        label.text = "Are you ready?"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.center = view.center
    }
    
}

//MARK: - SongLoaderResponder
extension StepThreeViewController: SongLoaderResponder {
    func willBeginDownload() {
        label.text = "You've been.. "
    }
    
    func didFinishDownload() {
        label.text = "Thunderstruck!"
    }
}

// PlaygroundPage.current.needsIndefiniteExecution = true
// PlaygroundPage.current.liveView = StepThreeViewController()

// MARK: - Step 4.
// currentStep = 4
// Call the delegate from the delegating object.

class StepFourViewController : UIViewController {
    
    // MARK: - Properties
    var label : UILabel!
    let loader = SongLoader()
    
    // MARK: - Controller
    
    /**
     * We setuo view elements inside this method cause we are not using storyboards
     */
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.backgroundColor = .yellow
        label.textColor = .black
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    override func viewDidLoad() {
        label.text = "Are you ready?"
        loader.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.center = view.center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loader.prepareCrowdScream()
    }
}

//MARK: - SongLoaderResponder
extension StepFourViewController: SongLoaderResponder {
    func willBeginDownload() {
        label.text = "You've been.. "
    }
    
    func didFinishDownload() {
        label.text = "Thunderstruck!"
    }
}

// NOTE: If the View Controller is not displaying on your right side of
// the screen, search for the wo overlapping circles icon on your top right and
// click on the option "Assistant Editors on Right"
PlaygroundPage.current.needsIndefiniteExecution = true
print("Current step - \(currentStep)")
PlaygroundPage.current.liveView = {
    switch currentStep {
    case 3:
        return StepThreeViewController()
    case 4:
        return StepFourViewController()
    default:
        return StepOneViewController()
    }
}()
