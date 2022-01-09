
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

        def isEmojiIdentifier(inputString)
            openpair = 0
            closepair = 0 
            initOrderPair = true

            inputString.chars.each do |character|
                if character == "("
                    openpair++
                elsif character == ")"
                    closepair++
                end
            end 

            diffpair = (openpair - closepair).abs
            if openpair < closepair
                initOrderPair = false
            end

            emoji = initOrderPair ? ":(" : ":)"
            while diffpair < 0
                inputString = inputString.sub(emoji,'')
                diffpair--;
            end

            return inputString
        end 

        def validate(inputString)
           
            result = isBalanced(inputString)

            if !result
                outputstring = isEmojiIdentifier(inputString)
                result = isBalanced(outputstring)
            end

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


:(:(:())

:(:()):)
