
import UIKit
import ARKit
import DropDown

class ViewController: BaseVC{
    
    //MARK:- Variables
    var objName = "ship"
    let dropDown = DropDown()
    var Node = SCNNode()
    /// A serial queue for thread safety when modifying SceneKit's scene graph.
    let updateQueue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).serialSCNQueue")
    var isChange = true
    
    //MARK:- Outlets
    @IBOutlet weak var btnDropDown: UIButton!
    /// Primary SceneKit view that renders the AR session
    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Lifecycle
    // Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as FPS and timing information (useful during development)
     //   sceneView.showsStatistics = true
        
        // Enable environment-based lighting
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
        
        // The view to which the drop down will appear on
        dropDown.anchorView = btnDropDown // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["ship", "curve"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            startLoader()
            self.objName = item
            self.btnDropDown.setTitle(item, for: .normal)
            isChange = true
        }

        // Will set a custom width instead of the anchor view width
        dropDown.width = 200
        
    }
    
    // Notifies the view controller that its view is about to be added to a view hierarchy.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let refImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) else {
                fatalError("Missing expected asset catalog resources.")
        }
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = refImages
        configuration.maximumNumberOfTrackedImages = 1
        
        // Run the view's session
        sceneView.session.run(configuration, options: ARSession.RunOptions(arrayLiteral: [.resetTracking, .removeExistingAnchors]))
    }
    
    // Notifies the view controller that its view is about to be removed from a view hierarchy.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    @IBAction func btnDropDownAction(_ sender: UIButton) {
        
        dropDown.show()
    }
}
