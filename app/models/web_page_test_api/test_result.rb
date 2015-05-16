module WebPageTestAPI
  class TestResult
    include HTTParty
    base_uri "webpagetest.org"

    attr_accessor :options, :snapshot_id

    def initialize(test_id, snapshot_id)
      @snapshot_id = snapshot_id
      @options = {query: {test: test_id}}
    end

    def get_result
      response = self.class.get('/jsonResult.php', options)
      parsed_response = response # TODO: Response parser
      snapshot_datum = SnapshotDatum.create(parsed_response.merge!(snapshot_id: snapshot_id))
    end
  end
end