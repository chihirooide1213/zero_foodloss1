class AddMailsToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :mail, :string
  end
end
