class FormulariesController < ApplicationController
  load_and_authorize_resource
  def index
    if can? :capture_formulary, @user
      @formularios = Formulary.jurisdictional_results(User.users_from_jurisdiction(current_user.jurisdiction_id))
      flash[:notice] = "Tu jurisdicción no tiene metas aún" if @formularios.empty?
      render 'jurisdictional_results' # renders app/views/formularies/index/_product.html.erb
    elsif can? :view_state_results, @user
      @formularios = Formulary.resultados_estatales(User.users_from_jurisdiction(current_user.jurisdiction_id))
      render 'state_results'
    elsif can? :view_national_results, @user
      #@formularios = Formulary.resultados_nacionales
    else
      #@formularios = Formulary.formularios_jurisdiccionales(current_user.jurisdiction_id).order.page(params[:page]).per(5)
      #render partial: 'generic_partial' # renders app/views/products/_product.html.haml
      render 'generic_partial'
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
  if  @formulary = Formulary.create(formulary_params)
    respond_to do |format|
      format.html {redirect_to root_path}
    end
  else
    format.html { render :new }
  end
  end

  def update
    respond_to do |format|
      if @formulary.update(formulary_params)
        format.html { redirect_to @formulary, notice: 'Tu registro se ha actualizado.' }
        format.json { render :show, status: :ok, location: @formulary }
      else
        format.html { render :edit }
        format.json { render json: @formulary.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @formulary.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Registro eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def formulary_params
      allow = [:responsable_llenado,:cod01,:cod02,:ape01,:ape04,:ape07,:ape02,:ape05,:ape03,:ape06,:api01,:api04,:api02,:ssb01,:api03,:cao01,:cao04,:cao07,:cao10,:tit01,:cao02,:cao05,:cao08,:cao11,:cao03,:cao06,:cao09,:cao12,:uni01,:uni02,:uni03,:ben01,:ben02,:per01,:per02,:user_id]
      params.require(:formulary).permit(allow)
    end
end
