require 'cgi'

module Padrino
  module Utils
    extend self

    ##
    # Builds an URI query from a Hash or any Object.
    #
    # Examples (~ marks here that output is actually escaped by CGI):
    #
    #   Utils.build_uri_query(:a => 1, :b => 2)           #=> "a=1&b=2"
    #   Utils.build_uri_query(:a => [1, 2])               #=> ~"a[]=1&a[]=2"
    #   Utils.build_uri_query([1, 2], 'namespace')        #=> ~"namespace[]=1&namespace[]=2"
    #   Utils.build_uri_query(:a => { :d => 2 }, :b => 3) #=> ~"a[d]=2&b=3"
    #
    def build_uri_query(object, namespace = nil)
      case object
      when Hash
        object.map do |key, value|
          next if value == {} || value == []
          build_uri_query(value, namespace ? "#{namespace}[#{key}]" : key)
        end.compact.join('&')
      when Array
        fail ArgumentError, 'namespace is missing' unless namespace
        (object.empty? ? [''] : object).map do |value|
          build_uri_query(value, "#{namespace}[]")
        end.join('&')
      else
        fail ArgumentError, 'namespace is missing' unless namespace
        "#{CGI.escape(namespace.to_s)}=#{CGI.escape(object.to_s)}"
      end
    end
  end
end
