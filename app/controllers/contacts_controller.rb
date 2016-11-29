class ContactsController < ApplicationController
  before_action :is_user_login
  before_action :is_user_admin, except: [:show, :index]

  before_action :set_contact, only: [:show, :edit, :update, :destroy, :delete_avatar]


  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all.order(row_num: :desc)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_avatar
    @contact.avatar = nil
    if @contact.save
        redirect_to "/contacts/#{@contact.id}/edit", notice: "Изображение удалено"
    else
        redirect_to "/contacts/#{@contact.id}/edit", alert: "Изображение не удалено"    
    end
  end



  private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:row_num, :name_en, :name_ru, :description_en, :description_ru, :phone, :email, :avatar)
    end


    def is_user_login
      if current_user.nil?
        redirect_to '/users/sign_in', alert: "Перед работой с сервисом необходимо залогиниться"
      end
    end

    def is_user_admin 
      unless current_user.admin?
        redirect_to '/contacts', alert: "Только админ может редактировать данные"
      end
    end

end
