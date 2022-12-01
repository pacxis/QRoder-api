ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :catagory
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :catagory]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs
    f.file_field :image
    f.actions
  end

  permit_params :name, :description, :catagory,:price, :id, :image
  
end
