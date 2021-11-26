class MscExportJob < ApplicationJob
    queue_as :default
    def perform(activity_ids)
        puts "MSC Perform"
    end
end