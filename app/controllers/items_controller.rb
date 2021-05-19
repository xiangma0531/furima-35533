class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :deli_change_id, :pref_id, :deli_days_id, :price).merge(user_id: current_user.id)
  end
end
