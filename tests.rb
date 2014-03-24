
#	Copyright 2013 AlchemyAPI
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.


require 'test/unit'
require './alchemyapi'


class Tests < Test::Unit::TestCase
	@@alchemyapi = AlchemyAPI.new()
	@@test_text = 'Bob broke my heart, and then made up this silly sentence to test the Ruby SDK'
	@@test_html = '<html><head><title>The best SDK Test | AlchemyAPI</title></head><body><h1>Hello World!</h1><p>My favorite language is Ruby</p></body></html>'
	@@test_url = 'http://www.nytimes.com/2013/07/13/us/politics/a-day-of-friction-notable-even-for-a-fractious-congress.html?_r=0'

	def test_entities
		puts 'Checking entities . . . '
		response = @@alchemyapi.entities('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.entities('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.entities('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.entities('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Entity tests complete'
		puts ''
	end

	def test_keywords
		puts 'Checking keywords . . . '
		response = @@alchemyapi.keywords('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.keywords('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.keywords('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.keywords('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Keyword tests complete'
		puts ''
	end
	
	def test_concepts
		puts 'Checking concepts . . . '
		response = @@alchemyapi.concepts('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.concepts('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.concepts('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.concepts('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Concept tests complete'
		puts ''	
	end

	def test_sentiment
		puts 'Checking sentiment . . . '
		response = @@alchemyapi.sentiment('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Sentiment tests complete'
		puts ''	
	end

	def test_sentiment_targeted
		puts 'Checking targeted sentiment . . . '
		response = @@alchemyapi.sentiment_targeted('text', @@test_text, 'heart')
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment_targeted('html', @@test_html, 'language')
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment_targeted('url', @@test_url, 'Congress')
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.sentiment_targeted('text', @@test_text, nil)
		assert_equal response['status'], 'ERROR'		#invalid target
		response = @@alchemyapi.sentiment_targeted('random', @@test_url, 'Congress')
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Targeted sentiment tests complete'
		puts ''	
	end

	def test_text
		puts 'Checking clean text . . . '
		response = @@alchemyapi.text('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.text('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.text('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Clean text tests complete'
		puts ''	
	end

	def test_text_raw
		puts 'Checking raw text . . . '
		response = @@alchemyapi.text_raw('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.text_raw('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.text_raw('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Raw text tests complete'
		puts ''	
	end

	def test_text_author
		puts 'Checking author. . . '
		response = @@alchemyapi.author('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.author('html', @@test_html)
		assert_equal response['status'], 'ERROR' 	#there is no author information in the test HTML
		response = @@alchemyapi.author('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Author tests complete'
		puts ''	
	end

	def test_title
		puts 'Checking title . . . '
		response = @@alchemyapi.title('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.title('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.title('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Title tests complete'
		puts ''	
	end

	def test_relations
		puts 'Checking relations . . . '
		response = @@alchemyapi.relations('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.relations('html', @@test_html)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.relations('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.relations('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Relations tests complete'
		puts ''	
	end
	
	def test_category
		puts 'Checking category . . . '
		response = @@alchemyapi.category('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.category('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.category('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.category('random', @@test_text)
		assert_equal response['status'], 'ERROR'		#invalid flavor
		puts 'Category tests complete'
		puts ''	
	end

	def test_feeds
		puts 'Checking feeds . . . '
		response = @@alchemyapi.feeds('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.feeds('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.feeds('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Feed tests complete'
		puts ''	
	end

	def test_microformats
		puts 'Checking microformats . . . '
		response = @@alchemyapi.microformats('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for HTML and URL content
		response = @@alchemyapi.microformats('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.microformats('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Microformat tests complete'
		puts ''	
	end

	def test_taxonomy
		puts 'Checking taxonomy . . . '
		response = @@alchemyapi.taxonomy('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.taxonomy('url', @@test_url)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.taxonomy('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.taxonomy('random', @@test_text)
		assert_equal response['status'], 'ERROR'	#invalid flavor
		puts 'Taxonomy tests complete'
		puts ''
	end

	def test_combined
		puts 'Checking combined . . . '
		response = @@alchemyapi.combined('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'ERROR'	#only valid for text and URL content
		response = @@alchemyapi.combined('text', @@test_text)
		assert_equal response['status'], 'OK'
		response = @@alchemyapi.combined('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Combined tests complete'
		puts ''	
	end

	def test_image
		puts 'Checking image . . . '
		response = @@alchemyapi.image('text', @@test_text)
		assert_equal response['status'], 'ERROR'	#only valid for URL content
		response = @@alchemyapi.image('html', @@test_html, { 'url'=>'test' })
		assert_equal response['status'], 'ERROR'	#only valid for URL content
		response = @@alchemyapi.image('url', @@test_url)
		assert_equal response['status'], 'OK'
		puts 'Image tests complete'
		puts ''	
	end

end




