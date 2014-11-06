class Formulary < ActiveRecord::Base

  def self.jurisdictional_results (j_id)
    self.where("jurisdiction_id = ?", j_id)
  end

  def self.resultados_estatales (efederativa_id)
   forms = Formulario.where("efederativa_id = ?", efederativa_id)
  end


end
