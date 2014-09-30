//
//  BoulderScene.m
//



#import "BoulderScene.h"

@interface BoulderScene ()
@property BOOL contentCreated;
@end

@implementation BoulderScene
const int GRIDXMAX = 40 ;
const int GRIDYMAX = 20 ;


int gridArray[GRIDXMAX][GRIDXMAX] = {
    {   1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,  1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,  1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1    },
    {   1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,  1,0,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1    },
    {   1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1    },
    
    {   1,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,  0,0,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1    },
    {   1,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,1,1,0,0,  0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,  0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1    },

    {   1,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,  0,0,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1    },
    {   1,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,1,1,0,0,  0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,  0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1    },
    
    {   1,0,0,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1,  1,0,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,  1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1    },
    {   1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,  1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1    },
    {   1,0,0,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1,  1,0,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,1,1,1    },
    {   1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,  1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1    }
                                    } ;


static int shipCreated = 0 ;
static int rockCreated = 0 ;
static int frameCounter = 0 ;

static int linkedEnemyCounter = 0 ;
static int linkedEnemyCounterKilled = 0 ;


static int enemyXPos = 200 ;
static int enemyYPos = 200 ;
static int enemyXDelta = 1 ;
static int enemyYDelta = 1 ;
static int enemyStep = 5;

static int scrollSize = 64 * 20;
static int scrollPosition = 400 ;
static int scrollStep = 5;
static int scollDirection = 1 ;

static int didSimulatePhysicsCalled = 0 ;

static int xTouched = 0 ;
static int yTouched = 0 ;
static int xTouchedPrevious = 0 ;
static int yTouchedPrevious = 0 ;

SKSpriteNode *skPlayer ;
SKSpriteNode *skEnemy ;
SKSpriteNode *skGrid;
SKSpriteNode *background ;


SKLabelNode *sktRemainingNodes ;
SKLabelNode *sktCreatedFlyingObjects;
SKLabelNode *sktkilledFlyingObjects;



static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

- (void)update:(NSTimeInterval)currentTime
{
   // NSLog(@"BoulderScene - update: %i ",frameCounter++);
    
    /*
    enemyXPos = enemyXPos + enemyXDelta * enemyStep;
    
    enemyYPos = enemyYPos + enemyYDelta * enemyStep;
    
    if ( enemyXPos > 500) enemyXDelta = -1;
    else if ( enemyXPos < 50) enemyXDelta = 1;
    
    if ( enemyYPos > 850) enemyYDelta = -1;
    else if ( enemyYPos < 200) enemyYDelta = 1;
    */
    
    enemyXPos = enemyXPos + xTouched ;
    enemyYPos = enemyYPos - yTouched ;
    
    //skEnemy.position = CGPointMake( enemyXPos , enemyYPos );
   
    scrollPosition = scrollPosition + ( scollDirection * scrollStep) ;
    if ( (scrollPosition > 64 * 40  - 800 )  || (scrollPosition < -800) ) scollDirection = scollDirection *-1;
    

     
    //skGrid.position = CGPointMake(  enemyYPos - 800  , enemyXPos - 500);
    skGrid.position = CGPointMake(  enemyXPos - 800  , enemyYPos - 500);

    if ( xTouched > 0 )
    {
        xTouched--;
        background.position = CGPointMake(  background.position.x + 1 ,  background.position.y) ;
    }else if ( xTouched < 0 )
    {
        xTouched++;
        background.position = CGPointMake(  background.position.x - 1 ,  background.position.y) ;
    }
    
    if ( yTouched > 0 )
    {
        yTouched--;
        background.position = CGPointMake(  background.position.x ,  background.position.y -1) ;
    }else if ( yTouched < 0 )
    {
        yTouched++;
        background.position = CGPointMake(  background.position.x ,  background.position.y+1) ;
    }

    
    //yTouched = 0 ;
    
   // [skEnemy runAction: [SKAction moveTo:CGPointMake( enemyXPos , enemyYPos ) duration:0.0]];
    
    
    [self refreshTextInfo];
}



// =========================================================================================
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
  
        self.backgroundColor = [SKColor blackColor];
        
        background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        background.name = @"backdropNode";
 
        // background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
 
        background.position = CGPointMake(0,0);
 
        for ( int x = 0 ; x < 4;x++)
            for ( int y = 0 ; y < 4;y++)
            {
                SKSpriteNode *background2 = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
                background2.name = @"backdropNode";
                background2.position = CGPointMake(background.size.width * x , background.size.height * y);

                [background addChild:background2];
            }
        
        
        [self addChild:background];
        
        skGrid  = [self createGrid:CGPointMake( 40 , 200 )];
        [self addChild:skGrid];
        
        sktRemainingNodes = [SKLabelNode labelNodeWithFontNamed:@"Monaco"];
        [self initTextNode:sktRemainingNodes
                intialText:@"Remaining nodes:"
                  position:CGPointMake(20,950)];
        
        sktCreatedFlyingObjects = [SKLabelNode labelNodeWithFontNamed:@"Monaco"];
        [self initTextNode:sktCreatedFlyingObjects
                intialText:@"Remaining nodes:"
                  position:CGPointMake(20,900)];
        
        sktkilledFlyingObjects = [SKLabelNode labelNodeWithFontNamed:@"Monaco"];
        [self initTextNode:sktkilledFlyingObjects
                intialText:@"Remaining nodes:"
                  position:CGPointMake(20,850)];
        
        
    }
    return self;
}

// =========================================================================================

- (void)initTextNode:(SKLabelNode *) sktLabel
                intialText:(NSString *) nsText
                 position:(CGPoint) cgPosition
{
    
    //sktLabel = [SKLabelNode labelNodeWithFontNamed:@"Monaco"];

    sktLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft ;
    sktLabel.text = nsText;
    sktLabel.fontSize = 40;
    sktLabel.fontColor = [SKColor grayColor];
    sktLabel.position = cgPosition;
    
    [self addChild:sktLabel];
    
}




// =========================================================================================

- (void)didMoveToView:(SKView *)view
{
    NSLog(@"BoulderScene - didMoveToView");
    
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

// =========================================================================================
-(void)didSimulatePhysics
{
   // NSLog(@"BoulderScene - didSimulatePhysics num:%i",didSimulatePhysicsCalled);
    

    
}


// =========================================================================================
- (void)refreshTextInfo
{
    
    // NSLog(@"BoulderScene - refreshTextInfo");
    
    sktRemainingNodes.text =
    [NSString stringWithFormat:@"Created nodes:%i", linkedEnemyCounter ] ;
    
    sktCreatedFlyingObjects.text =
    [NSString stringWithFormat:@"Killed nodes:%i",  linkedEnemyCounterKilled] ;
    
    sktkilledFlyingObjects.text =
    [NSString stringWithFormat:@"Remainging nodes:%i", linkedEnemyCounter - linkedEnemyCounterKilled];
    
}



// =========================================================================================
- (void)createSceneContents
{
    
    NSLog(@"BoulderScene - createSceneContents");
    
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    SKSpriteNode  *skBlockingWall;
    
    skPlayer = [self createPlayer];
    skPlayer.position = CGPointMake( 350 , 400 );
    [self addChild:skPlayer];
    
    skBlockingWall = [self createBlockingWall];
    skBlockingWall.position = CGPointMake( 400 , 300 );
    [self addChild:skBlockingWall];
    
}


// =========================================================================================
- (SKSpriteNode *)createBlockingWall
{
    NSLog(@"BoulderScene - createBlockingWall");
    
    
    SKSpriteNode *wall = [SKSpriteNode spriteNodeWithImageNamed:@"wallthin.png"];
    
    
    wall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:wall.size];
    wall.physicsBody.dynamic = NO;
    
    return wall;
}


// =========================================================================================
- (SKSpriteNode *)createPlayer
{

    NSLog(@"BoulderScene - createPlayer num:%i",shipCreated++);
    
    skPlayer = [SKSpriteNode spriteNodeWithImageNamed:@"boulderplayer.png"];
    
    skPlayer.name = @"player";
    skPlayer.position = CGPointMake(100,100);

    
    skPlayer.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:skPlayer.size ];
    skPlayer.physicsBody.dynamic = YES ;

    
    return skPlayer;
}


// =========================================================================================
- (SKSpriteNode *)createGrid:(CGPoint) cgPosition
{
    NSLog(@"BoulderScene - createGrid");
    
    SKSpriteNode *skGridRoot = [SKSpriteNode spriteNodeWithImageNamed:@"tile.png"];
    
    skGridRoot.position = cgPosition ;
    for (int x = 0; x < GRIDXMAX ; x++)
    {
        for (int y = 0; y < GRIDYMAX ; y++)
        {
            if ( gridArray[y][x] )
            {
                SKSpriteNode *skTileSlave = [SKSpriteNode spriteNodeWithImageNamed:@"tile.png"];
                skTileSlave.position = CGPointMake( 64 * x , y * 64 );
                
                skTileSlave.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:skTileSlave.size];
                skTileSlave.physicsBody.dynamic = NO;
                
                
                
                [skGridRoot addChild:skTileSlave];
            }
        }
    }
    
    
    return skGridRoot;
}




// =========================================================================================
- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    NSLog(@"BoulderScene - touchesBegan x:%i y:%i",(int)location.x,(int)location.y);
   
    int localX = (int)location.x ;
    
  
    xTouchedPrevious = localX ;
    
    int localY = (int)location.y ;

    yTouchedPrevious = localY ;
    
    
    xTouched = 0 ;
    
    yTouched = 0 ;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
   // NSLog(@"BoulderScene - touchesMoved x:%i y:%i",(int)location.x,(int)location.y);
  
    /*
    int localX = (int)location.x ;
    if ( localX > xTouchedPrevious) xTouched = 5;
    else if ( localX < xTouchedPrevious) xTouched = -5;
    else  xTouched = 0 ;
    xTouchedPrevious = localX ;
    */
    
    int localX = (int)location.x ;
    
    xTouched =   localX - xTouchedPrevious  ;
    xTouchedPrevious = localX ;
    
    int localY = (int)location.y ;
    yTouched =   localY - yTouchedPrevious ;
    yTouchedPrevious = localY ;

    NSLog(@"BoulderScene - touchesMoved x:%i y:%i   dx:%i dy:%i",(int)location.x,(int)location.y, xTouched,yTouched);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    NSLog(@"BoulderScene - touchesEnded x:%i y:%i",(int)location.x,(int)location.y);
    
    //xTouched = 0 ;
    //yTouched = 0 ;
    
    xTouchedPrevious = 0 ;
    yTouchedPrevious = 0 ;
    
}


@end
