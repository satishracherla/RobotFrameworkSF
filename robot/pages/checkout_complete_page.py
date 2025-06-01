from selenium.webdriver.common.by import By
from base_page import BasePage
from products_page import ProductsPage

class CheckoutCompletePage(BasePage):
    URL = "https://www.saucedemo.com/checkout-complete.html"

    COMPLETE_HEADER = (By.CLASS_NAME, "complete-header")
    BACK_HOME_BUTTON = (By.ID, "back-to-products")

    def get_complete_message(self):
        return self.get_text(self.COMPLETE_HEADER)

    def back_to_products(self):
        self.click(self.BACK_HOME_BUTTON)
        return ProductsPage(self.driver)