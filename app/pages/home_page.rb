# Class to get the elements content
class HomePage
  include Capybara::DSL
  
  # LINKS
  PRODUCT_LINK = '.product-item'.freeze # CLASS
  PRODUCT_HREF_LINK = '.product-item-photo'.freeze # CLASS
  SEE_ALL_PROD_LINK = '.all-products-link .link2'.freeze # CLASS
  CATEGORY_URL_LINK = '.category-url' # CLASS
  TERMS_CONDITIONS_LINK = '//*[@id="viewport"]/footer/div[1]/ul/li[3]/a'.freeze # XPATH

  # BUTTON
  ORDER_BTN = '//*[@id="home-page"]/div/div/div/div[6]/div/div/div/div/div/button'.freeze # XPATH
  ORDER_NOW_BTN = '//*[@id="home-page"]/div/div/div/div[2]/div/div/div/div[1]/button'.freeze # XPATH

end


