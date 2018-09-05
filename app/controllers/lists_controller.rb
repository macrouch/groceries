class ListsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    #code
  end

  def update
    #code
  end

  def get_items
    @items = [{name: 'Item 1', quantity: ''}, {name: 'Item 2', quantity: 2}, {name: 'Item 3', quantity: 3}, {name: 'A Item', quantity: ''}].sort_by { |item| item[:name] }

    respond_to do |format|
      format.json { render json: @items }
    end
  end

  def add_item
    #code
  end
end
