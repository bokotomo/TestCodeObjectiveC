#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface SocialController : NSObject

- (void)sendTweet :(UIViewController *)vc :(UIImage *)img :(NSString *)setInitialText :(NSString *)url;
@end
