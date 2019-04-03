class BigFiveResultsTextSerializer
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def to_h
    # need to keep track of the current parent key
    current_parent_key = ''

    acc = { 'NAME' => 'Ijeoma Arisah' }

    File.readlines(text).each do |line|
      val = line.strip.split(': ')
      first = val.shift
      if !first.match(/\p{Lower}/)
        current_parent_key = first
        acc[current_parent_key] = {
          'Overall Score' => val.shift.to_i,
          'Facets' => {}
        }
      else
        acc[current_parent_key]['Facets'][first] = val.shift.to_i
      end
    end
    acc
  end
end
