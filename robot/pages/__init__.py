"""
Page Object Models for SauceDemo website.

Exposes all page classes for easy importing.
"""

from .base_page import BasePage
from .login_page import LoginPage
from .products_page import ProductsPage
from .cart_page import CartPage
from .checkout_info_page import CheckoutInfoPage
from .checkout_overview_page import CheckoutOverviewPage
from .checkout_complete_page import CheckoutCompletePage

__all__ = [
    'BasePage',
    'LoginPage',
    'ProductsPage',
    'CartPage',
    'CheckoutInfoPage',
    'CheckoutOverviewPage',
    'CheckoutCompletePage'
]