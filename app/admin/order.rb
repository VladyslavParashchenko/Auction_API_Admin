ActiveAdmin.register Order do
  config.filters = false
  actions :index, :show, :destroy
  menu priority: 4, label: proc {I18n.t("orders")}
  show do
    panel "Order ##{order.id}" do
      attributes_table_for order do
        row :arrival_location
        row :arrival_type
        row :delivery_company
        row :status
      end
    end
  end
  scope :all, :default => true
  scope :pending
  scope :sent
  scope :delivered
  index do
    column("ID", :sortable => :id) {|order| link_to order.id, admin_order_path(order)}
    column("Status") {|order| status_tag(order.status) }
    column("Arrival_location") {|order| order.arrival_location}
    column("Arrtival type") {|order| order.arrival_type}
    column("Delivery company") {|order| order.delivery_company}
  end
end
