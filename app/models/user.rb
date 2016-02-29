class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :invites, dependent: :destroy
  has_and_belongs_to_many :product_lists
  has_attached_file :avatar,
                    styles: { thumb: "100x100!" },
                    storage: :s3,
                    s3_credentials: { bucket: ENV['S3_BUCKET_NAME'],
                                      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                                      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }
  validates :name, :phone_number, presence: true
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                                size: { less_than: 300.kilobytes, message: I18n.t(:less_than_300) }
  validates_format_of :phone_number, with: /\d[0-9]\)*\z/, message: I18n.t(:can_only_be_numerical)
  validates :phone_number, length: { minimum: 10, maximum: 15, message: I18n.t(:length_phone) }
end
