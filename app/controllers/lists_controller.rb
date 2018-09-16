class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :get_items, :add_item, :update_item, :remove_item]

  def show
    redirect_to new_list_path unless current_user.list
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.owner = current_user
    list.regenerate_join_key # why doesn't this work automatically?
    list.save

    redirect_to root_url
  end

  def edit; end

  def update
    respond_to do |format|
      if @list.update_attributes(list_params)
        format.html { redirect_to root_url }
      else
        format.html { render action: :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_items
    respond_to do |format|
      format.json { render json: { needed: @list.needed_items, available: @list.needed_items(false) }.to_json }
    end
  end

  def add_item
    item = Item.find_or_create_by(name: item_params[:name])
    list_item = @list.list_items.find_or_create_by(item: item)
    list_item.need = true
    list_item.quantity = item_params[:quantity]
    list_item.save

    respond_to do |format|
      format.json { render json: { needed: @list.needed_items, available: @list.needed_items(false) }.to_json }
    end
  end

  def update_item
    list_item = ListItem.where(id: item_params[:id]).first
    list_item.quantity = item_params[:quantity]
    list_item.save

    respond_to do |format|
      format.json { render json: { needed: @list.needed_items, available: @list.needed_items(false) }.to_json }
    end
  end

  def remove_item
    list_item = ListItem.where(id: item_params[:id]).first
    list_item.need = false
    list_item.save

    respond_to do |format|
      format.json { render json: { needed: @list.needed_items, available: @list.needed_items(false) }.to_json }
    end
  end

  def join
    list = List.where(join_key: params[:join_key]).first
    list.members << current_user
    redirect_to list
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def item_params
    params.require(:item).permit(:id, :name, :quantity)
  end

  def set_list
    @list = current_user.list
  end
end
