from selenium.webdriver.common.by import By
from base_page import BasePage
from checkout_overview_page import CheckoutOverviewPage

class CheckoutInfoPage(BasePage):
    URL = "https://www.saucedemo.com/checkout-step-one.html"

    FIRST_NAME = (By.ID, "first-name")
    LAST_NAME = (By.ID, "last-name")
    POSTAL_CODE = (By.ID, "postal-code")
    CONTINUE_BUTTON = (By.ID, "continue")
    ERROR_MESSAGE = (By.CSS_SELECTOR, "[data-test='error']")

    def fill_info(self, first_name, last_name, postal_code):
        self.type(self.FIRST_NAME, first_name)
        self.type(self.LAST_NAME, last_name)
        self.type(self.POSTAL_CODE, postal_code)
        return self

    def continue_to_overview(self):
        self.click(self.CONTINUE_BUTTON)
        return CheckoutOverviewPage(self.driver)

    def get_error_message(self):
        return self.get_text(self.ERROR_MESSAGE)