class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: { message: 'Nome e um campo obrigatorio' }, length: { maximum: 60 }
  validates :cpf,  presence: { message: 'CPF e um campo obrigatorio' }, uniqueness: { message: 'CPF ja cadastrado' } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: 'Email e um campo obrigatorio' }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: 'Email invalido' },
                    uniqueness: { case_sensitive: false, message: 'Email ja cadastrado' }
  validates :password, presence: { message: 'Senha e um campo obrigatorio' }, length: { minimum: 6, message: 'Senha curta demais' }
  has_secure_password
  validate :has_dependence

  def has_dependence
    if allergyDescription.blank? and allergy == 'yes'
      errors.add(:allergyDescription, 'Se marcou que tem alergias, precisa lista-las')
    end
    if cancerDescription.blank? and cancer == 'yes'
      errors.add(:cancerDescription, 'Se marcou que ha historico de cancer na familia, precisa listar o tipo e parentesco')
    end
    if surgeryDescription.blank? and surgery == 'yes'
      errors.add(:surgeryDescription, 'Se marcou que passou por cirurgias, precisa lista-las')
    end
  end
end
