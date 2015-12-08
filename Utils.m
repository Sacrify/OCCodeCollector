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

// Here used encoding could slightly help get encoding.
+ (void)downloadFileContent:(NSString *)urlString {
    NSURL *urlToRequest = [NSURL URLWithString:urlString];
    if (urlToRequest) {
        NSError *err = nil;
        NSStringEncoding encoding;
        NSString *result = [NSString stringWithContentsOfURL:urlToRequest usedEncoding:&encoding error:&err];
        if (err) {
            NSLog(@"%@", err.localizedDescription);
        } else {
            NSLog(@"%@", result);
        }
    }
}

+ (NSAttributedString *)attributedStringByString:(NSString *)string {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"attributedString" ofType:@"plist"]];
    NSError *error = nil;
    NSAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[[dict objectForKey:@"abc"] dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSRTFTextDocumentType} documentAttributes:nil error:&error];
    return attributedString;
}

@end