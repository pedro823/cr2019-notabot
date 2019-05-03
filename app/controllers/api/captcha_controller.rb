class Api::CaptchaController < ActionController::API
  # POST /captcha/generate
  def generate
    response.headers['Access-Control-Allow-Origin'] = '*'
    challenge, answer = generate_challenge
    captcha = Captcha.new(challenge: challenge, answer: answer)
    if captcha.save
      render json: captcha, except: [:answer, :created_at, :updated_at]
    else
      render json: captcha.errors.full_messages, status: :internal_server_error
    end
  end

  private

  def generate_challenge
    first_num = rand(2...12)
    second_num = rand(4...7)
    operation = [:+, :-, :*].sample
    result = first_num.send(operation, second_num).to_s
    challenge = "#{first_num} #{operation} #{second_num} = ?"
    return challenge, result
  end
end
