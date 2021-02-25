ActiveAdmin.register Product do

    permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :is_featured, :season_date, :description, :is_sold_out


    index do
        selectable_column
        index_column
        column "Main image" do |product|
            image_tag product.image_1.url, width: "40" unless product.image_1.url.nil?
        end

        column :title
        column :price
        column :is_featured
        actions
    end


        form do |f|
            f.inputs "Product info" do
                f.input :title
                f.input :price
                f.input :description
                f.input :season_date
            end
        
            f.inputs "Filters" do
                f.input :is_featured, label: "Featured on homepage?"
                f.input :is_sold_out, label: "Sold out?"
            end 

            f.inputs "Images" do
                f.input :image_1
                f.input :image_2
                f.input :image_3
                f.input :image_4
                f.input :image_5
            end 
            f.actions
        end 

end
