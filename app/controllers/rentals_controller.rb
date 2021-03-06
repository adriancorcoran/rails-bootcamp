class RentalsController < ApplicationController

  def index
  end

  def new
    if session[:current_user_id]
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
        rescue StandardError => e
          puts "Rescued: #{e.inspect}"
        end
      else
        flash.now[:title] = "No Product Specified"
        flash.now[:notice] = "You must specify a product id"  
      end
    else
      # add message
      flash[:title] = "Login"
      flash[:notice] = "Please login to create a rental."
      redirect_to login_path
    end

  end

  def create
    # get the product
    @product = ShopifyAPI::Product.find(params[:product_id])
    variant = @product.variants.find { |v| v.id === params[:variant_id].to_i }
    variant_name = (variant.title === 'Default Title') ? @product.title : variant.title
    sale_total = ((params[:variant_price].to_f * params[:duration].to_f)*100).round
        
    # create a rental record
    Rental.create(
      user_id: session[:current_user_id],
      product_id: params[:product_id].to_i,
      product_name: @product.title,
      variant_id: params[:variant_id].to_i,
      variant_name: variant_name,
      sale_total: sale_total,
      checkout_url: params[:checkout_url],
      start_date: Time.now,
      duration: params[:duration]
    )

    # head to the checkout
    redirect_to root_url
    # redirect_to params["checkout_url"]
  end

end