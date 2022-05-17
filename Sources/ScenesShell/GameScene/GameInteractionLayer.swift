import Igis
import Scenes

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class GameInteractionLayer : Layer, KeyDownHandler {

    var userChoice = ""
    let game = Game()
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          insert(entity: game, at: .front)
          

          // We insert our RenderableEntities in the constructor

      }
      override func preSetup(canvasSize: Size, canvas: Canvas ) {
          dispatcher.registerKeyDownHandler(handler: self)
      }

    
      override func postTeardown() {
        dispatcher.unregisterKeyDownHandler(handler: self)
    }


      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
          if (key == "w") {
              game.displayResults(userChoice: "water")
                 
          }
          
          if (key == "f") {
              game.displayResults(userChoice: "fire")
              
          }
          
          if (key == "l") {
              game.displayResults(userChoice: "leaf")
              
          }

          if (key == "r") {
              director.enqueueScene(scene: MainScene())
              director.transitionToNextScene()
          }
                      
        }
        
        
      }
      


  
