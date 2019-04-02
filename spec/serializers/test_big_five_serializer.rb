require 'minitest/autorun'
require_relative '../../serializers/big_five_results_text_serializer'

describe BigFiveResultsTextSerializer do
  let(:text) { File.open('big_five_result.txt').read }
  let(:serializer) { BigFiveResultsTextSerializer.new(text) }
  let(:result) {
    {
      'NAME' => 'Ijeoma Arisah',
      'EXTRAVERSION' => {
        'Overall Score' => 64,
        'Facets' => {
          'Friendliness' => 59,
          'Gregariousness' => 67,
          'Assertiveness' => 28,
          'Activity Level' => 52,
          'Excitement-Seeking' => 79,
          'Cheerfulness' => 71
        }
      },
      'AGREEABLENESS' => {
        'Overall Score' => 53,
        'Facets' => {
          'Trust' => 67,
          'Morality' => 71,
          'Altruism' => 38,
          'Cooperation' => 24,
          'Modesty' => 69,
          'Sympathy' => 43
        }
      },
      'CONSCIENTIOUSNESS' => {
        'Overall Score' => 61,
        'Facets' => {
          'Self-Efficacy' => 49,
          'Orderliness' => 75,
          'Dutifulness' => 44,
          'Achievement-Striving' => 48,
          'Self-Discipline' => 75,
          'Cautiousness' => 42
        }
      },
      'NEUROTICISM' => {
        'Overall Score' => 28,
        'Facets' => {
          'Anxiety' => 39,
          'Anger' => 13,
          'Depression' => 19,
          'Self-Consciousness' => 48,
          'Immoderation' => 52,
          'Vulnerability' => 43
        }
      },
      'OPENNESS TO EXPERIENCE' => {
        'Overall Score' => 52,
        'Facets' => {
          'Imagination' => 43,
          'Artistic Interests' => 50,
          'Emotionality' => 44,
          'Adventurousness' => 61,
          'Intellect' => 47,
          'Liberalism' => 59
        }
      }
    }
  }

  describe '#to_h' do
    it 'has correct details' do
      expect(serializer.to_h).to eq(result)
    end
  end
end
