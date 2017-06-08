#import "ViewController.h"

//クラスの宣言部分
@interface ViewController (){
  /// メンバ変数の定義する場所
}
/// メソッドの定義する場所
@end

//クラスの実行部分
@implementation ViewController

// エントリーポイント
- (void)viewDidLoad {
  [super viewDidLoad];
  
  //アラートの表示
  AlertController *AlertControllerInstance = [AlertController alloc];
  [AlertControllerInstance showAlert: @"タイトル": @"テキスト": @"完了"];
  
  //viewのを描画する自作メソッド
  [self setViews];
}

//viewの描画
-(void)setViews{
  
  //画像の作成
  OpenCVFilters *OpenCVFiltersInstance = [OpenCVFilters alloc];
  UIImage *srcImage = [UIImage imageNamed:@"tes"];
  //UIIMageをcv::Matに変換
  cv::Mat srcMat = [OpenCVFiltersInstance cvMatFromUIImage:srcImage];
  //白黒に変換
  cv::Mat greyMat = [OpenCVFiltersInstance cvMatChangeGrayImage:srcMat];
  //cv::MatをUIIMageに変換
  UIImage *confImage = [OpenCVFiltersInstance UIImageFromCVMat:greyMat];
  
  // UIImageView1の作成
  UIImageView *iv = [[UIImageView alloc] initWithImage:srcImage];
  iv.frame = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height/2);
  [self.view addSubview:iv];
  
  // UIImageView2の作成
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
