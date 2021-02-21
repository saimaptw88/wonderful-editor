class AddUserIdToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :user, foreign_key: true
  end
end
