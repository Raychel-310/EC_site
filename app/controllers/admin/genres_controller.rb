class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new #データを新規登録するためのインスタンス生成
    # @genre.save #データをデータベースに保存するためのsaveメソッド実行
    # redirect_to admin_genres_path
  end

  def create
    @genre = Genre.new(genre_params) #データを新規登録するためのインスタンス生成
    @genre.save #データをデータベースに保存するためのsaveメソッド実行
    redirect_to admin_genres_path #トップ画面へリダイレクト
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
