ActiveAdmin.register User do
  permit_params :username, :email, :password, :role

  index do
    column :id
    column :email
    column :username
    column :created_at
    column :member_since do |user|
      time_ago_in_words(user.created_at)
    end
    column :role
    actions
  end

  form do |f|
    inputs 'Add a new user' do
      input :username
      input :email
      input :password
      input :role
    end
    actions
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  filter :email, as: :select
  filter :username, as: :select
  filter :created_at
end
