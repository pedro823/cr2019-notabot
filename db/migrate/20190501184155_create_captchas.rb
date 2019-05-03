class CreateCaptchas < ActiveRecord::Migration[5.2]
  def change
    create_table :captchas do |t|
      t.string :challenge
      t.string :answer

      t.timestamps
    end

    drop_table :captcha_tables
  end
end
