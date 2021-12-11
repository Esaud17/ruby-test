
module Balance
    class BalanceLogic 

        def initialize()
        end

        def isBalanced(inputString,beginString = '(', finishString = ')')
            valid_pairs = { beginString => finishString }
            container = [] 
            
            inputString.chars.each do |character|
                if valid_pairs.has_key?(character)
                    container.push(character)
                elsif valid_pairs[container.last] == character
                    container.pop
                elsif valid_pairs.has_value?(character)
                    return false
                end
            end
            return container.count.zero? 
        end

        def validate(inputString)
           
            result = isBalanced(inputString)

            if !result
                inputString=inputString.gsub(":(","}")
                inputString=inputString.gsub(":)","{")
                inputString=inputString.gsub(/[[a-z :]]/,"")

                result = isBalanced(inputString)
            end

            return result
        end 

    end
end
