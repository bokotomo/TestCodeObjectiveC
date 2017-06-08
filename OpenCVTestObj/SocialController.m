#import "SocialController.h"

@interface SocialController ()

@end

@implementation SocialController

/**
 ツイート投稿Viewの表示
 */
- (void)sendTweet :(UIViewController *)vc :(UIImage *)img :(NSString *)setInitialText :(NSString *)url {
  if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
  {
    
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetSheet setInitialText: setInitialText];
    [tweetSheet addImage: img];
    [tweetSheet addURL:[NSURL URLWithString: url]];
    [vc presentViewController:tweetSheet animated:YES completion:nil];
  }
}
@end
