class AddArticleIdToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :article, foreign_key: true
  end
end
