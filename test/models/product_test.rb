require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def valid_product
    Product.new( title: 'valid title',
      description: 'valid description',
      price: 1,
      image_url: 'valid_image.png'
    )
  end

  test 'valid product is valid' do
    assert valid_product.valid?
  end

  test 'product attributes must not be empy' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test 'product price must be positive' do

    product = valid_product

    product.price = -1
    assert product.invalid?

    product.price = 0
    assert product.invalid?

    product.price = 0.01
    assert product.valid?

  end

  def join_arrays( first, second )
    second.collect{ |s| first.collect{ |f| f + s } }.flatten
  end

  test 'product image url' do

    valid_extensions = %w{ .gif .png .jpg }
    valid_names      = %w{ first second third }

    valid_file_names = join_arrays( valid_names, valid_extensions )

    product = valid_product

    valid_file_names.each do | valid_name |
      product.image_url = valid_name
      assert product.valid?
    end

    invalid_extensions = %w{ .txt .xml .bmp .jpeg }
    invalid_file_names = join_arrays( valid_names, invalid_extensions )

    invalid_file_names.each do | invalid_name |
      product.image_url = invalid_name
      assert product.invalid?
    end
  end
end
