//
//  UILabel+ContentSize.m
//  hkeeping
//
//  Created by jack on 2/24/14.
//  Copyright (c) 2014 jack. All rights reserved.
//

#import "UILabel+ContentSize.h"

@implementation UILabel (ContentSize)


- (CGSize)contentSize {
    
    CGSize contentSize = CGSizeZero;
    if(0)
    {
        self.numberOfLines = 0;
        
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = self.lineBreakMode;
        paragraphStyle.alignment = self.textAlignment;
        NSDictionary * attributes = @{NSFontAttributeName : self.font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
        contentSize = [self.text boundingRectWithSize:self.frame.size
                                                 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                              attributes:attributes
                                                 context:nil].size;
    
      
        CGRect tc = self.frame;
        tc.size.height = contentSize.height;
   
        self.frame = tc;

    }
    else
    {
        self.numberOfLines = 0;
        CGSize sizeToFit = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
        //CGSize  sizeToFit = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        float h = sizeToFit.height+10;
        self.numberOfLines = 0;
        
        CGRect tc = self.frame;
        tc.size.height = h;
        
        self.frame = tc;
        
        contentSize = tc.size;
        
//        self.numberOfLines = 0;
//        CGRect rect = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 1000);
//        CGRect sizeToFit= [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
//        if(sizeToFit.size.height<0)
//            sizeToFit.size.height=0;
//        if (sizeToFit.size.width<0) {
//            sizeToFit.size.width=0;
//        }
//        
//        sizeToFit.size.height +=5;
//        
//        if(sizeToFit.size.height<20)
//            sizeToFit.size.height = 20;
//        
////        CGSize sizeToFit = [self.text sizeWithFont:self.font
////                                      constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
////        float h = sizeToFit.height+5;
//        
////        CGRect tc = self.frame;
////        tc.size.height = h;
//        
//        self.frame = sizeToFit;
//        
//        contentSize = sizeToFit.size;
    }
    
        
    return contentSize;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end