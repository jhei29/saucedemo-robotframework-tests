# Sauce Demo Robot Framework Tests

A comprehensive test automation suite for the [Sauce Demo](https://www.saucedemo.com/) website using Robot Framework and Playwright Browser library.

## Project Structure

```
saucedemo-robotframework-tests/
├── pages/                          # Page Object Model
│   ├── checkout/
│   │   ├── checkout.robot          # Checkout keywords
│   │   └── checkoutLocators.robot  # Checkout element locators
│   ├── common/
│   │   └── common.robot            # Common variables and URLs
│   ├── header/
│   │   ├── header.robot            # Header keywords
│   │   └── headerLocators.robot    # Header element locators
│   └── inventory/
│       ├── inventory.robot         # Inventory keywords
│       └── inventoryLocators.robot # Inventory element locators
├── resources/
│   └── browser-resource.robot      # Browser setup and utility keywords
├── tests/
│   └── basic-tests.robot           # Test cases
├── Dockerfile                       # Docker containerization
└── README.md                        # This file
```

## Prerequisites

### Local Development
- Python 3.13+
- Robot Framework
- robotframework-browser
- robotframework-pythonlibcore
- Playwright (for Chromium browser)

### Installation

```bash
pip install robotframework robotframework-browser robotframework-pythonlibcore
playwright install --with-deps chromium
```

## Running Tests

### Locally
```bash
# Run all tests
robot .

# Run tests with specific tag
robot --include checkoutTests .

# Run tests with output directory
robot --outputdir results --include checkoutTests .
```


## Test Cases

### Checkout Workflow Test
Tests the complete checkout flow:
1. Navigate to inventory page using session cookies
2. Add item to cart (Sauce Labs Backpack)
3. View shopping cart
4. Fill out checkout form with customer details
5. Complete order

**Test Data:**
- Item: Sauce Labs Backpack
- First Name: Drake
- Last Name: Maye
- Postal Code: 1230


## Key Features

- **Page Object Model**: Organized page structure with locators separated from keywords
- **Performance Testing**: Validates that page elements load and become interactable within performance thresholds
- **Session Cookie Authentication**: Uses pre-authenticated sessions to bypass login
- **Browser Automation**: Powered by Playwright and Browser library for reliable cross-platform testing

## Test Tags

- `checkoutTests`: Tests related to checkout functionality

## Environment Variables

The tests use the following configuration variables (defined in `common.robot`):
- `${loginPageUrl}`: https://www.saucedemo.com/
- `${inventoryPageUrl}`: https://www.saucedemo.com/inventory.html
- `${usernameToUse}`: standard_user
- `${sessionNameToUse}`: session-username

## Test Results

After running tests, results are typically generated in the `results/` directory (when using Docker or with `--outputdir` flag):
- `output.xml` - Test execution data
- `log.html` - Detailed test log
- `report.html` - Test summary report

## Browser Support

Currently configured to run on **Chromium**. Can be extended to support Firefox and WebKit by modifying the `New Browser` keyword in `browser-resource.robot`.

## Troubleshooting

### Browser Installation Issues
If Playwright browsers fail to install:
```bash
playwright install --with-deps chromium
```

### Test Failures
1. Ensure you have internet connectivity to access saucedemo.com
2. Verify Chromium is properly installed
3. Check element locators if the website UI changes

## Contributing

When adding new tests:
1. Follow the Page Object Model pattern
2. Separate locators into dedicated `*Locators.robot` files
3. Use descriptive keyword names
4. Add appropriate tags for test categorization
5. Document test purpose and data
