ActiveAdmin.register Lot do
  config.filters = false
  actions :index, :show
  menu priority: 1, label: proc {I18n.t("lots")}
  scope :all, :default => true
  scope :pending
  scope :in_process
  scope :closed
  index do
    column("Title", :sortable => :title) {|lot| link_to "#{lot.title}", admin_lot_path(lot)}
    column("Status") {|lot| status_tag(lot.status)}
    column("Current_price") {|lot| lot.current_price}
    column("Current_price") {|lot| lot.estimated_price}
    column("User") {|lot| link_to "#{lot.user.last_name} #{lot.user.first_name}", admin_user_path(lot.user)}
  end
  show do
    panel "Lot ##{lot.id}" do
      attributes_table_for lot do
        row :title
        row :current_price
        row :estimated_price
        row :lot_start_time
        row :lot_end_time
        row('Bid count') {|lot| lot.bids.count}
      end
    end
  end
end
