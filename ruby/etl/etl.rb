class ETL

  #not the best implementation passing arround instance varaible.
  #need to figure out a better way to do this

  def self.transform(old_hash_score)
    @result = {}
    old_hash_score.to_a.each do |score, letters_array|
      assign_scores(score, letters_array)
    end
    @result
  end

  def self.assign_scores(score, letters_array)
    letters_array.each { |letter| @result[letter.downcase] = score }
  end
end
