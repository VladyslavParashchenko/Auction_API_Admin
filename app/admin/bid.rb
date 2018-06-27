ActiveAdmin.register Bid do
  config.filters = false
  actions :index, :show, :destroy
  menu priority: 3, label: proc {I18n.t("bids")}
  index do
    column("Proposed_price", :sortable => :proposed_price) {|bid| bid.proposed_price}
    column("User") {|bid| link_to "#{bid.user.last_name} #{bid.user.first_name}", admin_user_path(bid.user)}
    column("Lot") {|bid| link_to "#{bid.lot.title}", admin_lot_path(bid.lot)}
    column("Id") {|bid| link_to "#{bid.id}", admin_bid_path(bid)}
  end
  show do
    panel "Bid ##{bid.id}" do
      attributes_table_for bid do
        row :id
        row :proposed_price
        row :user_id
      end
    end
  end
end