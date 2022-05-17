import Foundation
import Scenes
import Igis

class Background : RenderableEntity {


    // labeling each class //
    let maxPattern = 3
    var currentPattern = 1
    var didRender = false
    var rect: Rect?
    
    let rectangle: Rectangle
    let waterImage : Image
    let leafImage : Image
    let background : Image
    
    let title : Text
    var fireText : Text
    var waterText : Text
    var leafText : Text
    var explination : Text
    var selection = 0
    var fireImage : Image
    var textcolor = FillStyle(color:Color(.black))
    
    init() {

        // text //
        title = Text(location:Point(x:700, y:100), text:"Fire, Water, Leaf!")
        title.font = "50pt Arial"
        
        fireText = Text(location:Point(x:345, y:540), text:"press 'f' for fire")
        fireText.font = "15pt Arial"
                
        waterText = Text(location:Point(x:845, y:540), text:"press 'w' for water")
        waterText.font = "15pt Arial"

        leafText = Text(location:Point(x:1345, y:540), text:"press 'l' for leaf")
        leafText.font = "15pt Arial"
        
        explination = Text(location:Point(x:550, y:150), text:"water beats fire, fire beats leaf, and leaf beats water!")
        explination.font = "25pt Arial"
        
         
        guard let fireURL = URL(string:"https://media.istockphoto.com/photos/fire-isolated-over-black-background-picture-id113494458?k=20&m=113494458&s=612x612&w=0&h=xwIXuOUwLSqGiOHMS-byry1NeuH99Z7GBrkfl70Sxvg=") else {
            fatalError("Failed to create URL for Background")
        }
        fireImage = Image(sourceURL:fireURL)
        
            // Pictures of the elements // 
        guard let waterImageURL = URL(string:"https://cardiff.imgix.net/__data/assets/image/0020/552800/Giant-wave.jpg?w=873&h=491&fit=crop&q=60&auto=format") else {
            fatalError("Failed to create URL for enlargedDogURL")
        }
        waterImage = Image(sourceURL:waterImageURL)

        guard let leafImageURL = URL(string:"https://previews.123rf.com/images/rostovdriver/rostovdriver1801/rostovdriver180101310/93625856-big-tropical-leaves-in-jungle-forest.jpg") else {
            fatalError("Failed to create URL for shrunkDogURL")
        }
        leafImage = Image(sourceURL:leafImageURL)

        guard let backgroundURL = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3kIx7kK7a1I4B1VHCUO67FvRwOjkfd5ZvATdDTqfbvI7kQm0jPtffBKbnikrehml1Q1E&usqp=CAU") else {
            fatalError("Failed to create URL for shrunkDogURL")
        }
        background = Image(sourceURL:backgroundURL)


        let rect = Rect(topLeft:Point(x:20, y:10), size:Size(width:300, height:50))
        rectangle = Rectangle(rect:rect, fillMode:.stroke)

        super.init(name:"Background")            
    }    

        override func setup(canvasSize:Size, canvas:Canvas) {
            let clearRect = Rect(topLeft:Point(x:0, y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
            
            
            canvas.render(title)
            canvas.render(explination)
            canvas.render(fireText)
            canvas.render(waterText)
            canvas.render(leafText)
            
            canvas.setup(waterImage)
            canvas.setup(leafImage)
            canvas.setup(fireImage)

            canvas.setup(background)
        }
        
        
        override func render(canvas:Canvas) {

            if background.isReady {
                background.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:2000, height:1000)))
                canvas.render(background) }

            // location and rectangle of fire image // 
            let rect = Rect(topLeft:Point(x:300, y:550), size:Size(width:250, height:250))
            let rectangle = Rectangle(rect:rect)
            let fillStyle = FillStyle(color:Color(.red))
            canvas.render(fillStyle, rectangle)
            
            
            // location and rectangle of water image // 
            let rect1 = Rect(topLeft:Point(x:800, y:550), size:Size(width:250, height:250))
            let rectangle1 = Rectangle(rect:rect1)
            let fillStyle1 = FillStyle(color:Color(.royalblue))
            canvas.render(fillStyle1, rectangle1)
            
            
            
            // location and rectangle of leaft image //
            let rect2 = Rect(topLeft:Point(x:1300, y:550), size:Size(width:250, height:250))
            let rectangle2 = Rectangle(rect:rect2)
            let fillStyle2 = FillStyle(color:Color(.limegreen))
            canvas.render(fillStyle2, rectangle2)
            
            
            if leafImage.isReady {
                leafImage.renderMode = .destinationRect(Rect(topLeft:Point(x:1325, y:575), size:Size(width:200, height:200)))
                canvas.render(leafImage)
            }
            
            if waterImage.isReady {
                waterImage.renderMode = .destinationRect(Rect(topLeft:Point(x:825, y:575), size:Size(width:200, height:200)))
                canvas.render(waterImage)
            }

            if fireImage.isReady {
                fireImage.renderMode = .destinationRect(Rect(topLeft:Point(x:325, y:575), size:Size(width:200, height:200)))
                canvas.render(fireImage) }

            
            canvas.render(textcolor, fireText)
            canvas.render(textcolor, waterText)
            canvas.render(textcolor, leafText)
            canvas.render(textcolor, explination)
            canvas.render(textcolor, title)
            canvas.render(textcolor, explination)
            


            

     
            
            }
        }
    
   
