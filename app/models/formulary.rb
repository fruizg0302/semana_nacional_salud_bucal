class Formulary < ActiveRecord::Base
  belongs_to :user

  def self.jurisdictional_results (*args)
    self.where(user_id: args)
  end

  def self.resultados_estatales (efederativa_id)
  end


end
