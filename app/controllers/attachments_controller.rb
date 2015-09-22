class AttachmentsController < ApplicationController
  def index
    @attachments = Attachments.all
  end
end
