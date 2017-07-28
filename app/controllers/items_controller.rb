class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def index
    @items = Item.all

    render json: @items
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    @item.destroy

    head :no_content
  end



  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :currency)
  end


end
