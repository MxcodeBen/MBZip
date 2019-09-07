//
//  ViewController.m
//  MBZipDemo
//
//  Created by hui yao on 2019/9/7.
//  Copyright © 2019 MxcodeBen. All rights reserved.
//

#import "ViewController.h"
#import "MBZip.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *originTextView;
@property (weak, nonatomic) IBOutlet UITextView *zipedTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)zipAction:(id)sender {
    _zipedTextView.text = [_originTextView.text gzipDeflate];
}
- (IBAction)unzipAction:(id)sender {
    _originTextView.text = [_zipedTextView.text gzipInflate];
}

@end
