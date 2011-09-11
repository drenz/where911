class SmsLog < ActiveRecord::Migration
  def self.up
    create_table "sms_logs", :force => true do |t|
      t.string   "to_number"   
      t.string   "message"
      t.string   "sid"
      t.string   "status"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end

  def self.down
  end
end
