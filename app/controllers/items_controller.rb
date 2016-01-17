class ItemsController < ApplicationController
  def index
    @items = if params.has_key?(:category_id)
               @category = Category.find(params[:category_id])
               Item.all(options: { state: "published", category_id: @category.id })
             else
               Item.all(options: { state: "published" })
             end
  end

  def show
    @item = Item.find(params[:id])
  end
end
