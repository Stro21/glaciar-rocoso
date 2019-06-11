ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :username, :email, :password

  index do
    column :id
    column :email
    column :username
    column :created_at
    column :member_since do |user|
      time_ago_in_words(user.created_at)
    end
    actions
  end

  form do |f|
    inputs 'Add a new user' do
      input :username
      input :email
      input :password
    end
    actions
  end
end
