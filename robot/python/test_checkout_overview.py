from selenium import webdriver
from selenium.webdriver.common.by import By

def test_checkout_overview():
    driver = webdriver.Chrome()

    try:
        # Complete all steps to get to overview
        driver.get("https://www.saucedemo.com")
        driver.find_element(By.ID, "user-name").send_keys("standard_user")
        driver.find_element(By.ID, "password").send_keys("secret_sauce")
        driver.find_element(By.ID, "login-button").click()
        driver.find_element(By.XPATH, "//button[contains(text(), 'Add to cart')]").click()
        driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()
        driver.find_element(By.ID, "checkout").click()
        driver.find_element(By.ID, "first-name").send_keys("John")
        driver.find_element(By.ID, "last-name").send_keys("Doe")
        driver.find_element(By.ID, "postal-code").send_keys("12345")
        driver.find_element(By.ID, "continue").click()

        # Verify overview page contents
        assert "checkout-step-two.html" in driver.current_url
        summary_info = driver.find_element(By.CLASS_NAME, "summary_info")
        assert summary_info.is_displayed(), "Summary info not displayed"

        # Complete checkout
        driver.find_element(By.ID, "finish").click()

        # Verify completion page
        assert "checkout-complete.html" in driver.current_url, "Did not complete checkout"

        print("Checkout overview page test passed!")

    except Exception as e:
        print(f"Checkout overview page test failed: {str(e)}")
    finally:
        driver.quit()

test_checkout_overview()