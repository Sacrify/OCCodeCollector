@interface Utility : NSObject

+ (CGFloat)actualFontSize:(UIFont *)font withMinScaleFactor:(CGFloat)minScaleFactor withText:(NSString *)text withinSize:(CGSize)size;

+ (void)downloadFileContent:(NSString *)urlString;

+ (NSAttributedString *)attributedStringByString:(NSString *)string;

@end