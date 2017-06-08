#import "ViewController.h"

//クラスの宣言部分
@interface ViewController (){
  /// メンバ変数の定義
}
/// メソッドの定義

@end

//クラスの実行部分
@implementation ViewController

// エントリーポイント
- (void)viewDidLoad {
  [super viewDidLoad];
  
  //アラートの表示
  AlertController *AlertControllerInstance = [AlertController alloc];
  [AlertControllerInstance showAlert: @"タイトル": @"テキスト": @"完了"];
  
  //viewの設定する自作メソッド
  [self setViews];
  
}

//viewの設定
-(void)setViews{
  
  //画像の作成
  OpenCVFilters *OpenCVFiltersInstance = [OpenCVFilters alloc];
  UIImage *srcImage = [UIImage imageNamed:@"tes"];
  cv::Mat srcMat = [OpenCVFiltersInstance cvMatFromUIImage:srcImage];
  cv::Mat greyMat;
  cv::cvtColor(srcMat, greyMat, CV_BGR2GRAY);
  
  //変換したの画像
  UIImage *confImage = [OpenCVFiltersInstance UIImageFromCVMat:greyMat];
  
  // UIImageViewの作成
  UIImageView *iv = [[UIImageView alloc] initWithImage:srcImage];
  iv.frame = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height/2);
  [self.view addSubview:iv];
  
  // UIImageViewの作成
  UIImageView *iv2 = [[UIImageView alloc] initWithImage:confImage];
  iv2.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height/2);
  [self.view addSubview:iv2];
  
  //ボタンの作成
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  btn.frame = CGRectMake(10, self.view.frame.size.height - 100, self.view.frame.size.width - 20, 50);
  btn.backgroundColor = [UIColor colorWithRed:1.0 green:0.647 blue:0.0 alpha:1.0];
  [btn setTitle:@"ツイートする" forState:UIControlStateNormal];
  [btn setTitle:@"ぽち" forState:UIControlStateHighlighted];
  [btn setTitle:@"押せません" forState:UIControlStateDisabled];
  // ボタンがタッチダウンされた時にhogeメソッドを呼び出す
  [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:btn];
}

/**
 ボタンが押されたら
 */
-(void)hoge:(UIButton*)button{
  //ツイートVIEWの表示
  SocialController *socialControllerInstance = [SocialController alloc];
  UIImage *img = [UIImage imageNamed:@"recode_logo1"];
  [socialControllerInstance sendTweet :self :img :@"ツイート" :@"URL"];
}

/**
 メモリが少なくなったら
 */
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
