#import <Cocoa/Cocoa.h>

// WARNING: If you add or modify this list, check ViewerController.m, DCMView.h and HotKey Pref Pane

enum HotKeyActions {
   DefaultWWWLHotKeyAction = 0,
   FullDynamicWWWLHotKeyAction,
	Preset1WWWLHotKeyAction,
   Preset2WWWLHotKeyAction,
   Preset3WWWLHotKeyAction,
	Preset4WWWLHotKeyAction,
   Preset5WWWLHotKeyAction,
   Preset6WWWLHotKeyAction,
	Preset7WWWLHotKeyAction,
   Preset8WWWLHotKeyAction,
   Preset9WWWLHotKeyAction,
	FlipVerticalHotKeyAction,
   FlipHorizontalHotKeyAction,
	WWWLToolHotKeyAction,
   MoveHotKeyAction,
   ZoomHotKeyAction,
   RotateHotKeyAction,
	ScrollHotKeyAction,
   LengthHotKeyAction,
   AngleHotKeyAction,
   RectangleHotKeyAction,
	OvalHotKeyAction,
   TextHotKeyAction,
   ArrowHotKeyAction,
   OpenPolygonHotKeyAction,
	ClosedPolygonHotKeyAction,
   PencilHotKeyAction,
   ThreeDPointHotKeyAction,
   PlainToolHotKeyAction,
	BoneRemovalHotKeyAction,
   Rotate3DHotKeyAction,
   Camera3DotKeyAction,
   scissors3DHotKeyAction,
   RepulsorHotKeyAction,
   SelectorHotKeyAction,
   EmptyHotKeyAction,
   UnreadHotKeyAction,
   ReviewedHotKeyAction,
   DictatedHotKeyAction,
   ValidatedHotKeyAction,
   OrthoMPRCrossHotKeyAction,
   Preset1OpacityHotKeyAction,
   Preset2OpacityHotKeyAction,
   Preset3OpacityHotKeyAction,
   Preset4OpacityHotKeyAction,
   Preset5OpacityHotKeyAction,
   Preset6OpacityHotKeyAction,
   Preset7OpacityHotKeyAction,
   Preset8OpacityHotKeyAction,
   Preset9OpacityHotKeyAction,
   FullScreenAction,
   Sync3DAction,
   SetKeyImageAction
};

@interface DefaultsOsiriX : NSObject {}

+ (NSMutableDictionary*) getDefaults;

@end
