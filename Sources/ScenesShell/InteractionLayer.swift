
import Igis
import Scenes

  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {

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
      
      private func switchToGame() {
          director.enqueueScene(scene: GameScene())
          director.transitionToNextScene()
      }
      

      func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {
         
          if (key == "w") {
              switchToGame()
          }
          
          if (key == "f") {
              switchToGame()
          }
          
          if (key == "l") {
              
              switchToGame()
          }

                      
        }
        
        
      }
      


  
