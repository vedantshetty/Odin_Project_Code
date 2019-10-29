def stock_picker(prices)
    buy = 0
    sell = 0
    profit = 0
    for i in 0...prices.length do
        for x in i+1... prices.length do
            if (prices[x] - prices[i]>profit)
                buy = i
                sell = x
                profit = prices[x]-prices[i]
            end 
        end
    end
    if profit == 0 
        puts 'don\'t buy' 
    end
    [buy,sell]
end



puts stock_picker([17,3,6,9,15,8,6,1,10])