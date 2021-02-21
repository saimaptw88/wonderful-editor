require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  # index
  describe "Get api/v1/article" do
    before do
      @user = create(:user)
      3.times { create(:article, user_id: @user.id) }
    end

    subject { get(api_v1_article_index_path, headers: headers) }

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }

    it "レスポンスが正常" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "ユーザーの記事を取得する" do
      subject
      expect(res.map {|i| i["user_id"] }).to eq @user.articles.all.map {|i| i["user_id"] }
    end
  end

  # show
  describe "GET /api/v1/article/:id" do
    before do
      @user = create(:user)
      @article = create(:article, user_id: @user.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }
    let(:article_id) { @article.id }

    subject { get(api_v1_article_path(article_id), headers: headers) }

    it "レスポンスが正常" do
      subject
      expect(response).to have_http_status :ok
    end

    it "ユーザーの記事を取得している" do
      subject
      expect(res["user_id"]).to eq @user.id
    end
  end

  # create
  describe "POST /api/v1/article" do
    before { @user = create(:user) }

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }
    let(:params) { { article: attributes_for(:article) } }

    subject { post(api_v1_article_index_path, headers: headers, params: params) }

    it "レスポンスが正常" do
      subject
      expect(response).to have_http_status :ok
    end

    it "titleが登録されている" do
      subject
      expect(@user.articles.first.title).to eq params[:article][:title]
    end

    it "bodyが登録されている" do
      subject
      expect(@user.articles.first.body).to eq params[:article][:body]
    end

    it "idは変更されない" do
      subject
      expect(@user.articles.first.id).not_to eq params[:article][:id]
    end
  end

  # update
  describe "PATCH /api/v1/article/:id" do
    before do
      @user = create(:user)
      @article = create(:article, user_id: @user.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:params) { { article: attributes_for(:article) } }
    let(:res) { JSON.parse(response.body) }
    let(:article_id) { @article.id }

    subject { patch(api_v1_article_path(article_id), headers: headers, params: params) }

    it "レスポンスが正常" do
      subject
      expect(response).to have_http_status :ok
    end

    it "titleが更新されている" do
      subject
      expect(res["title"]).to eq params[:article][:title]
    end

    it "bodyが更新されている" do
      subject
      expect(res["body"]).to eq params[:article][:body]
    end

    it "idが更新されていない" do
      subject
      expect(res["id"]).not_to eq params[:article][:id]
    end
  end

  # destroy
  describe "DELETE /api/v1/article/:id" do
    before do
      @user = create(:user)
      @article = create(:article, user_id: @user.id)
    end

    let(:headers) { @user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }
    let(:article_id) { @article.id }

    subject { delete(api_v1_article_path(article_id), headers: headers) }

    it "レコードが減る" do
      expect { subject }.to change { Article.count }.by(-1)
    end
  end
end
