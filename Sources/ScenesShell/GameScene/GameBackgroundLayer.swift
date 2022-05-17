import Scenes

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class GameBackgroundLayer : Layer {
     
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Background")
      }
  }
