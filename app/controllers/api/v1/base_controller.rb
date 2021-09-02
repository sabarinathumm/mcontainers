class Api::V1::BaseController < ApplicationController

    include CustomException
	include ExceptionHandler
	include ActiveUser
	include Pagination

end
