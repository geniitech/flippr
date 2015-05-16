# == Schema Information
#
# Table name: snapshot_data
#
#  id          :integer          not null, primary key
#  snapshot_id :integer
#  data        :text(65535)
#  statusCode  :string(255)
#  statusText  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SnapshotDatum < ActiveRecord::Base
  belongs_to :snapshot
end
