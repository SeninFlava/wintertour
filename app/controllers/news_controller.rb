class NewsController < ApplicationController
  before_action :is_user_login
  before_action :is_user_admin, except: [:show, :index]

  def new
    @one_news = News.new
  end

  def create
    @one_news = News.new(news_params)
    if @one_news.save
        redirect_to '/news', notice: "Новость создана"
    else
        redirect_to '/news', alert: "Ошибка при создании новости"
    end
  end


  def show
  end


  def index
    @all_news = News.all.order(row_num: :desc)
  end

  def edit
    @one_news = News.find_by(id: params[:id])
  end

  def update
    @one_news = News.find_by(id: params[:id])
    if @one_news.update(news_params)
        @all_news = News.all.order(row_num: :desc)
        render :index, notice: 'Новость изменена'
    else
        render action: 'edit'
    end
  end


  def destroy
    @selected_news = News.find_by(id: params[:id])
    
    unless @selected_news.nil?
      @selected_news.destroy
      redirect_to '/news', notice: "Новость #{@selected_news.title_en}/#{@selected_news.title_ru} удалена"
    else 
      redirect_to '/news', alert: "Новость с id=#{params[:id]} отсутствует"
    end

  end



  #поднять новость в списке
  def up
    one_news = News.find_by(id: params[:id])
    all_news = News.all

    if up_object(one_news, all_news)
      redirect_to '/news', notice: "Новость #{one_news.title_en} поднята в списке"
    else
      redirect_to '/news', notice: "Новость #{one_news.title_en} первая в списке"    
    end       

  end

  #опустить новость в списке
  def down
    one_news = News.find_by(id: params[:id])
    all_news = News.all

    if down_object(one_news, all_news)
      redirect_to '/news', notice: "Новость #{one_news.title_en} опущена в списке"
    else
      redirect_to '/news', notice: "Новость #{one_news.title_en} последняя в списке"    
    end
  end



private

    def is_user_login
      if current_user.nil?
        redirect_to '/users/sign_in', alert: "Перед работой с сервисом необходимо залогиниться"
      end
    end

    def is_user_admin 
      unless current_user.admin?
        redirect_to '/news', alert: "Только админ может создавать новости"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:row_num, :title_en, :text_en, :title_ru, :text_ru)
    end

end
