from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def test_login():
    driver = webdriver.Chrome()
    driver.get("https://www.saucedemo.com/")

    try:
        # Find elements
        username = driver.find_element(By.ID, "user-name")
        password = driver.find_element(By.ID, "password")
        login_btn = driver.find_element(By.ID, "login-button")

        # Enter credentials and login
        username.send_keys("standard_user")
        password.send_keys("secret_sauce")
        login_btn.click()

        # Verify login success by checking products page title
        WebDriverWait(driver, 10).until(
            EC.title_contains("Swag Labs")
        )
        assert "inventory.html" in driver.current_url
        print("Login test passed!")

    except Exception as e:
        print(f"Login test failed: {str(e)}")
    finally:
        driver.quit()

test_login()