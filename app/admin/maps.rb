ActiveAdmin.register Map do
  permit_params :center, :glaciar_rock, :user_id

  index do
    column :id
    column :name do |map|
      link_to map.name, admin_map_path(map)
    end
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
