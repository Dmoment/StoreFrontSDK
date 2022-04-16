module Vendo
  class Collection
    attr_reader :data, :count, :total_count, :total_pages, :next_cursor, :prev_cursor
    # from_response(response, key: line_items, type: LineItem)
    def self.from_response(response, key:, type:)
      body = response.body
      self.new(
        data: body[key].map{ |attrs| type.new(attrs) },
        count: body.dig("meta", "count"),
        total_count: body.dig("meta", "total_count"),
        total_pages: body.dig("meta", "total_pages"),
        next_cursor: body.dig("links", "next"),
        prev_cursor: body.dig("links", "prev")
      )
    end

    def initialize(data:, count:, total_count:, total_pages:, next_cursor:, prev_cursor:)
      @data = data
      @count = count
      @total_count = total_count
      @total_pages = total_pages
      @next_cursor = next_cursor
      @prev_cursor = prev_cursor
    end
  end
end