import pytest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

@pytest.fixture
def browser():
    # Setup
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
    driver.maximize_window()
    driver.implicitly_wait(10)

    yield driver

    # Teardown
    driver.quit()

@pytest.fixture
def login(browser):
    from pages.login_page import LoginPage
    login_page = LoginPage(browser)
    login_page.load()
    login_page.login("standard_user", "secret_sauce")
    return browser