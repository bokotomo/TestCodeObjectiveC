#import <UIKit/UIKit.h>

//openCVの読み込み
#ifdef __cplusplus
#import "opencv2/highgui.hpp"
#import <opencv2/opencv.hpp>
#endif

@interface OpenCVFilters : NSObject

- (UIImage *)UIImageFromCVMat:(cv::Mat)cvMat;
- (cv::Mat)cvMatFromUIImage:(UIImage *)image;
@end
