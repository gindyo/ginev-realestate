module ApplicationHelper
  def js_void 
    'javascript:void(0)'
  end
  def self.big_number digit
    if digit > 0
      digit = digit.to_s().split('') 
      chunks = []
      while digit.length > 3
        chunks.unshift digit.slice!(-3)
      end
      chunks.unshift digit
      stringChunks = []
      for chunk in chunks
        stringChunks.push chunk.join().replace(/[^0-9]/,'')
      end
      $scope.displayValue = stringChunks.join() 
    else 
      ''
    end
  end
end
