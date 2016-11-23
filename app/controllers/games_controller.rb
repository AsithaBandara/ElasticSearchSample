class GamesController < ApplicationController
  def index
    if params[:search].present?
      @games = Game.search(params[:search], order: {year: :desc}, page: params[:page], per_page: 2, suggest: true)
    else
      @games = Game.search("*", page: params[:page], per_page: 3, fields: [:description], match: :text_middle)
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path
  end


  private
  def game_params
    params.require(:game).permit(:name,:description,:year,:rate)
  end

end
