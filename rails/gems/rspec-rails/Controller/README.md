class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, notice: 'Oops something went wrong!'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to root_path, notice: 'Your account have been deleted.'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :avatar)
    end
end

---------------------------

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # FactoryGirl allows you to mock fake user for testing purposes
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_params) { { email: user.email, username: user.username } }
  let(:invalid_params) { { email: 'wrong@email', username: user.username} }

  # each controller method should have their own 'describe' cases
  # inside each describe cases, your test should be covering what is expected out of the method
  # including both happy and unhappy paths.

  describe 'GET #new' do

    it 'assigns @user to be a new User' do
      get :new
      expect(assigns(:user)).to be_an_instance_of User
    end

    it 'renders #new template' do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do

    context 'with valid input' do

      it 'saves current user' do
        expect{post :create, user: valid_params}.to change{User.count}.by(1)
      end

      it 'assigns user with correct input' do
        post :create, user: valid_params
        expect(assigns(:user).email).to eq user.email
        expect(assigns(:user).username).to eq user.username
      end

      it 'redirects to user #show page' do
        post :create, user: valid_params
        expect(response).to redirect_to user_path(user)
      end
    end

    context 'with invalid input' do
      before(:each) { post :create, user: invalid_params }

      it 'it throws error' do
        expect(flash[:notice]).not_to be nil
      end

      it 'renders #new' do
        expect(response).to render_template :new
      end
    end

  describe 'DELETE #destroy' do
    before(:each) { delete :destroy, id: user.id }

    it 'should remove user from db' do
      expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'should redirect to root path' do
      expect(response).to redirect_to root_path
    end

    it 'should render notice' do
      expect(flash[:notice]).not_to be nil
    end
  end

end
