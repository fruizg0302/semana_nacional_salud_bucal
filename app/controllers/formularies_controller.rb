class FormulariesController < ApplicationController
  def index
    if can? :capture_formulary, @user
      @formularios = Formulary.jurisdictional_results(current_user.jurisdiction_id).order.page(params[:page]).per(5)
      render partial: 'index/jurisdictional_results' # renders app/views/formularies/index/_product.html.erb
    elsif can? :view_state_results, @user
      @formularios = Formulario.resultados_estatales(current_user.jurisdiction_id)
      render partial: 'state_results'
    elsif can? :view_national_results, @user
      #@formularios = Formulary.resultados_nacionales
    else
      #@formularios = Formulary.formularios_jurisdiccionales(current_user.jurisdiction_id).order.page(params[:page]).per(5)
      render partial: 'generic_partial' # renders app/views/products/_product.html.haml
    end
    #render partial: 'product' # renders app/views/products/_product.html.haml
  end

  def show
  end

  def new
    @formulary = Formulary.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @formulario }
    end
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
