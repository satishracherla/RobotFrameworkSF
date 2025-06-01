from robot.pages.products_page import ProductsPage


def test_checkout_info_validation(login):
    products_page = ProductsPage(login)
    checkout_info_page = (products_page.add_first_product_to_cart()
                          .go_to_cart()
                          .proceed_to_checkout())

    # Test validation
    checkout_info_page.continue_to_overview()
    assert checkout_info_page.get_error_message() == "Error: First Name is required"

def test_checkout_info_success(login):
    products_page = ProductsPage(login)
    checkout_overview_page = (products_page.add_first_product_to_cart()
                              .go_to_cart()
                              .proceed_to_checkout()
                              .fill_info("John", "Doe", "12345")
                              .continue_to_overview())

    assert checkout_overview_page.is_displayed(checkout_overview_page.ITEM_TOTAL)