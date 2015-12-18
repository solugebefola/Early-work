require 'benchmark'

def anagrams(str1, str2)
  first_anagram(str1).include? (str2)
end

def first_anagram(str) # O(n!)
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

#refactor and fix duplicat char error
def second_anagram?(str1, str2) # O(n^2)
  word1, word2 = str1.split(""), str2.split("")
  str1.each_char.with_index do |char1, idx1|
    str2.each_char.with_index do |char2, idx2|
      if char1 == char2
        word1[idx1] = nil
        word2[idx2] = nil
      end
    end
  end
  word1.compact.empty? && word2.compact.empty?
end

def third_anagram?(str1, str2) # O(n * log (n))
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2) # O(n)
  letters = Hash.new(0)
  str1.each_char do |let|
    letters[let] += 1
  end
  str2.each_char do |let|
    letters[let] -= 1
  end
  letters.values.all?(&:zero?)
end

if __FILE__ == $PROGRAM_NAME
  array = ("A".."z").to_a.shuffle.join("")
  array2 = ("A".."z").to_a.shuffle.join("")

Benchmark.bm do |x|
  # x.report("bad: ") { anagrams(array, array2) }
  x.report("ok:  ") { 1000.times { second_anagram?(array, array2) } }
  x.report("bet: ") { 1000.times {third_anagram?(array, array2) } }
  x.report("hash:") { 1000.times {fourth_anagram?(array, array2) } }
end

end
