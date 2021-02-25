ActiveAdmin.register Order do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  
    permit_params :first_name, :last_name, :email, :country, :address_1, :address_2, :city, :postcode,
    # Permits lower-level attributes
    order_items_attributes: [:id, :product_id, :quantity]

    index do 
        selectable_column
        id_column
        column :name do |o|
            o.first_name + " " + o.last_name
        end 
        column :email
        column :country
        # Buttons
        actions
    end

    form do |f|
        f.inputs do 
            f.input :first_name
            f.input :last_name
            f.input :email
        end 

        f.inputs "Address" do
            f.input :address_1
            f.input :address_2
            f.input :city
            f.input :postcode
            f.input :country
        end

        f.has_many :order_items, heading: "Items" do |itemf|
            itemf.input :product
            itemf.input :quantity
        end 

        # Buttons
        f.actions

    end

end
