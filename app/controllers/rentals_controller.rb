class RentalsController < ApplicationController

  def index
  end

  def new
    # oinit the shop api
    ShopifyAPI::Base.site = Rails.application.config.shop_api_url
    ShopifyAPI::Base.api_version = Rails.application.config.shop_api_version

    # check for product id
    if params[:product_id]
      begin
        # get the product
        @product = ShopifyAPI::Product.find(params[:product_id])
        # get the variants
        @variants = @product.variants
        # get the images and their urls for use by the variants later on
        @image_urls = {}
        # check for images
        if @product.images
          @product.images.each do |image|
            @image_urls[image.id] = image.src
          end
        end


        # puts " "
        # puts "---"
        # puts @image_urls.inspect 
        # puts "---"
        # puts " "
        

# puts "@variants"
# puts @variants.inspect
# puts " " 
      rescue StandardError => e
        puts "Rescued: #{e.inspect}"
      end
    else
      flash.now[:title] = "No Product Specified"
      flash.now[:notice] = "You must specify a product id"  
    end

  end

end