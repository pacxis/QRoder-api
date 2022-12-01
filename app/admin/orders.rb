ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :status, :products
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :status, :products]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :id, :products, :status, :user_id

  form do |f|
    f.inputs do
      f.input :status
    end
    f.actions
  end
  
end
