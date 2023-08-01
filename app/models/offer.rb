class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true

  validates :price, numericality: { greater_than: 0 }
  validates_inclusion_of :etat, in: %w[Neuf_jamais_utilisee Neuf_deja_utilisee Tres_bon_etat Bon_etat Satisfaisant Abime]
  validates :content, length: { maximum: 500 }
  has_many :read_offers



  def self.formatted_etat_options
    {
      'Neuf_jamais_utilisee' => 'Neuf jamais utilisée',
      'Neuf_deja_utilisee' => 'Neuf déjà utilisée',
      'Tres_bon_etat' => 'Très bon état',
      'Bon_etat' => 'Bon état',
      'Satisfaisant' => 'Satisfaisant',
      'Abime' => 'Abîmée'
    }
  end

  def formatted_etat
    Offer.formatted_etat_options[self.etat]
  end

  def self.formatted_etat_select_options
    formatted_etat_options.map { |value, text| [text, value] }
  end




  def self.language_options
    [
      ['Français', 'fr'],
      ['Non spécifié', 'none'],
      ['Allemand', 'de'],
      ['Anglais', 'en'],
      ['Arabe', 'ar'],
      ['Bengali', 'bn'],
      ['Bulgare', 'bg'],
      ['Chinois', 'zh'],
      ['Coréen', 'ko'],
      ['Croate', 'hr'],
      ['Danois', 'da'],
      ['Espagnol', 'es'],
      ['Estonien', 'et'],
      ['Finnois', 'fi'],
      ['Français', 'fr'],
      ['Grec', 'el'],
      ['Hindi', 'hi'],
      ['Hongrois', 'hu'],
      ['Italien', 'it'],
      ['Japonais', 'ja'],
      ['Letton', 'lv'],
      ['Lituanien', 'lt'],
      ['Néerlandais', 'nl'],
      ['Norvégien', 'no'],
      ['Polonais', 'pl'],
      ['Portugais', 'pt'],
      ['Roumain', 'ro'],
      ['Russe', 'ru'],
      ['Serbe', 'sr'],
      ['Slovaque', 'sk'],
      ['Slovène', 'sl'],
      ['Suédois', 'sv'],
      ['Tchèque', 'cs'],
      ['Turc', 'tr'],
      ['Autres', 'oo'],

    ]
  end

  def self.language_name(code)
    language_options.find { |name, c| c == code }&.first || 'Non spécifié'
  end


end
