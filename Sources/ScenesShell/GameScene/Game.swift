import Scenes
import Igis
import Foundation

class Game: RenderableEntity {

    var selection = Int.random(in: 1 ... 3)
    var userChoice =  ""
    var choiceText = Text(location:Point(x:0, y:0), text:"" )
    var choiceText2 = Text(location:Point(x:0, y:0), text:"" )
    var windowSize = Size(width: 0, height: 0)
    var textcolor = FillStyle(color:Color(.black))
    var textcolor2 = FillStyle(color:Color(.black))
    var textColor3 = FillStyle(color:Color(.black))  
    var winnerTextPlayer = Text(location:Point(x:0, y:0), text:"" )
    var winnerTextBot = Text(location:Point(x:0, y:0), text:"" )
    var noWinner = Text(location:Point(x:0, y:0), text:"" )
    var resetText = Text(location:Point(x:0, y:0), text:"" )
    var showResults = false
    var computer = ""
        
    let rectangle: Rectangle
    let waterImage : Image
    let leafImage : Image
    let background : Image
    


    var fireImage : Image

    var scoreText = Text(location:Point(x:0, y:0), text:"" )
    var blackText = FillStyle(color:Color(.black))
    var scoreText2 = Text(location:Point(x:0, y:0), text:"" )
    var scoreTextColor =  FillStyle(color:Color(.black))
    var scoreTextColor2 =  FillStyle(color:Color(.black))
    var playerScore = 0
    var computerScore = 0
    var debounce = false
    
   
    init() {

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

        guard let backgroundURL = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX7F_vfvjAlA5Ir1Ie0XRTRDTcrybfnRrz6--qQJZFfD8q2XC0IhNJ79WdGhWW5F8jiHQ&usqp=CAU") else {
            fatalError("Failed to create URL for shrunkDogURL")
        }
        background = Image(sourceURL:backgroundURL)


        let rect = Rect(topLeft:Point(x:20, y:10), size:Size(width:300, height:50))
        rectangle = Rectangle(rect:rect, fillMode:.stroke)

        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Game")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        windowSize = canvasSize
        canvas.setup(background)
        canvas.setup(fireImage)
        canvas.setup(waterImage)
        canvas.setup(leafImage)
     
    }

    var increasingScore = false
    
    override func render(canvas:Canvas) {

        if showResults == true {
            
            let clearRect = Rect(topLeft:Point(x:0, y:0), size:windowSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)

            if background.isReady {
                background.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width:2000, height:1000)))
                canvas.render(background) }
            
            choiceText = Text(location:Point(x:200, y:200), text:"You chose " + userChoice)
            choiceText.font = "50pt Arial"

            
            // location and rectangle of fire image // 
            let rect = Rect(topLeft:Point(x:300, y:250), size:Size(width:250, height:250))
            let rectangle = Rectangle(rect:rect)
            let fillStyle = FillStyle(color:Color(.red))
                        
            
            // location and rectangle of water image // 
            let rect1 = Rect(topLeft:Point(x:300, y:250), size:Size(width:250, height:250))
            let rectangle1 = Rectangle(rect:rect1)
            let fillStyle1 = FillStyle(color:Color(.royalblue))
                        
            
            // location and rectangle of leaft image //
            let rect2 = Rect(topLeft:Point(x:300, y:250), size:Size(width:250, height:250))
            let rectangle2 = Rectangle(rect:rect2)
            let fillStyle2 = FillStyle(color:Color(.limegreen))

            let rect3 = Rect(topLeft:Point(x:1425, y:250), size:Size(width:250, height:250))
            let rectangle3 = Rectangle(rect:rect3)

                        

            // text color for player //    
            if userChoice == "water" {
                if waterImage.isReady {
                    waterImage.renderMode = .destinationRect(Rect(topLeft:Point(x:325, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle1, rectangle1, waterImage) }
                textcolor = FillStyle(color:Color(.blue)) }

            if userChoice == "fire" {
                if fireImage.isReady {
                    fireImage.renderMode = .destinationRect(Rect(topLeft:Point(x:325, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle, rectangle, fireImage) }
                textcolor = FillStyle(color:Color(.red)) }

            if userChoice == "leaf" {
                if leafImage.isReady {
                    leafImage.renderMode = .destinationRect(Rect(topLeft:Point(x:325, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle2, rectangle2, leafImage) }
                textcolor = FillStyle(color:Color(.limegreen)) }
            
            

            // text color for computer // 
            if computer == "water" {
                if waterImage.isReady {
                    waterImage.renderMode = .destinationRect(Rect(topLeft:Point(x:1450, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle1, rectangle3, waterImage) }
               textcolor2 = FillStyle(color:Color(.blue)) }

            if computer == "fire" {
                if fireImage.isReady {
                    fireImage.renderMode = .destinationRect(Rect(topLeft:Point(x:1450, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle, rectangle3, fireImage) }
               textcolor2 = FillStyle(color:Color(.red)) }

            if computer == "leaf" {
                if leafImage.isReady {
                    leafImage.renderMode = .destinationRect(Rect(topLeft:Point(x:1450, y:275), size:Size(width:200, height:200)))
                    canvas.render(fillStyle2, rectangle3, leafImage) }
                textcolor2 = FillStyle(color:Color(.limegreen)) }


            choiceText2 = Text(location:Point(x:1200, y:200), text:"Computer chose " + computer)

            choiceText2.font = "50pt Arial"
        }

        // computers selection //
        if selection == 1 {
            computer = String("water")
        }
        else if selection == 2 {
            computer = String("fire")
        }
        else if selection == 3 {
            computer = String("leaf")
        }

        // text for scenarios // 
        winnerTextPlayer = Text(location:Point(x:700, y:400), text:"You Win!")
        winnerTextPlayer.font = "100pt Arial"

        winnerTextBot = Text(location:Point(x:700, y:400), text:"You Lose!")
        winnerTextBot.font = "100pt Arial"

        noWinner = Text(location:Point(x:700, y:400), text:"You Tied!")
        noWinner.font = "100pt Arial"

        resetText = Text(location:Point(x:785, y:650), text:"press 'r' to reset game")
        resetText.font = "30pt Arial"

        
        // text for player win // 
        if userChoice == "water" && computer == "fire" {
            if increasingScore == false{
                playerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextPlayer, blackText, resetText) }
                   
        if userChoice == "fire" && computer == "leaf" {
            if increasingScore == false{
                playerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextPlayer, blackText, resetText) }
           
        if userChoice == "leaf" && computer == "water" {
            if increasingScore == false{
                playerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextPlayer, blackText, resetText) }
           
        
        // text for computer win //

        if computer == "water" && userChoice == "fire" {
            if increasingScore == false{
                computerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextBot, blackText, resetText) }
                   
        if computer == "fire" && userChoice == "leaf" {
            if increasingScore == false{
                computerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextBot, blackText, resetText) }
                               
        if computer == "leaf" && userChoice == "water" {
            if increasingScore == false{
                computerScore += 1
                increasingScore = true
            }
            canvas.render(textColor3, winnerTextBot, blackText, resetText) }
        
        // text for tie //

        if computer == "water" && userChoice == "water" {
            canvas.render(textColor3, noWinner, blackText, resetText) }
                   
        if computer == "fire" && userChoice == "fire" {
            canvas.render(textColor3, noWinner, blackText, resetText) }
                               
        if computer == "leaf" && userChoice == "leaf" {
            canvas.render(textColor3, noWinner, blackText, resetText) }

        canvas.render(textcolor, choiceText, textcolor2, choiceText2, blackText)

        
    }
   
    
    func displayResults(userChoice: String) {
        showResults = true
        self.userChoice = userChoice
        
        
        
    }

}
