
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

            inputString.chars.each do |character|
                if character == "("
                    openpair += 1
                elsif character == ")"
                    closepair+= 1
                end
            end 

            diffpair = (openpair - closepair).abs
            emoji = openpair > closepair ? ":(" : ":)"
            emojiremplace = openpair > closepair ? "{" : "}"

            while diffpair > 0
                inputString = inputString.sub(emoji,emojiremplace)
                diffpair -= 1
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