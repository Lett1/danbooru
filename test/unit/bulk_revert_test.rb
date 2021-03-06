require 'test_helper'

class BulkRevertTest < ActiveSupport::TestCase
  context "#find_post_versions" do
    subject do
      BulkRevert.new(added_tags: "hoge")
    end

    setup do
      subject.expects(:query_gbq).returns([1,2,3])
    end

    should "revert all changes found in a search" do
      q = subject.find_post_versions
      assert_match(/post_versions\.id in \(1,2,3\)/, q.to_sql)
    end
  end
end
