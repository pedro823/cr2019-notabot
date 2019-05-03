class Api::MessageController < ActionController::API
  # POST /api/message/create
  def create
    Message.delete_old
    captcha_id = params[:captchaId].to_i
    answer = params[:answer].to_s
    unless captcha_id > 0
      render json: {errorMessage: 'invalid captchaId, expected a number'}, status: :bad_request
      return
    end
    begin
      captcha = Captcha.find(captcha_id)
      unless captcha.is_correct?(answer)
        render json: {errorMessage: 'invalid captcha answer'}, status: :bad_request
        return
      end
      message_text = params[:message].to_s
      author = params[:author].to_s
      message = Message.new(message: message_text, author: author)
      unless message.save
        render json: {errorMessage: message.errors.full_messages}, status: :bad_request
      end
      captcha.destroy

      render json: { flag: get_flag(author) }
    rescue ActiveRecord::RecordNotFound => e
      render json: {errorMessage: 'invalid captchaId, was it already used before?'}, status: :bad_request
    end
  end

  # GET /api/message/
  def all
    Message.delete_old
    start_at = params[:startAt].to_i
    render json: Message.all.order(updated_at: :desc).limit(100).offset(start_at)
  end

  # GET /api/message/id
  def by_id
    Message.delete_old
    render json: (Message.where(id: params[:id]).first || {})
  end

  private

  def get_flag(author)
    count = Message.where(author: author).count()
    return 'FSociety{m3u_aV0_faZ_c4pTCHA_MElh0r!}' if count >= 500
    nil
  end
end