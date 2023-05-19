class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_api_key

  private

  def authenticate_api_key
    api_key = request.headers['X-Api-Key']
    @api_key = ApiKey.find_by(key: api_key)
    unless @api_key
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
