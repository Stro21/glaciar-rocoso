ActiveAdmin.register Map do
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

  permit_params :center, :glaciar_rock, :user_id

  index do
    column :id
    column :url
    column :center
    column :temperature
    column :elevation
    column :zoom
    column :glaciar_rock
    column :user
    actions
  end

  form do |f|
    inputs 'Add a new map' do
      input :center
      input :glaciar_rock
      input :user
    end
    actions
  end

  filter :temperature, as: :numeric
  filter :elevation, as: :numeric
  filter :glaciar_rock, as: :select
  filter :zoom, as: :numeric
  filter :user, as: :select
end
