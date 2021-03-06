//
//  ViewController.m
//  AssocRef
//
//  Created by Rob Napier on 9/14/11.
//  This code is licensed under the MIT License:
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "ViewController.h"
#import <objc/runtime.h>

@implementation ViewController

static const char kRepresentedObject;

- (IBAction)doSomething:(id)sender {
  UIAlertView *alert = [[UIAlertView alloc]
                        initWithTitle:@"Alert" message:nil
                        delegate:self
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil];
  objc_setAssociatedObject(alert, &kRepresentedObject, 
                           sender,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  [alert show];
  
}

- (void)alertView:(UIAlertView *)alertView 
clickedButtonAtIndex:(NSInteger)buttonIndex {
  UIButton *sender = objc_getAssociatedObject(alertView, 
                                              &kRepresentedObject);
  self.buttonLabel.text = [[sender titleLabel] text];
}
@end
