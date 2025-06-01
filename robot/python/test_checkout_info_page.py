from selenium import webdriver
from selenium.webdriver.common.by import By

def test_checkout_info_page():
    driver = webdriver.Chrome()

    try:
        # Login, add item, and go to checkout
        driver.get("https://www.saucedemo.com")
        driver.find_element(By.ID, "user-name").send_keys("standard_user")
        driver.find_element(By.ID, "password").send_keys("secret_sauce")
        driver.find_element(By.ID, "login-button").click()
        driver.find_element(By.XPATH, "//button[contains(text(), 'Add to cart')]").click()
        driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()
        driver.find_element(By.ID, "checkout").click()

        # Fill out checkout information
        driver.find_element(By.ID, "first-name").send_keys("John")
        driver.find_element(By.ID, "last-name").send_keys("Doe")
        driver.find_element(By.ID, "postal-code").send_keys("12345")

        # Continue to overview
        driver.find_element(By.ID, "continue").click()

        # Verify overview page
        assert "checkout-step-two.html" in driver.current_url, "Did not navigate to overview"

        print("Checkout information page test passed!")

    except Exception as e:
        print(f"Checkout information page test failed: {str(e)}")
    finally:
        driver.quit()

test_checkout_info_page()