class CreateReporteAccidentes < ActiveRecord::Migration
  def self.up
    create_table :reporte_accidentes do |t|
      t.string :twitter_id
      t.string :texto
      t.string :severidad
      t.float :lat
      t.float :long
      t.time :fechahora

      t.timestamps
    end
  end

  def self.down
    drop_table :reporte_accidentes
  end
end
