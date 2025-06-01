def test_back_to_products(login):
    checkout_complete_page = (ProductsPage(login)
                              .add_first_product_to_cart()
                              .go_to_cart()
                              .proceed_to_checkout()
                              .fill_info("John", "Doe", "12345")
                              .continue_to_overview()
                              .complete_checkout())

    products_page = checkout_complete_page.back_to_products()
    assert products_page.is_displayed(products_page.PRODUCTS)