class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum:2, maximum: 20 }
  validates :introduction, length: { maximum: 160 }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :profile_image, destroy: false

  # 論理削除のため記述
  acts_as_paranoid

   # フォロー取得（class_name:でRelationshipモデルを指定。foreign_key:でfollower_idを入り口として来させる指示）
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローしている人(:throughで中間テーブルを設定。has_manyと合わせて使用。source:で出口を指定。)
  has_many :following_user, through: :follower, source: :followed
  # 自分をフォローしている人
  has_many :follower_user, through: :followed, source: :follower

  # フォローする
  def create(user_id)
    follower.create(followed_id: user_id)
  end
  # フォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # フォローしていればtrueを返す
  # include：複数テーブルからデータ取得する際のアクセス回数を減らせる
  def following?(user)
    following_user.include?(user)
  end
end
