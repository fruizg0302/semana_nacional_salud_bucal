class Formulary < ActiveRecord::Base
  belongs_to :user

  def self.jurisdictional_results (*args)
    self.where(user_id: args)
  end

  def self.state_results (id)
    self.find_by_sql("select * from formularies as f inner join users as s on s.id = f.user_id inner join jurisdictions as j on j.id = s.jurisdiction_id inner join states as st on j.state_id = st.id where st.id= #{id}")
  end

end
