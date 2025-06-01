from selenium import webdriver
from selenium.webdriver.common.by import By

def test_cart_page():
    driver = webdriver.Chrome()
    driver.get("https://www.saucedemo.com/inventory.html")

    try:
        # Login and add item to cart
        driver.find_element(By.ID, "user-name").send_keys("standard_user")
        driver.find_element(By.ID, "password").send_keys("secret_sauce")
        driver.find_element(By.ID, "login-button").click()
        driver.find_element(By.XPATH, "//button[contains(text(), 'Add to cart')]").click()

        # Go to cart page
        driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()

        # Verify cart page
        assert "cart.html" in driver.current_url, "Not on cart page"
        cart_items = driver.find_elements(By.CLASS_NAME, "cart_item")
        assert len(cart_items) == 1, "Item not in cart"

        # Test checkout button
        checkout_btn = driver.find_element(By.ID, "checkout")
        checkout_btn.click()

        # Verify transition to checkout page
        assert "checkout-step-one.html" in driver.current_url, "Did not navigate to checkout"

        print("Cart page test passed!")

    except Exception as e:
        print(f"Cart page test failed: {str(e)}")
    finally:
        driver.quit()

test_cart_page()