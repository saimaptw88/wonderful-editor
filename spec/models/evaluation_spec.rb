require "rails_helper"

RSpec.describe Evaluation, type: :model do
  let(:test) { create(:evaluation) }

  it "evaluation作成に成功する" do
    expect(test).to be_valid
  end
end
