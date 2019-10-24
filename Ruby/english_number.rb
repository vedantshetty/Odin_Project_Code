def englishNumber number
    if number<0
        return 'minus '+englishNumber(number*-1)
    end
    digit = ['zero','one', 'two','three', 'four','five','six','seven','eight','nine','ten']
    tens = ['twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
    teens = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
    misc = ['thousand','million','billion','trillion']
    if number <=10
        return digit[number]
    elsif number<20
        return teens[number-11]
    elsif number <100
        return tens[number/10-2]+ (number%10!=0? " "+englishNumber(number%10): '')
    elsif number<1000
        return englishNumber(number/100) +' hundred' +(number%100!=0?' and '+ englishNumber(number%100): '')
    else
        power = (number.to_s.length-1)/3
        return englishNumber(number/1000**power) + ' '+misc[power-1] + (number %1000**power!=0? ' '+englishNumber(number%1000**power): '')
    end
end
