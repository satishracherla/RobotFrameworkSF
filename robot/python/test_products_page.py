from selenium import webdriver
from selenium.webdriver.common.by import By

def test_products_page():
    driver = webdriver.Chrome()
    driver.get("https://www.saucedemo.com/inventory.html")

    try:
        # Login first (you might want to make this a separate function)
        driver.find_element(By.ID, "user-name").send_keys("standard_user")
        driver.find_element(By.ID, "password").send_keys("secret_sauce")
        driver.find_element(By.ID, "login-button").click()

        # Verify products are displayed
        inventory_items = driver.find_elements(By.CLASS_NAME, "inventory_item")
        assert len(inventory_items) > 0, "No products found"

        # Test adding item to cart
        add_to_cart_btn = driver.find_element(By.XPATH, "//button[contains(text(), 'Add to cart')]")
        add_to_cart_btn.click()

        # Verify cart badge updated
        cart_badge = driver.find_element(By.CLASS_NAME, "shopping_cart_badge")
        assert cart_badge.text == "1", "Cart badge not updated"

        print("Products page test passed!")

    except Exception as e:
        print(f"Products page test failed: {str(e)}")
    finally:
        driver.quit()

test_products_page()