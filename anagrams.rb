def anagrams(str1, str2)
  first_anagram(str1).include? (str2)
end

def first_anagram(str)
  return [str] if str.length == 1
  letters = str.chars
  anagrams = []
  letters.each.with_index do |ltr, idx|
    sub_word = letters.dup
    sub_word.delete_at(idx)
    sub_anagrams = first_anagram(sub_word.join "")
    sub_anagrams.each do |ana|
      anagrams << ltr + ana
    end
  end
  anagrams.uniq


end
