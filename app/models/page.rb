# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :text(65535)
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ActiveRecord::Base
  include WebPageTestAPI
  belongs_to :project
  has_many :snapshots, dependent: :destroy

  validates_presence_of :url, :title, :project_id

  def send_test_request
    WebPageTestAPI::TestRequest.new(self.url).run_test
  end
end
