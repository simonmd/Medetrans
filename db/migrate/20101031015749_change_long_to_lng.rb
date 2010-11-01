class ChangeLongToLng < ActiveRecord::Migration
  def self.up
    rename_column :reporte_accidentes, :long, :lng
  end

  def self.down
    rename_column :reporte_accidentes, :lng, :long
  end
end
