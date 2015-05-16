module WebPageTestAPI
  class TestResult
    include HTTParty
    base_uri "webpagetest.org"

    attr_accessor :options

    def initialize(test_id)
      @options = {query: {test: test_id}}
    end

    def get_result
      self.class.get('/jsonResult.php', options)
    end
  end
end