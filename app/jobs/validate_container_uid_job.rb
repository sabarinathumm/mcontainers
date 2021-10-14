class ValidateContainerUidJob < ApplicationJob
    queue_as :default
  
    def perform(container_uid)
        arr =  container_uid.split("-")
        final  = arr[0].gsub(/\s+/, "")
        final = final.split("")

        alphabets = ('A'..'Z').to_a
        values  = (10..38).to_a.reject {|item| item%11 == 0}      

        calculated_value = 0

        final[0..3].each do |a|
            calculated_value += values[alphabets.find_index(a)] * (2 ** final.index(a))
        end
        x = 4
        final[4..9].each do |i|
            calculated_value += i.to_i * (2 ** x)
            x = x + 1
        end

        ans = calculated_value / 11
        ans = ans * 11

        if calculated_value - ans == arr[1].to_i
           return true
        else
           return false
        end
    end
end
  