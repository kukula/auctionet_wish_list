class ItemsController < ApplicationController
  def index
    @items = Item.all(options: { state: "published" })
  end

  def show
    @item = Item.find(params[:id])
  end
end
