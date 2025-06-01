from selenium.webdriver.common.by import By
from base_page import BasePage
from cart_page import CartPage

class ProductsPage(BasePage):
    URL = "https://www.saucedemo.com/inventory.html"

    PRODUCTS = (By.CLASS_NAME, "inventory_item")
    ADD_TO_CART_BUTTON = (By.XPATH, "//button[contains(text(), 'Add to cart')]")
    CART_LINK = (By.CLASS_NAME, "shopping_cart_link")

    def get_products_count(self):
        return len(self.find_all(self.PRODUCTS))

    def add_first_product_to_cart(self):
        self.click(self.ADD_TO_CART_BUTTON)
        return self

    def go_to_cart(self):
        self.click(self.CART_LINK)
        return CartPage(self.driver)