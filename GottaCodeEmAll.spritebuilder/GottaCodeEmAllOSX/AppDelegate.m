//
//  AppDelegate.m
//  GottaCodeEmAllOSX
//
//  Created by Gerald Monaco on 9/29/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "AppDelegate.h"
#import "CCBReader.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSOpenGLView *glView;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
      // Setup file utils and search paths
    [self setupFileUtils];
    
    // Setup and load your sprite frames
    [self setupSpriteFrames];
  
    // Setup Cocos2D and run first scene
    [self setupCocos2d];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - Helper and setup methods

- (void) setupFileUtils
{
    // Configure CCFileUtils to work with SpriteBuilder
    CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
    
    sharedFileUtils.directoriesDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                       @"resources-phone", CCFileUtilsSuffixMac,
                                       @"resources-phonehd", CCFileUtilsSuffixMacHD,
                                       nil];
    
    sharedFileUtils.searchPath = [NSArray arrayWithObjects:
                                  [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Published-iOS"],
                                  [[NSBundle mainBundle] resourcePath],
                                  nil];
    
    sharedFileUtils.searchMode = CCFileUtilsSearchModeDirectory;
    [sharedFileUtils buildSearchResolutionsOrder];
    [sharedFileUtils loadFilenameLookupDictionaryFromFile:@"fileLookup.plist"];
}

- (void) setupSpriteFrames
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] loadSpriteFrameLookupDictionaryFromFile:@"spriteFrameFileList.plist"];
}
 
- (void) setupCocos2d
{
    // Setup the CCDirector for Mac
    CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
    [director setResizeMode:kCCDirectorResize_NoScale];
    [director setProjection:CCDirectorProjection2D];
    
//#ifdef DEBUG
//    // Enable FPS and SPF
//    [director setDisplayStats:YES];
//#endif
  
    // Connect the OpenGL view with the director
    [director setView:self.glView];
    [self.glView setFrameSize:NSMakeSize(self.window.frame.size.width,self.window.frame.size.height)];
    
    // Enable "moving" mouse event. Default no.
    [self.window setAcceptsMouseMovedEvents:NO];
    [self.window center];
    [self.window setRestorable:NO];
    
    // Run the first scene
//#ifndef DEBUG
    [director pause];
//#endif
    [director runWithScene:[self startScene]];
}


- (CCScene*) startScene
{
    return [CCBReader loadAsScene:@"Battle"];
}

@end