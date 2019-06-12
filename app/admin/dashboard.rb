ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Last added maps' do
          ul do
            Map.last(5).map do |map|
              li link_to(map.center, admin_map_path(map))
            end
          end
        end
      end
    end
  end # content
end
