require "csv"
class Document < ActiveRecord::Base

  module ClassMethods
    def process_payload( params )
      doc = self.create
      csv_path = File.join( Rails.root.to_s, 'public', 'docs',
        "#{doc.id.to_s}.csv" )
      CSV.open(csv_path, "wb") do |csv|
        params[:clients].each do | client_param |
          csv << client_param.values
        end
      end
      doc.path = csv_path
      doc.save
      doc
    end
  end

  extend ClassMethods

end
