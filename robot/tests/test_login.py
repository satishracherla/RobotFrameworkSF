import pytest
from robot.pages.login_page import LoginPage
from typing import Tuple

TEST_DATA = [
    ("standard_user", "secret_sauce", "https://www.saucedemo.com/inventory.html"),
    ("locked_out_user", "secret_sauce", "Epic sadface: Sorry, this user has been locked out."),
    ("invalid", "invalid", "Epic sadface: Username and password do not match any user in this service")
]

@pytest.mark.parametrize("username,password,expected", TEST_DATA)
def test_login(browser, username: str, password: str, expected: str, login_page) -> None:
    """
    Test login functionality with different credentials.

    Args:
        browser: Browser fixture
        username: Login username
        password: Login password
        expected: Expected result (URL or error message)
    """
    login_page = LoginPage(browser).load()
    login_page.login(username, password)

    # Use more specific error message checking
    is_error_message = expected.startswith("Epic sadface")

    if is_error_message:
        actual_error = login_page.get_error_message()
        assert actual_error == expected, f"Expected error '{expected}' but got '{actual_error}'"
    else:
        current_url = browser.current_url
        assert current_url == expected, f"Expected URL '{expected}' but got '{current_url}'"
