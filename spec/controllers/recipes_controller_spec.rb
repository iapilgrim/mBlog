require 'spec_helper'

describe RecipesController do

  describe 'GET #index' do 
    it "populates an array of all recipes" do 
      cake = create(:recipe, name: 'cake')
      sweets = create(:recipe, name: 'sweets')
      get :index
      expect(assigns(:recipes)).to match_array([cake, sweets])
    end

    it "renders the :index template" do 
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do 
    it "assigns the requested recipe to @recipe" do 
      recipe = create(:recipe)
      get :show, id: recipe
      expect(assigns(:recipe)).to eq recipe
    end

    it "renders the :show template" do 
      recipe = create(:recipe)
      get :show, id: recipe
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do 
    it "assigns a new recipe to @recipe" do 
      get :new
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end

    it "renders the :new template" do 
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do 
    it "assigns the requested recipe to @recipe" do 
      recipe = create(:recipe)
      get :edit, id: recipe
      expect(assigns(:recipe)).to eq recipe
    end

    it "renders the :edit template" do 
      recipe = create(:recipe)
      get :edit, id: recipe
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do 
      it "saves the new recipe in the database" do 
        expect{
          post :create, recipe: attributes_for(:recipe)
        }.to change(Recipe, :count).by(1)
      end

      it "redirects to recipes#show" do 
        post :create, recipe: attributes_for(:recipe)
        expect(response).to redirect_to recipe_path(assigns[:recipe])
      end
    end

    context "with invalid attributes" do 
      it "does not save the new contact in the database" do 
        expect{
          post :create, recipe: attributes_for(:invalid_recipe)
        }.to_not change(Recipe, :count)
      end

      it "re-renders the :new template" do 
        post :create,
          recipe: attributes_for(:invalid_recipe)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do 
    before :each do 
      @recipe = create(:recipe, name: "cake")
    end

    context "with valid attributes" do 
      it "locates the requested @recipe" do 
        patch :update, id: @recipe, recipe: attributes_for(:recipe)
        expect(assigns(:recipe)).to eq(@recipe)
      end

      it "updates recipe in the database" do 
        patch :update, id: @recipe, recipe: attributes_for(:recipe, name: "sweets")
        @recipe.reload
        expect(@recipe.name).to eq("sweets")
      end

      it "redirects to the recipe" do 
        patch :update, id: @recipe, recipe: attributes_for(:recipe)
        expect(response).to redirect_to @recipe
      end
    end

    context "with invalid attributes" do 
      it "does not update the recipe" do 
        patch :update, id: @recipe, recipe: attributes_for(:recipe, name: nil)
        @recipe.reload
        expect(@recipe.name).to_not eq("sweets")
      end

      it "re-renders the #edit template" do 
        patch :update, id: @recipe, recipe: attributes_for(:invalid_recipe)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do 
    before :each do 
      @recipe = create(:recipe)
    end

    it "deletes the recipe from the database" do 
      expect {delete :destroy, id: @recipe}.to change(Recipe, :count).by(-1)
    end

    it "redirects to recipes#index" do 
      delete :destroy, id: @recipe
      expect(response).to redirect_to recipes_url
    end
  end
end