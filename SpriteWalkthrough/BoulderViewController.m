//
//  SpriteViewController.m
//

#import "BoulderViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "BoulderScene.h"

@interface BoulderViewController ()

@end

@implementation BoulderViewController

- (void)viewDidLoad
{
    NSLog(@"BoulderViewController - viewDidLoad");
    
    [super viewDidLoad];
    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"BoulderViewController - viewWillAppear");
    
    BoulderScene* hello = [[BoulderScene alloc]
                         initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: hello];
    
}


@end
