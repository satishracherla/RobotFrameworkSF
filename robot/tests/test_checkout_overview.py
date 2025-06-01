from robot.pages.products_page import ProductsPage


def test_checkout_overview(login):
    checkout_overview_page = (ProductsPage(login)
                              .add_first_product_to_cart()
                              .go_to_cart()
                              .proceed_to_checkout()
                              .fill_info("John", "Doe", "12345")
                              .continue_to_overview())

    assert "Item total: $" in checkout_overview_page.get_item_total()

def test_complete_checkout(login):
    checkout_complete_page = (ProductsPage(login)
                              .add_first_product_to_cart()
                              .go_to_cart()
                              .proceed_to_checkout()
                              .fill_info("John", "Doe", "12345")
                              .continue_to_overview()
                              .complete_checkout())

    assert checkout_complete_page.get_complete_message() == "THANK YOU FOR YOUR ORDER"