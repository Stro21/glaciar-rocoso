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

  permit_params :center, :glaciar_rock

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
    end
    actions
  end
end
