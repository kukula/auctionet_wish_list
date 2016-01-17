class WishedItemsController < ApplicationController
  def index
    @wished_items = WishedItem.all
  end

  def show
    @wished_item = WishedItem.find(params[:id])
  end

  def create
    @wished_item = WishedItem.new(wished_item_params)
    @wished_item.save!
    WishedItemUpdaterJob.new.perform(@wished_item.id)
  end

  def destroy
    @wished_item = WishedItem.find(params[:id])
    @wished_item.destroy
  end

  private

  def wished_item_params
    params.require(:wished_item).permit(:external_id)
  end
end
