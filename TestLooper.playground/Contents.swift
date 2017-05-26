//Nick Gattuso, a playground file to make a test algorithm that will be implemented within the color detection app
//5/26/17

import UIKit

//basic Color object, which has the name of the color, and then a cv_val. The cv_val can be changeed to a different object, im not sure how
//  that scalar is set up/will be set up. If it needs to be changed, and example of this can be maybe be represented under the Color Class..

class Color{
    var color_word: String;
    var cv_val: Int;
    
    init(text: String, value: Int) {
        self.color_word = text;
        self.cv_val = value;
    }
    
    init(default_text: String, default_val: Int){
        self.color_word = default_text;
        self.cv_val = default_val;
        
    }
    
}


//class CV_Scalars{
//    var R: Int;
//    var G: Int;
//    var B: Int;
//    
//    init(red: Int, green: Int, blue: Int){
//        self.R = red;
//        self.G = green;
//        self.B = blue;
//    }
//    
//    init(default_val: Int){
//        self.R = default_val;
//        self.G = default_val;
//        self.B = default_val;
//    }
//    
//}

//and then the Color class might look something like this

//class Color_2{
//    var color_word: String;
//    var cv_val: CV_Scalars;
//    
//    init(text: String, value: CV_Scalars) {
//        self.color_word = text;
//        self.cv_val = value;
//    }
//    
//    init(default_text: String, default_val: CV_Scalars){
//        self.color_word = default_text;
//        self.cv_val = default_val;
//        
//    }
//    
//}

//with maybe its array initalization looking something like this

//var color_list: [Color] = [Color(text: "Blue", value: CV_Scalars(red: 10, green: 2, blue: 6))]



var size = 4; //size of the array WILL CHANGE DEPENDING ON THE ARRAY OBVIOUSLY

var color_list: [Color] = [Color(text: "Blue", value: 10), Color(text: "Red", value: 2), Color(text: "white", value: 255), Color(text: "Black", value: 0)] // the color list, we can add a bunch of colors using the above format
var hold_item = Color(default_text: "NULL", default_val: 0); //used for the getColor() function
var item = Color(default_text: "NULL", default_val: 0); //used for the getColor function


//this function retrieves a new color, while also maintaing that the previous color will not reappear next
//  so we wont get "Point you phone at something Red" .. "Nice!" .. "Point you phone at something Red"
//the return value is the color that you will prompt for next..
func getColor() -> Color {
    let it = Int(Int(arc4random()) % size);
    hold_item = color_list.remove(at: it)
    size-=1;
    
    if item.color_word != "NULL"{
        color_list.append(item);
        size+=1;
    }
    item = hold_item;
    return item;
}

//Test cases to show that it works, and that the same color will never be repeated twice
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)
print(getColor().color_word)


