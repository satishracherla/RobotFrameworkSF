from robot.pages.products_page import ProductsPage


def test_cart_page(login):
    products_page = ProductsPage(login)
    products_page.add_first_product_to_cart()
    cart_page = products_page.go_to_cart()
    assert cart_page.get_cart_items_count() == 1

def test_proceed_to_checkout(login):
    products_page = ProductsPage(login)
    products_page.add_first_product_to_cart()
    checkout_info_page = products_page.go_to_cart().proceed_to_checkout()
    assert checkout_info_page.is_displayed(checkout_info_page.FIRST_NAME)