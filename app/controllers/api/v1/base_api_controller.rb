class Apiv1BaseApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
end
