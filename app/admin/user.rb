ActiveAdmin.register User do
  config.filters = false
  actions :index, :show
  menu priority: 2, label: proc {I18n.t("users")}
  show do
    panel "User ##{user.id}" do
      attributes_table_for user do
        row :first_name
        row :last_name
        row :email
        row :phone
        row('Lot count') {|user| user.lots.count}
        row('Bid count') {|user| user.bids.count}
      end
    end
  end
  index do
    column("ID", :sortable => :id) {|user| link_to user.id, admin_user_path(user)}
    column("First name") {|user| user.first_name}
    column("Last name") {|user| user.last_name}
    column("email") {|user| user.email}
    column("phone") {|user| user.phone}
  end
end
