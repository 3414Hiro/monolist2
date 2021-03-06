class ItemsController < ApplicationController
  before_action :logged_in_user, only: [:new], except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
      # binding.pry
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
