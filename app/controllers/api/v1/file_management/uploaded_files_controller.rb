class Api::V1::FileManagement::UploadedFilesController < Api::V1::BaseController
    before_action :doorkeeper_authorize!
	before_action :validate_token!
  
    def create
        @uploaded_file = current_user_obj.uploaded_files.create!(uploaded_file_params)
        render json: @uploaded_file, serializer: UploadedFileSerializer, status: :created
    end
  
    private
  
    def uploaded_file_params
      params.permit(:attachment)   
    end

end