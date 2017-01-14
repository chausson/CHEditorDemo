//
//  ViewController.m
//  CHEditorDemo
//
//  Created by Chausson on 16/11/21.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"
#import "CHEditor.h"
#import "CHEditorTextElement.h"
#import "CHEditCreator.h"
#import <CHImagePicker/CHImagePicker.h>
#import <Masonry/Masonry.h>
@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITextView *textFiled;
@property (strong ,nonatomic) CHEditor *editor;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _editor = [[CHEditor alloc]init];
    _editor.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_editor.view];
  //  _editor.view.delegate = self;
    [_editor.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(25);
        make.left.right.offset(0);
        make.bottom.equalTo(self.bottomView.mas_top).offset(0);
    }];
    [self registerForKeyboardNotifications];
}
- (IBAction)pick:(UIButton *)sender {
    [_textFiled resignFirstResponder];
    [CHImagePicker show:YES picker:self completion:^(UIImage *image) {
        [_editor inputElement:[CHEditCreator createImageElement:image]];
    }];
    if(self.editor.elements.count > 0){
        [_editor.view  scrollToRowAtIndexPath:
         [NSIndexPath indexPathForRow:[self.editor.elements count]-1 inSection:0]
                             atScrollPosition: UITableViewScrollPositionBottom
                                     animated:YES];
    }

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}
- (IBAction)send:(UIButton *)sender {
    if (self.textFiled.text.length > 0) {
        CHEditorTextElement *element = [CHEditCreator createTextElement:self.textFiled.text];
        [_editor inputElement:element];
        self.textFiled.text = nil;
        [_editor.view  scrollToRowAtIndexPath:
         [NSIndexPath indexPathForRow:[self.editor.elements count]-1 inSection:0]
                             atScrollPosition: UITableViewScrollPositionBottom
                                     animated:YES];
    }

}
#pragma mark textfiled Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}
#pragma mark 注册通知
- (void)registerForKeyboardNotifications{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
#pragma mark 键盘显示的监听方法
-(void)keyboardWillShow:(NSNotification *)notif
{
    
    // 获取键盘的位置和大小
    CGRect keyboardBounds;
    [[notif.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];

    if (keyboardBounds.size.height == 0) {
        return;
    }
    [UIView animateWithDuration:0.3f animations:^{

        // 更改输入框的位置
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(60));
            make.left.right.offset(0);
            make.bottom.offset(-(keyboardBounds.size.height));
        }];
        
    }];
  
}

#pragma mark 键盘隐藏的监听方法
-(void)keyboardWillHide:(NSNotification *) note
{
    
    
    [UIView animateWithDuration:0.3f animations:^{
        
        // 更改输入框的位置
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(60));
            make.left.right.offset(0);
            make.bottom.offset(0);
        }];
        
    }];
 
}
- (void)movePostionWithY:(CGFloat )y
                duration:(CGFloat)duration
                   curve:(CGFloat)curve{
    CGRect rect = self.view.frame;
    rect.origin.y =  y;
    // 动画改变位置
    NSLog(@"y=%g",y);
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationCurve:curve];
        // 更改输入框的位置
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(60));
            make.left.right.offset(0);
            make.bottom.offset(y);
        }];
        
    }];
}
@end
