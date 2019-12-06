# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)
    super
    if resource.save
      #firstTwoTasks
      @task = Task.new
      @task.user_id = resource.id
      @task.title = "Toto je jednoduchý úkol"
      @task.is_done = false
      @task.save
      @task = Task.new
      @task.user_id = resource.id
      @task.title = "Toto je už dokončený úkol"
      @task.is_done = true
      @task.save

      #allDefaultCategories
      @categoryFirst = Category.new
      @categoryFirst.user_id = resource.id
      @categoryFirst.title = "Osobní"
      @categoryFirst.save
      @categorySecond = Category.new
      @categorySecond.user_id = resource.id
      @categorySecond.title = "Škola"
      @categorySecond.save
      @categoryThird = Category.new
      @categoryThird.user_id = resource.id
      @categoryThird.title = "Práce"
      @categoryThird.save

      #allDefaultTags
      @tagUCL = Tag.new
      @tagUCL.user_id = resource.id
      @tagUCL.title = "UCL"
      @tagUCL.save
      @tagJSE = Tag.new
      @tagJSE.user_id = resource.id
      @tagJSE.title = "JSE"
      @tagJSE.save
      @tagWEB = Tag.new
      @tagWEB.user_id = resource.id
      @tagWEB.title = "WEB"
      @tagWEB.save
      @tag3DT = Tag.new
      @tag3DT.user_id = resource.id
      @tag3DT.title = "3DT"
      @tag3DT.save
      @tagPR1 = Tag.new
      @tagPR1.user_id = resource.id
      @tagPR1.title = "PR1"
      @tagPR1.save
      @tagNAK= Tag.new
      @tagNAK.user_id = resource.id
      @tagNAK.title = "Nákupy"
      @tagNAK.save
      @tagWISH = Tag.new
      @tagWISH.user_id = resource.id
      @tagWISH.title = "Wishlist"
      @tagWISH.save

      #lastTwoTasks
      @task = Task.new
      @task.user_id = resource.id
      @task.title = "Nakoupit na večeři"
      @task.category_id = @categoryFirst.id
      @task.tag_ids = @tagNAK.id
      @task.save
      @task = Task.new
      @task.user_id = resource.id
      @task.title = "Udělat semestrální práci z předmětu WEB"
      @task.category_id = @categorySecond.id
      @task.tag_ids = @tagUCL.id, @tagWEB.id
      @task.save
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :confirmation_password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :confirmation_password, :current_password])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
