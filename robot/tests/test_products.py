from robot.pages.products_page import ProductsPage


def test_products_page(login):
    products_page = ProductsPage(login)
    assert products_page.get_products_count() == 6

def test_add_to_cart(login):
    products_page = ProductsPage(login)
    products_page.add_first_product_to_cart()
    assert "1" in products_page.get_text(products_page.CART_LINK)