//
//  OpenCVWrapper.mm
//  CVTest
//
//  Created by Joseph Skimmons on 5/23/17.
//  Copyright © 2017 Joseph Skimmons. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"

@implementation OpenCVWrapper

//- (IBAction)takePhoto:(UIButton *)sender {
//
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//
//    [self presentViewController: picker animated:YES completion:NULL];
//
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
        
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        
        //self.imageView.image = chosenImage;
        
        cv::Mat img = [self cvMatFromUIImage:chosenImage];
        cv::Mat hsvImage;
        cv::cvtColor(img , hsvImage, CV_BGR2HSV);
        
        cv::Mat mask;
        //cv::inRange(hsvImage, cv::Scalar(0,0,255), cv::Scalar(130,130,255), mask);  //  This picks red color
        cv::inRange(hsvImage, cv::Scalar(0,50,50), cv::Scalar(30,255,255), mask);  //  This picks blue color
        
        //self.imageView.image = [self UIImageFromCVMat:mask];
        
        cv::Mat maskRgb;
        cv::cvtColor(mask, maskRgb, CV_GRAY2BGR);
        
        cv::Mat result;
        //    cv::bitwise_and(img ,maskRgb ,result); // @berak but app crashed at this line
        img.copyTo(result, mask);  //  This line writes the new masked image over the original image, I'm not sure if thats the right way instead of bitwise_and???
        //self.imageView.image = [self UIImageFromCVMat:result];
        
        //...do some processing
        uint8_t *myData = result.data;
        int width = result.cols;
        int count = 0;
        int height = result.rows;
        int _stride = result.step;//in case cols != strides
        for(int i = 0; i < height; i++)
            {
                    for(int j = 0; j < width; j++)
                        {
                                uint8_t val = myData[ i * _stride + j];
                                //do whatever you want with your value
                                if (val > 0) {
                                        count++;
                                    }
                            }
                }
        
        if (count > 200) {
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Nice!"
                                                                                                          message:@"Picture contains Blue"
                                                                                                         delegate:nil
                                                                                                cancelButtonTitle:@"Continue"
                                                                                                otherButtonTitles: nil];
                
                [myAlertView show];
                
            }
        
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
}


/*
 Get cvmatrix from image
 */
-(cv::Mat) cvMatFromUIImage:(UIImage*)image{
        CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
        CGFloat cols = image.size.width;
        CGFloat rows = image.size.height;
        
        cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
        CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,     // Pointer to data
                                                                                                            cols,           // Width of bitmap
                                                                                                            rows,           // Height of bitmap
                                                                                                            8,              // Bits per component
                                                                                                            cvMat.step[0],  // Bytes per row
                                                                                                            colorSpace,     // Color space
                                                                                                            kCGImageAlphaNoneSkipLast
                                                                                                            | kCGBitmapByteOrderDefault); // Bitmap info flags
        
        CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
        CGContextRelease(contextRef);
        return cvMat;
}

-(UIImage *) UIImageFromCVMat:(cv::Mat)cvMat {
        NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
        CGColorSpaceRef colorSpace;
        
        if (cvMat.elemSize() == 1) {
                colorSpace = CGColorSpaceCreateDeviceGray();
            } else {
                    colorSpace = CGColorSpaceCreateDeviceRGB();
                }
        
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
        
        // Creating CGImage from cv::Mat
        CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
                                                                                    cvMat.rows,                                 //height
                                                                                    8,                                          //bits per component
                                                                                    8 * cvMat.elemSize(),                       //bits per pixel
                                                                                    cvMat.step[0],                            //bytesPerRow
                                                                                    colorSpace,                                 //colorspace
                                                                                    kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                                                                    provider,                                   //CGDataProviderRef
                                                                                    NULL,                                       //decode
                                                                                    false,                                      //should interpolate
                                                                                    kCGRenderingIntentDefault                   //intent
                                                                                    );
        
        
        // Getting UIImage from CGImage
        UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        CGDataProviderRelease(provider);
        CGColorSpaceRelease(colorSpace);
        
        return finalImage;
}


@end
