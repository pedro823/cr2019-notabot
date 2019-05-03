class CreateCaptchaTable < ActiveRecord::Migration[5.2]
  def change
    create_table :captcha_tables do |t|
      t.string :challenge
      t.string :answer
    end
  end
end
