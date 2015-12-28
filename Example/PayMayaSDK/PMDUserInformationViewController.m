//
//  PMDUserInformationViewController.m
//  PayMayaSDKDemo
//
//  Created by Elijah Cayabyab on 02/11/2015.
//  Copyright © 2015 Elijah Joshua Cayabyab. All rights reserved.
//

#import "PMDUserInformationViewController.h"
#import "PMDProduct.h"
#import "PayMayaSDK.h"

@interface PMDUserInformationViewController () <PayMayaCheckoutDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollViewContentView;
@property (nonatomic, strong) UILabel *personalInformationLabel;
@property (nonatomic, strong) UITextField *firstNameTextField;
@property (nonatomic, strong) UITextField *middleNameTextField;
@property (nonatomic, strong) UITextField *lastNameTextField;
@property (nonatomic, strong) UILabel *contactInformationLabel;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UILabel *addressInformationLabel;
@property (nonatomic, strong) UITextField *line1TextField;
@property (nonatomic, strong) UITextField *line2TextField;
@property (nonatomic, strong) UITextField *cityTextField;
@property (nonatomic, strong) UITextField *stateTextField;
@property (nonatomic, strong) UITextField *zipCodeTextField;
@property (nonatomic, strong) UITextField *countryTextField;
@property (nonatomic, strong) UIButton *checkoutButton;

@property (nonatomic, strong) NSDictionary *cartInformation;

@end

@implementation PMDUserInformationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil cartInformation:(id)cartInformation
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.cartInformation = cartInformation;
    }
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.canCancelContentTouches = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.scrollView];
    
    self.scrollViewContentView = [[UIView alloc] init];
    self.scrollViewContentView.backgroundColor = [UIColor clearColor];
    self.scrollViewContentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.scrollViewContentView];
    
    self.personalInformationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.personalInformationLabel.text = @"Personal Information";
    self.personalInformationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollViewContentView addSubview:self.personalInformationLabel];
    
    self.firstNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.firstNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstNameTextField.borderStyle = UITextBorderStyleLine;
    self.firstNameTextField.layer.borderWidth = 1;
    self.firstNameTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.firstNameTextField.text = @"Elijah Joshua";
    [self.scrollViewContentView addSubview:self.firstNameTextField];
    
    self.middleNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.middleNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.middleNameTextField.borderStyle = UITextBorderStyleLine;
    self.middleNameTextField.layer.borderWidth = 1;
    self.middleNameTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.middleNameTextField.text = @"Barboza";
    [self.scrollViewContentView addSubview:self.middleNameTextField];
    
    self.lastNameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.lastNameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastNameTextField.borderStyle = UITextBorderStyleLine;
    self.lastNameTextField.layer.borderWidth = 1;
    self.lastNameTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.lastNameTextField.text = @"Cayabyab";
    [self.scrollViewContentView addSubview:self.lastNameTextField];
    
    self.contactInformationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.contactInformationLabel.text = @"Contact Information";
    self.contactInformationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollViewContentView addSubview:self.contactInformationLabel];
    
    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.phoneTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneTextField.borderStyle = UITextBorderStyleLine;
    self.phoneTextField.layer.borderWidth = 1;
    self.phoneTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.phoneTextField.text = @"+639284457524";
    [self.scrollViewContentView addSubview:self.phoneTextField];
    
    self.emailTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.emailTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.emailTextField.borderStyle = UITextBorderStyleLine;
    self.emailTextField.layer.borderWidth = 1;
    self.emailTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.emailTextField.text = @"ebcayabyab@voyagerinnovation.com";
    [self.scrollViewContentView addSubview:self.emailTextField];

    self.addressInformationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.addressInformationLabel.text = @"Address Information";
    self.addressInformationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollViewContentView addSubview:self.addressInformationLabel];
    
    self.line1TextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.line1TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.line1TextField.borderStyle = UITextBorderStyleLine;
    self.line1TextField.layer.borderWidth = 1;
    self.line1TextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.line1TextField.text = @"12F, 23 ADB Avenue, Anson's Building";
    [self.scrollViewContentView addSubview:self.line1TextField];
    
    self.line2TextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.line2TextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.line2TextField.borderStyle = UITextBorderStyleLine;
    self.line2TextField.layer.borderWidth = 1;
    self.line2TextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.line2TextField.text = @"Ortigas Center";
    [self.scrollViewContentView addSubview:self.line2TextField];
    
    self.cityTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.cityTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.cityTextField.borderStyle = UITextBorderStyleLine;
    self.cityTextField.layer.borderWidth = 1;
    self.cityTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.cityTextField.text = @"Pasig City";
    [self.scrollViewContentView addSubview:self.cityTextField];
    
    self.stateTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.stateTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.stateTextField.borderStyle = UITextBorderStyleLine;
    self.stateTextField.layer.borderWidth = 1;
    self.stateTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.stateTextField.text = @"Metro Manila";
    [self.scrollViewContentView addSubview:self.stateTextField];
    
    self.zipCodeTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.zipCodeTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.zipCodeTextField.borderStyle = UITextBorderStyleLine;
    self.zipCodeTextField.layer.borderWidth = 1;
    self.zipCodeTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.zipCodeTextField.text = @"1605";
    [self.scrollViewContentView addSubview:self.zipCodeTextField];
    
    self.countryTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.countryTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.countryTextField.borderStyle = UITextBorderStyleLine;
    self.countryTextField.layer.borderWidth = 1;
    self.countryTextField.layer.borderColor = [[UIColor grayColor] CGColor];
    self.countryTextField.text = @"PH";
    [self.scrollViewContentView addSubview:self.countryTextField];
    
    self.checkoutButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.checkoutButton.enabled = YES;
    self.checkoutButton.layer.cornerRadius = 3.0f;
    self.checkoutButton.layer.borderWidth = 0.5f;
    self.checkoutButton.clipsToBounds = YES;
    self.checkoutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.checkoutButton setTitle:@"Checkout" forState:UIControlStateNormal];
    [self.checkoutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.checkoutButton addTarget:self action:@selector(checkoutButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollViewContentView addSubview:self.checkoutButton];

    [self setUpLayoutConstraints];
}

- (void)setUpLayoutConstraints
{
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(
                                                                   _scrollView,
                                                                   _scrollViewContentView,
                                                                   _personalInformationLabel,
                                                                   _firstNameTextField,
                                                                   _middleNameTextField,
                                                                   _lastNameTextField,
                                                                   _contactInformationLabel,
                                                                   _phoneTextField,
                                                                   _emailTextField,
                                                                   _addressInformationLabel,
                                                                   _line1TextField,
                                                                   _line2TextField,
                                                                   _cityTextField,
                                                                   _stateTextField,
                                                                   _zipCodeTextField,
                                                                   _countryTextField,
                                                                   _checkoutButton
                                                                   );
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollViewContentView(==_scrollView)]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollViewContentView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
    
    [self.scrollViewContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_personalInformationLabel]-30-[_firstNameTextField]-[_middleNameTextField]-[_lastNameTextField]-30-[_contactInformationLabel]-30-[_phoneTextField]-[_emailTextField]-30-[_addressInformationLabel]-30-[_line1TextField]-[_line2TextField]-[_cityTextField]-[_stateTextField]-[_zipCodeTextField]-[_countryTextField]" options:(NSLayoutFormatAlignAllLeading | NSLayoutFormatAlignAllTrailing) metrics:nil views:viewsDictionary]];
     [self.scrollViewContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_countryTextField]-30-[_checkoutButton]-30-|" options:0 metrics:nil views:viewsDictionary]];
    [self.scrollViewContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_personalInformationLabel]-|" options:NSLayoutFormatAlignAllTrailing metrics:nil views:viewsDictionary]];
    [self.scrollViewContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_checkoutButton(150)]" options:NSLayoutFormatAlignAllTrailing metrics:nil views:viewsDictionary]];
    [self.scrollViewContentView addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollViewContentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.checkoutButton attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"User Information";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self unregisterForKeyboardNotifications];
}

- (void)checkoutButtonClicked:(id)sender
{
    NSDictionary *totalAmount = @{
                                  @"currency" : @"PHP",
                                  @"value" : [self.cartInformation[@"total"] stringValue],
                                  @"details" : @{
                                          @"shippingFee" : [self.cartInformation[@"shippingFee"] stringValue],
                                          @"tax" : [self.cartInformation[@"tax"] stringValue],
                                          @"subtotal" : [self.cartInformation[@"subtotal"] stringValue]
                                          }
                                  };
    
    NSDictionary *address = @{
                              @"line1" : self.line1TextField.text,
                              @"line2" : self.line2TextField.text,
                              @"city" : self.cityTextField.text,
                              @"state" : self.stateTextField.text,
                              @"zipCode" : self.zipCodeTextField.text,
                              @"countryCode" : self.countryTextField.text
                              };
    
    NSDictionary *buyer = @{
                            @"firstName" : self.firstNameTextField.text,
                            @"middleName" : self.middleNameTextField.text,
                            @"lastName" : self.lastNameTextField.text,
                            @"contact" : @{
                                    @"phone" : self.phoneTextField.text,
                                    @"email" : self.emailTextField.text
                                    },
                            @"shippingAddress" : address,
                            @"billingAddress" : address
                            };
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSDictionary *productInfo in self.cartInformation[@"products"]) {
        PMDProduct *product = (PMDProduct *)productInfo[@"product"];
        NSDictionary *item = @{
                               @"name" : product.name,
                               @"code" : product.code,
                               @"description" : product.itemDescription,
                               @"quantity" : [productInfo[@"quantity"] stringValue],
                               @"amount" : @{
                                       @"value" : [product.amount stringValue]
                                       },
                               @"totalAmount" : @{
                                       @"value" : [productInfo[@"totalAmount"] stringValue]
                                       }
                               };
        [items addObject:item];
    }
    
    NSDictionary *checkoutDictionary = @{
                                         @"totalAmount" : totalAmount,
                                         @"buyer" : buyer,
                                         @"items" : items,
                                         @"requestReferenceNumber" : @"123456789"
                                         };
    
    PMSDKCheckoutInformation *checkoutInformation = [[PMSDKCheckoutInformation alloc] initWithDictionary:checkoutDictionary];
    [[PayMayaSDK sharedInstance] checkout:checkoutInformation delegate:self];
}

#pragma mark - Keyboard Handling Methods

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    CGSize keyboardSize = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0.0, keyboardSize.height + 10, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(self.scrollView.contentInset.top, 0.0, 0.0, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - PayMayaCheckoutDelegate

- (void)checkoutDidFinishWithResult:(PMSDKCheckoutResult *)result
{
    NSString *checkoutStatus;
    
    if (result.status == PMSDKCheckoutStatusUnknown) {
        checkoutStatus = @"Status Unknown";
    }
    else if (result.status == PMSDKCheckoutStatusCanceled) {
        checkoutStatus = @"Status Canceled";
    }
    else if (result.status == PMSDKCheckoutStatusFailed) {
        checkoutStatus = @"Status Failed";
    }
    else if (result.status == PMSDKCheckoutStatusSuccess) {
        checkoutStatus = @"Status Success";
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Checkout Status"
                                                                   message:checkoutStatus
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)checkoutDidFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
}

@end