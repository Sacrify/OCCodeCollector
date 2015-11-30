@implementation Utility

// - (void)adjustButtonsFontSize {
//    CGFloat confirmButtonTitleLabelFontSize = [Utility actualFontSize:self.bodyButtonFont withMinScaleFactor:self.bodyView.confirmButton.titleLabel.minimumScaleFactor withText:self.bodyView.confirmButton.titleLabel.text withinSize:[self.bodyView.confirmButton titleRectForContentRect: [self.bodyView.confirmButton contentRectForBounds:self.bodyView.confirmButton.bounds]].size];

//    CGFloat shareButtonTitleLabelFontSize = [Utility actualFontSize:self.bodyButtonFont withMinScaleFactor:self.bodyView.shareButton.titleLabel.minimumScaleFactor withText:self.bodyView.shareButton.titleLabel.text withinSize:[self.bodyView.shareButton titleRectForContentRect:[self.bodyView.shareButton contentRectForBounds:self.bodyView.shareButton.bounds]].size];

//    CGFloat fontSizeUse = MIN(confirmButtonTitleLabelFontSize, shareButtonTitleLabelFontSize);
//    self.bodyView.confirmButton.titleLabel.font = [UIFont fontWithName:self.bodyView.confirmButton.titleLabel.font.fontName size:fontSizeUse];
//    self.bodyView.shareButton.titleLabel.font = [UIFont fontWithName:self.bodyView.shareButton.titleLabel.font.fontName size:fontSizeUse];
//}

+ (CGFloat)actualFontSize:(UIFont *)font withMinScaleFactor:(CGFloat)minScaleFactor withText:(NSString *)text withinSize:(CGSize)size {
    NSDictionary *attributes = @{NSFontAttributeName : font};
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text
                                                                           attributes:attributes];
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    context.minimumScaleFactor = minScaleFactor;
    [attributedString boundingRectWithSize:size
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                   context:context];
    return font.pointSize * context.actualScaleFactor;
}

@end