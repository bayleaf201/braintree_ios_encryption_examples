@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
  UITableView * formTable;
  UITableViewCell * ccNumberCell;
  UITableViewCell * ccExpirationCell;
  UITextField * ccNumberField;
  UITextField * ccExpirationField;
  NSDictionary * cells;
}

extern NSString * const PUBLIC_KEY;

// outlets
@property(nonatomic, retain) IBOutlet UITableView * formTable;
@property(nonatomic, retain) IBOutlet UITableViewCell * ccNumberCell;
@property(nonatomic, retain) IBOutlet UITableViewCell * ccExpirationCell;
@property(nonatomic, retain) IBOutlet UITextField * ccNumberField;
@property(nonatomic, retain) IBOutlet UITextField * ccExpirationField;

// internal data
@property(nonatomic, retain) NSDictionary * cells;

// methods
-(IBAction) formSubmitted:(id) sender;
-(void) showAlertWithMessage:(NSString*) message;
-(NSDictionary*) getFormData;
-(NSDictionary*) encryptFormData:(NSDictionary*) formData;

@end
