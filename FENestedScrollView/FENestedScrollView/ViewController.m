//
//  ViewController.m
//  FENestedScrollView
//
//  Created by FlyElephant on 2018/1/3.
//  Copyright © 2018年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UIScrollView *mainScrollView;
@property (strong, nonatomic) UIScrollView *subScrollView;
@property (strong, nonatomic) UITableView *mainTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
//    [self testTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"UITableViewCell---%ld",indexPath.row];
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"手势滑动开始");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"scrollView的偏移量:%f",scrollView.contentOffset.y);
//    if (scrollView == self.subScrollView) {
//        NSLog(@"当前加载的是子ScrollView");
//        if (offsetY < 0) {
//            self.mainScrollView.contentOffset = CGPointMake(0, offsetY);
//        }
//    }
//    if (scrollView == self.mainScrollView) {
//        NSLog(@"当前加载的是mainScrollView");
//    }
}

#pragma mark - Private

- (void)test {
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, 375, 300)];
    self.mainScrollView.backgroundColor = [UIColor redColor];
    self.mainScrollView.scrollEnabled = YES;
    self.mainScrollView.delegate = self;
    self.mainScrollView.showsVerticalScrollIndicator = YES;
    self.mainScrollView.contentSize = CGSizeMake(375, 300);
    [self.view addSubview:self.mainScrollView];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -50, 375, 50)];
    topLabel.backgroundColor = [UIColor yellowColor];
    topLabel.text = @"ScrollView 刷新顶部";
    topLabel.textAlignment = NSTextAlignmentCenter;
    [self.mainScrollView addSubview:topLabel];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 150)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"UIScrollView 滑动";
    label.textAlignment = NSTextAlignmentCenter;
    [self.mainScrollView addSubview:label];
    
    self.subScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    self.subScrollView.delegate = self;
    self.subScrollView.contentSize = CGSizeMake(375, 100);
    self.subScrollView.backgroundColor = [UIColor orangeColor];
    [self.mainScrollView addSubview:self.subScrollView];
    
    UILabel *sublabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    sublabel.backgroundColor = [UIColor blueColor];
    sublabel.text = @"子ScrollView 刷新顶部";
    sublabel.textAlignment = NSTextAlignmentCenter;
    [self.subScrollView addSubview:sublabel];
    
//    self.mainScrollView.contentInset = UIEdgeInsetsMake(-50, 0, 0, 0);
//    self.mainScrollView.contentOffset = CGPointMake(0, -50);
    self.subScrollView.contentOffset = CGPointMake(0, -50);
}

- (void)testTableView {
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 300) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mainTableView];
}

@end
