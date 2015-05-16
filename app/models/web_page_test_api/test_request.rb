module WebPageTestAPI
  class TestRequest
    include HTTParty
    base_uri "webpagetest.org"

    attr_accessor :options

    def initialize(url, format="json")
      @options = {query: {url: url, f: format, k: Rails.application.secrets.web_page_test_api_key}}
    end

    def run_test
      response = self.class.get('/runtest.php', options)
      parsed_response = response # TODO: Response parser
      snapshot = Snapshot.create(parsed_response)
    end
  end
end