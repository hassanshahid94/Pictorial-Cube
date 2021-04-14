
import UIKit
import SceneKit
import ARKit

extension ViewController: ARSCNViewDelegate {
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        
        updateQueue.async {
          
            let tempScene = SCNScene(named: "Catalog.scnassets/ship.scn")!
            let Node: SCNNode = tempScene.rootNode.childNode(withName: "ship", recursively: true)!
            
            if imageAnchor.name == "front"{
                //Front
                Node.eulerAngles = SCNVector3(CGFloat(self.degToRadians(degrees: -90)), 0, 0)
                Node.position.y = 1.0
            }else if imageAnchor.name == "back"{
                // Back
                Node.eulerAngles = SCNVector3(CGFloat(self.degToRadians(degrees: 90)),CGFloat(self.degToRadians(degrees: 180)),0)
                Node.position.y = -1.0
            }else if imageAnchor.name == "right"{
                //Right
                Node.eulerAngles = SCNVector3(0,CGFloat(self.degToRadians(degrees: -270)),0)
                Node.position.x = 0.8
            }
            else if imageAnchor.name == "left"{
                //Left
                Node.eulerAngles = SCNVector3(0,CGFloat(self.degToRadians(degrees: 270)),0)
                Node.position.x = -0.8
            }else if imageAnchor.name == "up"{
                //Up
                Node.eulerAngles = SCNVector3(0,Float(self.degToRadians(degrees: 180)),0)
                Node.position.z = -0.85
            }
            else if imageAnchor.name == "down"{
                //Down
                Node.eulerAngles = SCNVector3(0,Float(self.degToRadians(degrees:360 )),0)
                Node.position.z = 0.8
            }
            Node.renderingOrder = -1
            Node.opacity = 1
            node.addChildNode(Node)
        }
    }
    
    public func degToRadians(degrees:Double) -> Double
     {
        return degrees * (.pi / 180);
      }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
}
