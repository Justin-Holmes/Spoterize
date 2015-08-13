class Api::V1::LikesController < ApplicationController
  def remove_like
    like_index = params["like"]["like_index"].to_i
    current_user.delete_like(like_index)
    byebug

    respond_to do |format|
      format.js { render json: { success: true } }
    end
  end
end
