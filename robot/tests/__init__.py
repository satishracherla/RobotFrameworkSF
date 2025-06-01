"""
Test modules for SauceDemo website.

This package contains all test cases organized by page/functionality.
"""

import pytest

# Define markers for test categorization
def pytest_configure(config):
    config.addinivalue_line(
        "markers", "smoke: mark test as smoke test"
    )
    config.addinivalue_line(
        "markers", "regression: mark test as regression test"
    )
    config.addinivalue_line(
        "markers", "login: tests related to login functionality"
    )
    config.addinivalue_line(
        "markers", "checkout: tests related to checkout flow"
    )

# Import all test modules to make them discoverable
from .test_login import *
from .test_products import *
from .test_cart import *
from .test_checkout_info import *
from .test_checkout_overview import *
from .test_checkout_complete import *