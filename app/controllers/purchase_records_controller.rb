class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new
  end

  def create
    binding.pry
    @purchase_record_delivery_address = PurchaseRecordDeliveryAddress.new(purchase_record_params)
    if @purchase_record_delivery_address.valid?
      @purchase_record_delivery_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_record_params
    item = Item.find(params[:item_id])
    params.require(:purchase_record_delivery_address).permit(:postal_code, :pref_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: item.id)
  end
end
