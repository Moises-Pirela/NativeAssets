#import <Foundation/Foundation.h>
#import "UnityAppController.h"
#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

extern UIViewController *UnityGetGLViewController();


@interface NativeAssets : NSObject
@end

@implementation NativeAssets
+(void)shareView:(NSString *) shareMessage addURL:(NSString *)url
{
    NSURL *postUrl = [NSURL URLWithString:url];
    NSArray *postItems = @[shareMessage, postUrl];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:postItems applicationActivities:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [UnityGetGLViewController() presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        UIPopoverPresentationController *popOver = controller.popoverPresentationController;
        if (popOver)
        {
            popOver.sourceView = controller.view;
            popOver.sourceRect = CGRectMake(UnityGetGLViewController().view.frame.size.width/2, UnityGetGLViewController().view.frame.size.height/4,0,0);
            [UnityGetGLViewController() presentViewController:controller animated:YES completion:nil];
        }
    }
}

+(void)reviewView
{
    if([SKStoreReviewController class]){
       [SKStoreReviewController requestReview] ;
    }
}

extern "C"
{
    void _ShareMessage(const char *message, const char *url)
    {
        [NativeAssets shareView: [NSString stringWithUTF8String:message] addURL:[NSString stringWithUTF8String:url]];
    }
    
    void _ShowReview()
    {
        [NativeAssets reviewView];
    }
}
@end
