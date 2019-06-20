ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Maps' do
          ul do
            li "Maps: #{Map.count}"
            li "Rock Glaciers: #{Map.select{ |x| x.rock_glacier == true }.count}"
          end
        end
      end
      column do
        panel 'Users' do
          ul do
            li "Registered Users: #{User.count}"
            li "Registered Administrators: #{AdminUser.count}"
          end
        end
      end
    end
  end # content
end
