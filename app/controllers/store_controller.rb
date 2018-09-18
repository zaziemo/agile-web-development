class StoreController < ApplicationController
  include SessionCounter
  include CurrentCart

  skip_before_action :authorize
  before_action :increment_counter, only: :index
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.where(locale: I18n.locale).order(:title)
    end
  end
end
