#import "MainViewController.h"
#import "BTEncryption.h"
#import "HTTPClient.h"
#import "JSONKit.h"


@implementation MainViewController

NSString* const PUBLIC_KEY = @"YOUR_CLIENT_SIDE_ENCRYPTION_KEY";

@synthesize formTable, ccNumberField, ccExpirationField, ccNumberCell, ccExpirationCell, cells;

- (IBAction) formSubmitted:(id) sender {
  HTTPClient * http = [[[HTTPClient alloc] init] autorelease];

  [http postPath: @"/" parameters: [self encryptFormData: [self getFormData]]
    success: ^(AFHTTPRequestOperation * operation, id responseObject) {
      NSDictionary * response = [[JSONDecoder decoder] objectWithData: responseObject];
      [self showAlertWithMessage: [NSString stringWithFormat: @"%@", response]];
    }
    failure: ^(AFHTTPRequestOperation * operation, NSError * error) {
      [self showAlertWithMessage: [NSString stringWithFormat: @"%@", error]];
  }];
}

-(void) showAlertWithMessage: (NSString*) message {
  [[[[  UIAlertView alloc]
      initWithTitle: @"Submitted!"
      message: message
      delegate: self
      cancelButtonTitle: @"Ok! Thanks!"
      otherButtonTitles: nil]
    autorelease]
  show];
}

-(NSDictionary*) encryptFormData:(NSDictionary*) formData {
  BTEncryption *braintree = [[[BTEncryption alloc] initWithPublicKey: PUBLIC_KEY] autorelease];
  NSMutableDictionary *encryptedParams = [[[NSMutableDictionary alloc] init] autorelease];

  [formData enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL * stop) {
    [encryptedParams setObject: [braintree encryptString: object] forKey: key];
  }];

  return encryptedParams;
}

-(NSDictionary*) getFormData {
  NSMutableDictionary *formData = [[[NSMutableDictionary alloc] init] autorelease];
  [formData setObject: ccNumberField.text     forKey: @"cc_number"];
  [formData setObject: ccExpirationField.text forKey: @"cc_exp_date"];
  return formData;
}

- (UITableViewCell*) tableView:(UITableView*) tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [[cells allValues] objectAtIndex: [indexPath row]];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void) viewDidUnload {
  [super viewDidUnload];
  [formTable release];
  [ccNumberField release];
  [ccNumberCell release];
  [ccExpirationField release];
  [ccExpirationCell release];
  [cells release];
}

- (NSInteger)  numberOfSectionsInTableView:(UITableView *)tableView { return 1; }
- (NSInteger)  tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return [cells count]; }
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section { return nil; }
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section { return nil; }

- (void) viewDidLoad {
  cells = [[NSDictionary alloc] initWithObjectsAndKeys:
           ccNumberCell, @"creditCardNumber",
           ccExpirationCell, @"creditCardExpiration", nil];
  [super viewDidLoad];
}

@end