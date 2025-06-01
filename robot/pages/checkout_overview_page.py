from selenium.webdriver.common.by import By
from base_page import BasePage
from checkout_complete_page import CheckoutCompletePage

class CheckoutOverviewPage(BasePage):
    URL = "https://www.saucedemo.com/checkout-step-two.html"

    FINISH_BUTTON = (By.ID, "finish")
    ITEM_TOTAL = (By.CLASS_NAME, "summary_subtotal_label")

    def get_item_total(self):
        return self.get_text(self.ITEM_TOTAL)

    def complete_checkout(self):
        self.click(self.FINISH_BUTTON)
        return CheckoutCompletePage(self.driver)