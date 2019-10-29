a = [1, 4, 6, 112, 5, 4253, 535, 35, 19, 2]
b = [3,2,1]

def merge_sort(arr)
  if arr.length > 2
    a = merge_sort(arr[0..arr.length/2-1])
    b = merge_sort(arr[arr.length / 2..])
    return merge(a, b)
  elsif arr.length == 2
    arr[0], arr[1] = arr[1], arr[0] if arr[0] > arr[1]
  end
  arr
end

def merge(arr1, arr2)
  index1,index2 = 0,0
  result = []
  #Merges 2 arrays in a sorted order
  while arr1[index1] && arr2[index2]
    if arr1[index1]< arr2[index2]
       result.push(arr1[index1])
       index1+=1
    else
        result.push(arr2[index2])
        index2+=1
    end
  end
  result +arr1[index1..]+arr2[index2..]
end
