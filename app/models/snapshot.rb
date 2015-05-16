# == Schema Information
#
# Table name: snapshots
#
#  id         :integer          not null, primary key
#  statusCode :string(255)
#  statusText :string(255)
#  data       :text(65535)
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Snapshot < ActiveRecord::Base
  include WebPageTestAPI
  belongs_to :page
  has_many :snapshot_data, dependent: :destroy

  store :data, accessor: [:testId, :ownerKey, :jsonUrl, :xmlUrl, :userUrl, :summaryCSV, :detailCSV], coder: Hash

  def get_test_result
    WebPageTestAPI::TestResult.new(self.data[:testId], self.id).get_result
  end
end
