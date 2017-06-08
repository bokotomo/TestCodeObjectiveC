//
//  AlertController.m
//  OpenCVTestObj
//
//  Created by 福本 on 2017/06/09.
//  Copyright © 2017年 Fukumoto. All rights reserved.
//

#import "AlertController.h"

@implementation AlertController

/**
 アラートの表示
 (NSString *)title
 (NSString *)text
 のそれぞれの引数を定義
 */
- (void)showAlert :(NSString *)title :(NSString *)text :(NSString *)buttonText {
  //UIAlertViewクラスのインスタンスを作成
  UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:text delegate:self cancelButtonTitle:buttonText otherButtonTitles:nil];
  
  //alertインスタンスのshowメソッドの実行
  [alert show];
}
@end
