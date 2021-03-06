#import "PartOfHistoryViewController.h"
#import "ProductDescriptionViewCell.h"

@interface PartOfHistoryViewController ()

@property BOOL isInfoOfOrderShow;
@property BOOL isInfoOfProductInOrder;

@property float firstContainerX;
@property float firstContainerY;
@property float firstContainerWidth;
@property float firstContainerHeight;

@property float secondContainerX;
@property float secondContainerY;
@property float secondContainerWidth;
@property float secondContainerHeight;

@property float tempFirstContainerY;
@property NSString *reorderButtonTraslation;
@end

@implementation PartOfHistoryViewController
@synthesize messageLabel = _messageLabel;
@synthesize rowNumber = _rowNumber;
@synthesize tempStr = _tempStr;
@synthesize scrollView = _scrollView;
@synthesize infoOfOrderContainer = _infoOfOrderContainer;
@synthesize mainView = _mainView;
@synthesize infoOfOrderContainerInnerView = _infoOfOrderContainerInnerView;
@synthesize showOrHideButtonFirst = _showOrHideButtonFirst;
@synthesize infoOfOrderDetailView = _infoOfOrderDetailView;
@synthesize infoOfProductInOrderContainer = _infoOfProductInOrderContainer;
@synthesize infoOfProductInOrderInnerView = _infoOfProductInOrderInnerView;
@synthesize showOrHideButtonSecond = _showOrHideButtonSecond;
@synthesize infoOfProductInOrderDetailView = _infoOfProductInOrderDetailView;
//@synthesize tempLabel2 = _tempLabel2;
@synthesize isInfoOfOrderShow = _isInfoOfOrderShow;
@synthesize firstContainerX = _firstContainerX;
@synthesize firstContainerY = _firstContainerY;
@synthesize firstContainerWidth = _firstContainerWidth;
@synthesize firstContainerHeight = _firstContainerHeight;
@synthesize secondContainerX = _secondContainerX;
@synthesize secondContainerY = _secondContainerY;
@synthesize secondContainerWidth = _secondContainerWidth;
@synthesize secondContainerHeight = _secondContainerHeight;
@synthesize tempFirstContainerY = _tempFirstContainerY;
@synthesize historyDictionary = _historyDictionary;
@synthesize addressLabel = _addressLabel;
@synthesize cityLabel = _cityLabel;
//@synthesize metroLabel = _metroLabel;
@synthesize additionalLabel = _additionalLabel;
@synthesize addressDescriptionLabel = _addressDescriptionLabel;
@synthesize cityDescriptionLabel = _cityDescriptionLabel;
//@synthesize metroDescriptionLabel = _metroDescriptionLabel;
@synthesize additionalDescriptionLabel = _additionalDescriptionLabel;
@synthesize db = _db;
@synthesize productName = _productName;
@synthesize productsArray = _productsArray;
@synthesize orderNumberLabel = _orderNumberLabel;
@synthesize reorderButton = _reorderButton;
@synthesize labelOrderNumber = _labelOrderNumber;
@synthesize totalPriceVar = _totalPriceVar;
@synthesize totalPriceVarWithDiscount = _totalPriceVarWithDiscount;
@synthesize deliveryAddress = _deliveryAddress;
@synthesize youAreOrdered = _youAreOrdered;
@synthesize reorderButtonTraslation = _reorderButtonTraslation;
- (GettingCoreContent *)db
{
    if(!_db)
    {
        _db = [[GettingCoreContent alloc] init];
    }
    return  _db;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
    [self setAllTitlesOnThisPage];
    
    
    [_reorderButton setTitle:_reorderButtonTraslation forState:UIControlStateNormal];
    CAGradientLayer *mainGradient = [CAGradientLayer layer];
    mainGradient.frame = self.mainView.bounds;
    mainGradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor darkGrayColor] CGColor],(id)[[UIColor blackColor] CGColor], nil];
    [self.mainView.layer insertSublayer:mainGradient atIndex:0];
    
    [self.orderNumberLabel setText:[NSString stringWithFormat:@"%@ %@", _labelOrderNumber, [self.historyDictionary valueForKey:@"orderID"]]];
    
    self.firstContainerX = self.infoOfOrderContainer.frame.origin.x;
    self.firstContainerY = self.infoOfOrderContainer.frame.origin.y;
    self.firstContainerWidth = self.infoOfOrderContainer.frame.size.width;
    self.firstContainerHeight = self.infoOfOrderContainer.frame.size.height;
        
    self.secondContainerX = self.infoOfProductInOrderContainer.frame.origin.x;
    self.secondContainerY = self.infoOfProductInOrderContainer.frame.origin.y;
    self.secondContainerWidth = self.infoOfProductInOrderContainer.frame.size.width;
    self.secondContainerHeight = self.infoOfProductInOrderContainer.frame.size.height;
    
    self.infoOfOrderContainerInnerView.frame = CGRectMake(0, 1, self.firstContainerWidth, self.firstContainerHeight - 2);
//    self.infoOfOrderDetailView.frame = CGRectMake(20, 30, 272, self.tempLabel.frame.size.height + 10);
    self.infoOfOrderDetailView.frame = CGRectMake(15, 40, 290, self.additionalDescriptionLabel.frame.origin.y + self.additionalDescriptionLabel.frame.size.height + 10);
    
    self.infoOfProductInOrderInnerView.frame = CGRectMake(0, 1, self.secondContainerWidth, self.secondContainerHeight - 2);
//    [self.tempLabel2 sizeToFit];
//    self.infoOfProductInOrderDetailView.frame = CGRectMake(20, 30, 272, self.tempLabel2.frame.size.height + 10);
    
    
    [self.scrollView setScrollEnabled:YES];
//    [self.scrollView setContentSize:CGSizeMake(320 , 440)];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    
//    self.addressDescriptionLabel.text = [self.historyDictionary valueForKey:@"street"];
        
    self.addressDescriptionLabel.text = [NSString stringWithFormat:@"%@%@%@%@%@", [self.historyDictionary valueForKey:@"street"], @", ", [self.historyDictionary valueForKey:@"house"], @"/", [self.historyDictionary valueForKey:@"room_office"]];
    self.cityDescriptionLabel.text = [self.historyDictionary valueForKey:@"city"];
//    self.metroDescriptionLabel.text = [self.historyDictionary valueForKey:@"metro"];
    self.additionalDescriptionLabel.text = [self.historyDictionary valueForKey:@"additional_info"];
    
//    self.productName.text = [[[[self.productsArray objectAtIndex:0] valueForKey:@"resultArray"] objectAtIndex:1] valueForKey:@"nameText"];
//    self.productsCount.text = [[self.productsArray objectAtIndex:0] valueForKey:@"count"];
//    int productCount = [[self.historyDictionary valueForKey:@"productsCounts"] intValue];
//    float productPrice = [[[[[self.productsArray objectAtIndex:0] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"price"] floatValue];
//    self.productPriceSumm.text = [NSString stringWithFormat:@"%6.2f", productCount * productPrice];
    
    NSMutableArray *viewCellArray = [[NSMutableArray alloc] init];
    ProductDescriptionViewCell *viewCell;
    float viewCellSumHeight = 0;
    float totalProductPrice = 0;
    float totalProductPriceWithDiscount = 0;
    
    for (int i = 0; i < self.productsArray.count; i++) {
        if (i == 0) {
            viewCell = [[ProductDescriptionViewCell alloc] init];
            viewCell.productName.text = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:1] valueForKey:@"nameText"];
            viewCell.productCount.text = [[self.productsArray objectAtIndex:i] valueForKey:@"count"];
            int productCount = [viewCell.productCount.text intValue];
            float productPrice = [[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"price"] floatValue] * [[[NSUserDefaults standardUserDefaults] objectForKey:@"CurrencyCoefficient"] floatValue];
            viewCell.productPriceSum.text = [NSString stringWithFormat:@"%6.2f %@", productCount * productPrice, [[NSUserDefaults standardUserDefaults] objectForKey:@"Currency"]];
            totalProductPrice = totalProductPrice + viewCell.productPriceSum.text.floatValue;
            float discountCoeficient = [self.db fetchDiscountByIdDiscount:[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"idDiscount"]].floatValue;
            totalProductPriceWithDiscount = totalProductPriceWithDiscount + viewCell.productPriceSum.text.floatValue - (viewCell.productPriceSum.text.floatValue * discountCoeficient);
            [viewCell.productName sizeToFit];
            [viewCell setFrame:CGRectMake(0, 40, 272, viewCell.productName.frame.size.height)];
            [viewCell.lineSeparator setFrame:CGRectMake(199, 0, 1, viewCell.productName.frame.size.height)];
            
            viewCellSumHeight = viewCellSumHeight + viewCell.frame.size.height;
            
            [self.infoOfProductInOrderDetailView addSubview:viewCell];
            [viewCellArray addObject:viewCell];
        }
        else {
            viewCell = [[ProductDescriptionViewCell alloc] init];
            viewCell.productName.text = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:1] valueForKey:@"nameText"];
            viewCell.productCount.text = [[self.productsArray objectAtIndex:i] valueForKey:@"count"];
            int productCount = [viewCell.productCount.text intValue];
            float productPrice = [[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"price"] floatValue] * [[[NSUserDefaults standardUserDefaults] objectForKey:@"CurrencyCoefficient"] floatValue];
            viewCell.productPriceSum.text = [NSString stringWithFormat:@"%6.2f %@", productCount * productPrice, [[NSUserDefaults standardUserDefaults] objectForKey:@"Currency"]];
            totalProductPrice = totalProductPrice + viewCell.productPriceSum.text.floatValue;
            float discountCoeficient = [self.db fetchDiscountByIdDiscount:[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"idDiscount"]].floatValue;
            totalProductPriceWithDiscount = totalProductPriceWithDiscount + viewCell.productPriceSum.text.floatValue - (viewCell.productPriceSum.text.floatValue * discountCoeficient);
            [viewCell.productName sizeToFit];
            float previousY = [[viewCellArray objectAtIndex:i - 1] frame].origin.y;
            float previousH = [[viewCellArray objectAtIndex:i - 1] frame].size.height;
            [viewCell setFrame:CGRectMake(0, previousY + previousH, 272, viewCell.productName.frame.size.height)];
            [viewCell.lineSeparator setFrame:CGRectMake(199, 0, 1, viewCell.productName.frame.size.height)];
            
            viewCellSumHeight = viewCellSumHeight + viewCell.frame.size.height;

            [self.infoOfProductInOrderDetailView addSubview:viewCell];
            [viewCellArray addObject:viewCell];
        }
    }
    
    _totalPriceSumCaption = [[UILabel alloc] initWithFrame:CGRectMake(121, 40 + viewCellSumHeight + 10, 70, 15)];
    [_totalPriceSumCaption setFont:[UIFont systemFontOfSize:13]];
    [_totalPriceSumCaption setTextColor:[UIColor darkGrayColor]];
    [_totalPriceSumCaption setBackgroundColor:[UIColor clearColor]];
    _totalPriceSumCaption.textAlignment = UIControlContentHorizontalAlignmentRight;
    [_totalPriceSumCaption setText: _totalPriceVar];
    [self.infoOfProductInOrderDetailView addSubview:_totalPriceSumCaption];
    
    UILabel *totalPriceSumValue = [[UILabel alloc] initWithFrame:CGRectMake(_totalPriceSumCaption.frame.origin.x + _totalPriceSumCaption.frame.size.width, _totalPriceSumCaption.frame.origin.y, 90, _totalPriceSumCaption.frame.size.height)];
    totalPriceSumValue.text = [NSString stringWithFormat:@"%7.2f %@", totalProductPrice, [[NSUserDefaults standardUserDefaults] objectForKey:@"Currency"]];
    [totalPriceSumValue setFont:[UIFont boldSystemFontOfSize:13]];
    [totalPriceSumValue setBackgroundColor:[UIColor clearColor]];
    [self.infoOfProductInOrderDetailView addSubview:totalPriceSumValue];
    
    _totalPriceSumWithDiscountCaption = [[UILabel alloc] initWithFrame:CGRectMake(100, _totalPriceSumCaption.frame.origin.y + _totalPriceSumCaption.frame.size.height, 92, _totalPriceSumCaption.frame.size.height)];
    _totalPriceSumWithDiscountCaption.textAlignment = UIControlContentHorizontalAlignmentRight;
    _totalPriceSumWithDiscountCaption.text = _totalPriceVarWithDiscount;
    [_totalPriceSumWithDiscountCaption setFont:[UIFont systemFontOfSize:13]];
    [_totalPriceSumWithDiscountCaption setTextColor:[UIColor orangeColor]];
    [_totalPriceSumWithDiscountCaption setBackgroundColor:[UIColor clearColor]];
    [self.infoOfProductInOrderDetailView addSubview:_totalPriceSumWithDiscountCaption];

    
    UILabel *totalPriceSumWithDiscountValue = [[UILabel alloc] initWithFrame:CGRectMake(_totalPriceSumWithDiscountCaption.frame.origin.x + _totalPriceSumWithDiscountCaption.frame.size.width, _totalPriceSumWithDiscountCaption.frame.origin.y, 92, _totalPriceSumWithDiscountCaption.frame.size.height)];
    totalPriceSumWithDiscountValue.text = [NSString stringWithFormat:@"%7.2f %@", totalProductPriceWithDiscount, [[NSUserDefaults standardUserDefaults] objectForKey:@"Currency"]];
    [totalPriceSumWithDiscountValue setFont:[UIFont boldSystemFontOfSize:13]];
    [totalPriceSumWithDiscountValue setBackgroundColor:[UIColor clearColor]];
    [self.infoOfProductInOrderDetailView addSubview:totalPriceSumWithDiscountValue];
    
    self.infoOfProductInOrderDetailView.frame = CGRectMake(15, 40, 290, _totalPriceSumWithDiscountCaption.frame.origin.y + _totalPriceSumWithDiscountCaption.frame.size.height + 10);
    
    int curentNumberOfStatus;
    
    for (int i = 0; [[self.db fetchAllObjectsFromEntity:@"Statuses"] count]; i++) {
        
        NSString *str1 = [[[[self.db fetchAllObjectsFromEntity:@"Statuses"] objectAtIndex:i] valueForKey:@"underbarid"] stringValue];
        NSString *str2 = [NSString stringWithFormat:@"%@", [self.historyDictionary valueForKey:@"statusID"]];
        
        if ([str1 isEqualToString:str2]) {
            curentNumberOfStatus = [[[[self.db fetchAllObjectsFromEntity:@"Statuses"] objectAtIndex:i] valueForKey:@"value"] intValue];
            break;
        }
        
    }
    
    NSArray *sortedStatusArray = [self.db getArrayFromCoreDatainEntetyName:@"Statuses" withSortDescriptor:@"value"];
    
    int countOfStatus = [[self.db fetchAllObjectsFromEntity:@"Statuses"] count] - 1;
    
    NSMutableArray *arrowArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < countOfStatus; i++) {
                
        if (i == 0) {
            UIImageView *firstArrow = [[UIImageView alloc] initWithFrame:CGRectMake(5, 40, 315 / countOfStatus + ((countOfStatus - 1) * 10)/countOfStatus, 50)];
            if (curentNumberOfStatus == 1) {
                [firstArrow setImage:[UIImage imageNamed:@"arrow1_green.png"]];
                [self.scrollView addSubview:firstArrow];
                [arrowArray addObject:firstArrow];
                
                NSString *str = [NSString stringWithFormat:@"%@", [[sortedStatusArray objectAtIndex:i + 2] valueForKey:@"underbarid"]];
                NSArray *tempArray = [self.db fetchStatusForOrder:str];
                NSString *compareString = [NSString stringWithFormat:@"%@", [[tempArray objectAtIndex:0] valueForKey:@"value"]];
                if ([compareString isEqualToString:@"1"]) {
                    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:i] frame].origin.x, [[arrowArray objectAtIndex:i] frame].origin.y + [[arrowArray objectAtIndex:i] frame].size.height, [[arrowArray objectAtIndex:i] frame].size.width, 21)];
                    [statusLabel setText:[[tempArray objectAtIndex:1] valueForKey:@"name"]];
                    [statusLabel setTextColor:[UIColor whiteColor]];
                    [statusLabel setFont:[UIFont systemFontOfSize:12]];
                    [statusLabel setTextAlignment:NSTextAlignmentCenter];
                    [statusLabel setBackgroundColor:[UIColor clearColor]];
                    [self.scrollView addSubview:statusLabel];
        }
        
            } else {
                [firstArrow setImage:[UIImage imageNamed:@"arrow1_red.png"]];
                [self.scrollView addSubview:firstArrow];
                [arrowArray addObject:firstArrow];
            }
        } else {
            if (i == countOfStatus - 1) {
                UIImageView *lastArrow = [[UIImageView alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:i - 1] frame].origin.x + [[arrowArray objectAtIndex:i - 1] frame].size.width - 10, 40, 315 / countOfStatus + ((countOfStatus - 1) * 10)/countOfStatus, 50)];
                if (curentNumberOfStatus == 0) {
                    [lastArrow setImage:[UIImage imageNamed:@"arrow3_green.png"]];
                    [self.scrollView addSubview:lastArrow];
                    [arrowArray addObject:lastArrow];
                    for (int i = 0; i < arrowArray.count - 1; i++) {
                        if (i == 0) {
                            [[arrowArray objectAtIndex:i] setImage:[UIImage imageNamed:@"arrow1_green.png"]];
                        } else {
                            if (i == arrowArray.count - 1) {
                                [[arrowArray objectAtIndex:i] setImage:[UIImage imageNamed:@"arrow3_green.png"]];
                            } else {
                                [[arrowArray objectAtIndex:i] setImage:[UIImage imageNamed:@"arrow2_green.png"]];
                            }
                        }
                    }
                    
                    UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:arrowArray.count - 1] frame].origin.x, [[arrowArray objectAtIndex:arrowArray.count - 1] frame].origin.y + [[arrowArray objectAtIndex:arrowArray.count - 1] frame].size.height, [[arrowArray objectAtIndex:arrowArray.count - 1] frame].size.width, 21)];
                    NSArray *tempArray = [self.db fetchStatusForOrder:@"2"];
                    [statusLabel setText:[[tempArray objectAtIndex:1] valueForKey:@"name"]];
                    [statusLabel setTextColor:[UIColor whiteColor]];
                    [statusLabel setFont:[UIFont systemFontOfSize:12]];
                    [statusLabel setTextAlignment:NSTextAlignmentCenter];
                    [statusLabel setBackgroundColor:[UIColor clearColor]];
                    [self.scrollView addSubview:statusLabel];

                } else {
                    
                    if (curentNumberOfStatus == -1) {
                        [lastArrow setImage:[UIImage imageNamed:@"arrow3_cancel_red.png"]];
                        [self.scrollView addSubview:lastArrow];
                        [arrowArray addObject:lastArrow];
                        
                        UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:arrowArray.count - 1] frame].origin.x, [[arrowArray objectAtIndex:arrowArray.count - 1] frame].origin.y + [[arrowArray objectAtIndex:arrowArray.count - 1] frame].size.height, [[arrowArray objectAtIndex:arrowArray.count - 1] frame].size.width, 21)];
                        NSArray *tempArray = [self.db fetchStatusForOrder:@"1"];
                        [statusLabel setText:[[tempArray objectAtIndex:1] valueForKey:@"name"]];
                        [statusLabel setTextColor:[UIColor whiteColor]];
                        [statusLabel setFont:[UIFont systemFontOfSize:12]];
                        [statusLabel setTextAlignment:NSTextAlignmentCenter];
                        [statusLabel setBackgroundColor:[UIColor clearColor]];
                        [self.scrollView addSubview:statusLabel];

                        
                    } else {
                        [lastArrow setImage:[UIImage imageNamed:@"arrow3_red.png"]];
                        [self.scrollView addSubview:lastArrow];
                        [arrowArray addObject:lastArrow];
                    }
                }
            }
            else {
                UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:i - 1] frame].origin.x + [[arrowArray objectAtIndex:i - 1] frame].size.width - 10, 40, 315 / countOfStatus + ((countOfStatus - 1) * 10)/countOfStatus, 50)];
                if (curentNumberOfStatus == i + 1 || curentNumberOfStatus == i + 2) {
                    [arrow setImage:[UIImage imageNamed:@"arrow2_green.png"]];
                    [self.scrollView addSubview:arrow];
                    [arrowArray addObject:arrow];
                    for (int j = 0; j < arrowArray.count - 1 ; j++) {
                        if (j == 0) {
                            [[arrowArray objectAtIndex:j] setImage:[UIImage imageNamed:@"arrow1_green.png"]];
                        } else {
                            [[arrowArray objectAtIndex:j] setImage:[UIImage imageNamed:@"arrow2_green.png"]];
                        }
                    }
                    
                    NSString *str = [NSString stringWithFormat:@"%@", [[sortedStatusArray objectAtIndex:i + 2] valueForKey:@"underbarid"]];
                    NSArray *tempArray = [self.db fetchStatusForOrder:str];
                    NSString *compareString = [NSString stringWithFormat:@"%@", [[tempArray objectAtIndex:0] valueForKey:@"value"]];
                    if (![compareString isEqualToString:@"1"]) {
                        UILabel *statusLabel = [[UILabel alloc] initWithFrame:CGRectMake([[arrowArray objectAtIndex:i] frame].origin.x, [[arrowArray objectAtIndex:i] frame].origin.y + [[arrowArray objectAtIndex:i] frame].size.height, [[arrowArray objectAtIndex:i] frame].size.width, 21)];
                        [statusLabel setText:[[tempArray objectAtIndex:1] valueForKey:@"name"]];
                        [statusLabel setTextColor:[UIColor whiteColor]];
                        [statusLabel setFont:[UIFont systemFontOfSize:12]];
                        [statusLabel setTextAlignment:NSTextAlignmentCenter];
                        [statusLabel setBackgroundColor:[UIColor clearColor]];
                        [self.scrollView addSubview:statusLabel];
                    }

                } else {
                    [arrow setImage:[UIImage imageNamed:@"arrow2_red.png"]];
                    [self.scrollView addSubview:arrow];
                    [arrowArray addObject:arrow];
                }
            }
        }
    }
}

- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [self setScrollView:nil];
    [self setInfoOfOrderContainer:nil];
    [self setMainView:nil];
    [self setInfoOfOrderContainerInnerView:nil];
    [self setShowOrHideButtonFirst:nil];
    [self setInfoOfOrderDetailView:nil];
    [self setInfoOfProductInOrderContainer:nil];
    [self setInfoOfProductInOrderInnerView:nil];
    [self setShowOrHideButtonSecond:nil];
    [self setInfoOfProductInOrderDetailView:nil];
//    [self setTempLabel2:nil];
    [self setCityLabel:nil];
//    [self setMetroLabel:nil];
    [self setAdditionalLabel:nil];
    [self setCityDescriptionLabel:nil];
//    [self setMetroDescriptionLabel:nil];
    [self setAdditionalDescriptionLabel:nil];
    [self setAddressLabel:nil];
    [self setAddressDescriptionLabel:nil];
    [self setProductName:nil];
    [self setProductsCount:nil];
    [self setProductPriceSumm:nil];
    [self setOrderNumberLabel:nil];
    [self setReorderButton:nil];
    [self setDeliveryAddress:nil];
    [self setYouAreOrdered:nil];
    [self setReorderButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)showOrHideInfoOfOrder:(id)sender
{
    
    if (!self.isInfoOfOrderShow) {
        UIImage *img = [UIImage imageNamed:@"buttonPlayDown.png"];
        [self.showOrHideButtonFirst setImage:img forState:UIControlStateNormal];
                
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        self.infoOfOrderContainer.frame = CGRectMake(self.firstContainerX, self.firstContainerY, self.firstContainerWidth, self.infoOfOrderDetailView.frame.size.height + 60);
        
        self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);
        
        self.tempFirstContainerY = self.infoOfProductInOrderContainer.frame.origin.y;
        
        if (!self.isInfoOfProductInOrder) {
            self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.firstContainerY + self.infoOfOrderContainer.frame.size.height - 1, self.secondContainerWidth, self.secondContainerHeight);
            
            self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);

            [UIView commitAnimations];
            
            [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];

        } else {
            self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.firstContainerY + self.infoOfOrderContainer.frame.size.height - 1, self.secondContainerWidth, self.infoOfProductInOrderDetailView.frame.size.height + 60);
            
            self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);

            [UIView commitAnimations];
            
            [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];

        }
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.7];
        [self.infoOfOrderDetailView setAlpha:1];
        [UIView commitAnimations];

        self.isInfoOfOrderShow = YES;
    } else {
        UIImage *img = [UIImage imageNamed:@"buttonPlayRight.png"];
        [self.showOrHideButtonFirst setImage:img forState:UIControlStateNormal];
        
        if (!self.isInfoOfProductInOrder) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.8];
            self.infoOfOrderContainer.frame = CGRectMake(self.firstContainerX, self.firstContainerY, self.firstContainerWidth, self.firstContainerHeight);
            self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.tempFirstContainerY, self.secondContainerWidth, self.secondContainerHeight);
            
            self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);

            [UIView commitAnimations];
            
            [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];

        } else {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.8];
            self.infoOfOrderContainer.frame = CGRectMake(self.firstContainerX, self.firstContainerY, self.firstContainerWidth, self.firstContainerHeight);
            self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.tempFirstContainerY, self.secondContainerWidth, self.infoOfProductInOrderDetailView.frame.size.height + 60);
            [UIView commitAnimations];
        }
                
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [self.infoOfOrderDetailView setAlpha:0];
        [UIView commitAnimations];
        
        [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];

        self.isInfoOfOrderShow = NO;
    }

}

- (IBAction)infoOfProductInOrder:(id)sender
{
    if (!self.isInfoOfProductInOrder) {
        UIImage *img = [UIImage imageNamed:@"buttonPlayDown.png"];
        [self.showOrHideButtonSecond setImage:img forState:UIControlStateNormal];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.firstContainerY + self.infoOfOrderContainer.frame.size.height - 1, self.secondContainerWidth, self.infoOfProductInOrderDetailView.frame.size.height + 60);
        
        self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);

        [UIView commitAnimations];
        
        [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.7];
        [self.infoOfProductInOrderDetailView setAlpha:1];
        [UIView commitAnimations];
        
        self.isInfoOfProductInOrder = YES;
    } else {
        UIImage *img = [UIImage imageNamed:@"buttonPlayRight.png"];
        [self.showOrHideButtonSecond setImage:img forState:UIControlStateNormal];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.8];
        self.infoOfProductInOrderContainer.frame = CGRectMake(self.secondContainerX, self.firstContainerY + self.infoOfOrderContainer.frame.size.height - 1, self.secondContainerWidth, self.secondContainerHeight);
        
        self.reorderButton.frame = CGRectMake(self.reorderButton.frame.origin.x, self.infoOfProductInOrderContainer.frame.origin.y + self.infoOfProductInOrderContainer.frame.size.height + 70, self.reorderButton.frame.size.width, self.reorderButton.frame.size.height);
        
        [self.scrollView setContentSize:CGSizeMake(320 , self.reorderButton.frame.origin.y + self.reorderButton.frame.size.height)];

        [UIView commitAnimations];
                
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [self.infoOfProductInOrderDetailView setAlpha:0];
        [UIView commitAnimations];
        

        self.isInfoOfProductInOrder = NO;
    }
}

- (IBAction)reorderClick:(id)sender {
    
    for (int i = 0; i < self.productsArray.count; i++) {
        NSNumber *productId = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:1] valueForKey:@"idProduct"];
        int count = [[[self.productsArray objectAtIndex:i] valueForKey:@"count"] intValue];
        float price = [[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"price"] floatValue];
        NSData *picture = [self.db fetchPictureDataByPictureId:[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"idPicture"]];
        
        float discountCoeficient = [self.db fetchDiscountByIdDiscount:[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"idDiscount"]].floatValue;
        
        NSNumber *weight = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"weight"];
        NSNumber *protein = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"protein"];
        NSNumber *carbs = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"carbs"];
        NSNumber *fats = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"fats"];
        NSNumber *calories = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"calories"];
        BOOL isFavorites = [[[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"isFavorites"] boolValue];
        //    BOOL isHit = NO;
        NSString *idMenu = [[[[self.productsArray objectAtIndex:i] valueForKey:@"resultArray"] objectAtIndex:0] valueForKey:@"idMenu"];
        
        [self.db SaveProductToEntityName:@"Cart" WithId:productId
                               withCount:count
                               withPrice:price
                             withPicture:picture
                       withDiscountValue:discountCoeficient
                              withWeight:weight
                             withProtein:protein
                               withCarbs:carbs
                                withFats:fats
                            withCalories:calories
                             isFavorites:isFavorites
                                   isHit:NO
                              withIdMenu:idMenu];
    }
    
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark
#pragma mark PRIVATE METHODS

-(void)setAllTitlesOnThisPage
{
    NSArray *array = [Singleton titlesTranslation_withISfromSettings:NO];
    for (int i = 0; i <array.count; i++)
    {
        if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Order №"])
        {
            _labelOrderNumber = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"City:"])
        {
            self.cityLabel.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
//        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Subway:"])
//        {
//            self.metroLabel.text = [[array objectAtIndex:i] valueForKey:@"title"];
//        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Address:"])
        {
            self.addressLabel.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Additional:"])
        {
            self.additionalLabel.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Title"])
        {
            self.productName.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Count"])
        {
            self.productsCount.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Sum"])
        {
            self.productPriceSumm.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Total:"])
        {
            _totalPriceVar = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"With discounts:"])
        {
            _totalPriceVarWithDiscount = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Delivery address:"])
        {
            self.deliveryAddress.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"You are ordered:"])
        {
            self.youAreOrdered.text = [[array objectAtIndex:i] valueForKey:@"title"];
        }
        else if ([[[array objectAtIndex:i] valueForKey:@"name_EN"] isEqualToString:@"Reorder"])
        {
            _reorderButtonTraslation = [[array objectAtIndex:i] valueForKey:@"title"];
        }
    }
}

@end
