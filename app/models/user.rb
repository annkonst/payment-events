class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :invites, dependent: :destroy
  has_and_belongs_to_many :product_lists
  has_attached_file :avatar
  validates :name, :phone_number, presence: true
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_format_of :phone_number, with: /\d[0-9]\)*\z/, message: I18n.t(:can_only_be_numerical)
  validates :phone_number, length: { minimum: 10, maximum: 15, message: I18n.t(:length_phone) }
  rescue => exception
    ExceptionNotifier.notify_exception(exception)
end
