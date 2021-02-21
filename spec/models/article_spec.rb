require "rails_helper"

RSpec.describe Article, type: :model do
  describe "modelのvalidationが機能しているか？" do
    context "正常系" do
      let(:test1) { create(:article) }

      it "記事作成に成功する" do
        expect(test1).to be_valid
      end
    end

    context "異常系" do
      let(:test2) { build(:article, user_id: nil) }
      let(:test3) { build(:article, title: nil) }

      it "記事作成に失敗する" do
        expect(test2).to be_invalid
      end

      it "記事作成に失敗する" do
        expect(test3).to be_invalid
      end
    end
  end
end
