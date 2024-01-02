//////////////////////////////
// 1.4.1 Checking for switches
// expected:

for k in 1...4{
    moveForward()
    if isOnClosedSwitch{
        toggleSwitch()
    }
}


/// noobish:

while !isBlocked{ moveForward();
    isOnClosedSwitch ? toggleSwitch() : ()
}

//////////////////////////////
// 1.4.2 Using else if
// noobic:

while !isBlocked{
    moveForward()
    isOnGem ? collectGem() : ()
    isOnClosedSwitch ? toggleSwitch() : ()
}


/// with else:

while !isBlocked{
    moveForward()
    if isOnGem{
        collectGem()
    } else if isOnClosedSwitch{
        toggleSwitch()
    }
}

/// pro but Blu will be tired

func doStuff() { collectGem(); toggleSwitch() }
(1...2).forEach { _ in moveForward(); doStuff() }

// or 

func doStuff(){
    isOnClosedSwitch ? toggleSwitch() : ()
    isOnGem ? collectGem() : ()
}

(1...2).forEach { _ in moveForward(); doStuff()}

/////////////////////////////////////
//// 1.4.3 Looping conditional code
/// simple:

for k in 1...12{
    moveForward()
    if isOnGem{
        collectGem()
    } 
    else if isOnClosedSwitch{
        toggleSwitch()
    }
}

/// can we do verbose but 'softer'?

for step in 1...12{
    moveForward()
    switch (isOnClosedSwitch, isOnGem) {
    case (true, _):
        toggleSwitch()
    case (_, true):
        collectGem()
    default:
        print("No switch or gem found.")
    }

}

/////////////////////////////////////
//// 1.4.4 Conditional climb
/// simple:

for i in 1 ... 16 {
    if isOnGem {
        collectGem()   
        turnLeft()
    } else {
        moveForward()
    }
}

/// alternative?


while !isBlocked{
    moveForward()
   if isOnGem {collectGem(); turnLeft()}
}



// 1.4.5 Defining smarter functions
// noob expectation:

func collectOrToggle(){
	for k in 1...4{
        moveForward()
        isOnGem ? collectGem() : ()
        isOnClosedSwitch ? toggleSwitch() : ()
    }
}

collectOrToggle()
turnLeft()
moveForward()
moveForward()
turnLeft()
collectOrToggle()
turnRight()
moveForward()
turnRight()
collectOrToggl

//////////////////
// we can do better

var steps = 0
while steps < 15{
    moveForward()
    isOnGem ? collectGem() : ()
    isOnClosedSwitch ? toggleSwitch() : ()
    isBlocked && isBlockedRight ? turnLeft() : ()
    if isBlockedLeft && !isBlockedRight && isBlocked {
       turnRight()  
    } 
    steps += 1
    }


//////////////////////////
/// how about still better?

for step in 1...15{
    moveForward()
    isOnGem ? collectGem() : ()
    isOnClosedSwitch ? toggleSwitch() : ()
    if [4, 6].contains(step){
        turnLeft()
    }
    else if [10, 11].contains(step){
        turnRight()
}
}

//////////////////////////////////
// 1.4.6 Boxed in
// tried this:

var steps = 0
while steps < 8 {
    moveForward()
    steps += 1
    isOnGem ? collectGem() : ()
    isOnClosedSwitch ? toggleSwitch() : ()
    if isBlocked {
        turnRight()
    }
}

//////////////////////////////////
// could we do better? 

for step in 1...8{
    moveForward()
    isOnGem ? collectGem() : ()
    isOnClosedSwitch ? toggleSwitch() : ()
    isBlocked ?  turnRight() : ()
}


//////////////////////////////////
// 1.4.7 Decision tree
// noob-ish

func turnAround(){
    turnLeft(); turnLeft()
}

func grabItems(){
    isOnGem ? collectGem()  : ()
    isOnClosedSwitch ? toggleSwitch() : ()
}

while !isBlocked{
    moveForward()
    grabItems()
}

if isBlocked { turnAround() }

for k in 1...25 {
    moveForward()
    switch k {
    case 1, 3, 9, 14, 16, 22: 
        turnRight()
    case 4, 7, 12, 17, 20: 
        turnLeft()
    case 2, 8, 15, 21:
        turnAround()
        grabItems()
    default:
        break
    }
}


//////////////////////////////////
// supremely modular

func turnAround(){
    turnLeft(); turnLeft()}

func moveAndCol(){
    moveForward(); collectGem()
}

func TR_Mov3x(){
    turnRight()
    moveSteps(dist: 3)
}

func moveSteps(dist: Int){
    for k in 1...dist{
        moveForward()
    }
}

func rightSide(){
    moveAndCol()
    TR_Mov3x()
    turnLeft()
    moveAndCol()
    turnAround()
    moveForward()
    TR_Mov3x()
    }

func leftSide(){
    turnRight()
    moveForward()
    toggleSwitch()
    turnLeft()
    moveAndCol()
    turnAround()
    moveAndCol()
    turnLeft()
    moveForward()
}

for k in 1...2{
    rightSide()
    leftSide()
}






