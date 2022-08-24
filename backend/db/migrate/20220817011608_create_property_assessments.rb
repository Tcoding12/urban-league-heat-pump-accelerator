class CreatePropertyAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :property_assessments do |t|

      t.timestamps

      t.integer :com_units
      t.integer :rc_units
      t.integer :land_sf
      t.integer :gross_area
      t.integer :living_area
      t.integer :land_value
      t.integer :bldg_value
      t.integer :total_value

      t.integer :pid
      t.integer :cm_id
      t.integer :gis_id
      t.string :st_num
      t.string :st_name
      t.integer :unit_num
      t.string :city
      t.integer :zipcode

      t.integer :bldg_seq
      t.integer :num_bldgs
      t.integer :luc
      t.string :luc_desc
      t.string :bldg_type
      t.string :own_occ # no char datatype?

      t.string :owner
      t.string :mail_addressee
      t.string :mail_address
      t.string :mail_city
      t.string :mail_state, :limit => 2
      t.string :mail_zipcode # these can be 5 or zip+4 format
      t.float :res_floor
      t.integer :cd_floor
      t.integer :res_units

      t.string:bdrm_cond
      t.string:bthrm_style1
      t.string:bthrm_style2
      t.string:bthrm_style3
      t.string:kitchen_type
      t.string:kitchen_style1
      t.string:kitchen_style2
      t.string:kitchen_style3

    end
  end
end
