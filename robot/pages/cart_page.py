from selenium.webdriver.common.by import By
from base_page import BasePage
from checkout_info_page import CheckoutInfoPage

class CartPage(BasePage):
    URL = "https://www.saucedemo.com/cart.html"

    CART_ITEMS = (By.CLASS_NAME, "cart_item")
    CHECKOUT_BUTTON = (By.ID, "checkout")

    def get_cart_items_count(self):
        return len(self.find_all(self.CART_ITEMS))

    def proceed_to_checkout(self):
        self.click(self.CHECKOUT_BUTTON)
        return CheckoutInfoPage(self.driver)