class Public::HomesController < ApplicationController
  def top
    @genres = Item.genres.all
    @items = Item.all
  end
end
