VoovilSideMenu for iOS 7 and XCode 5
==============

<h6>Note: This is my first project on Github!</h6>

**VoovilSideMenu** is a simple SideMenu for iOS 7 Apps. 
This app use ARC, Storyboards, it's works fine with Swipe Gesture and IBAction button.
I have use Modern Objective-C, so you can easily add items to tableview with .plist.
The picture will be automatically rounded with CAlayer.

<h3>Screenshot</h3>
<img src="http://ozcanakbulut.com/images/github/VSideMenu.png"/>

<h2>How-To</h2>

<h4>Change the SideMenu width</h4>
You can set the width on the storyboard, the functions Show/Hide are set with **sideMenu.frame** and **menuTable.frame**.

<h4>Change the picture size</h4>
I have set the CornerRadius to 60.0 because the picture size on the storyboard is 120px.

Example:
You change the size of the picture with storyboard to 220px, than you have to change the
<code>[imageLayer setCornerRadius:60.0];</code> **"60.0"** to **110.0**.

<h4>Change the seperator</h4>
I have use a custom seperator for the tableview with CAlayer.
You can change the size, width and the color of the seperator as follow:

<code>
separator.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.25].CGColor;
</code>
<code>separator.frame = CGRectMake(31, 43, 200, .5);</code>

<h4>Change the row height</h4>
<code>- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
</code>

<h4>Action to didselectrow</h4>
You can use 
<code>if (indexPath.row == 0)</code>
in
<code>-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{</code>

**Example**

<code>
    if (indexPath.row == 0) {
        NSLog(@"Pressed 0");
    }
</code>
<code>
    if (indexPath.row == 1) {
        NSLog(@"Pressed 1");
    }
</code>
<code>
    if (indexPath.row == 2) {
        NSLog(@"Pressed 2");
    }
</code>

Support me
==============

**Donation are recommended**

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2PBR9NFAUAGHS"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG_global.gif"/></a>


**Visit my Website for Tutorials, Sample projects and more!**

<a href="http://ozcanakbulut.com">Özcan Akbulut</a>
