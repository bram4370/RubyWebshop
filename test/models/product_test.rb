require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end

  test "product price must be positive" do
    product = Product.new(title: "Book title",
                          description: 'lorem ipsum',
                          image_url: 'book.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert_equal ["must be greater than or equal to 0.01"],
      product. errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "bookTitle",
    description: "lorem ipsum",
    price: 1,
    image_url: image_url)
  end

  test "image_url test" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG Fred.Jpg http://a.p.c/x/y/z/fred.gif }
    bad = %w{fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't not be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product must have a unique title - 1l8n" do
    product = Product.new(title: products(:galaxys6).title,
                          description: "lorem ipsum",
                          price: 1,
                          image_url: "image.jpg")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
