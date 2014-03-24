
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


require './alchemyapi'

demo_text = 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.'
demo_url= 'http://www.npr.org/2013/11/26/247336038/dont-stuff-the-turkey-and-other-tips-from-americas-test-kitchen'
demo_html = '<html><head><title>Python Demo | alchemyapi</title></head><body><h1>Did you know that alchemyapi works on HTML?</h1><p>Well, you do now.</p></body></html>'

alchemyapi = AlchemyAPI.new()


puts ''
puts ''
puts '############################################'
puts '#   Entity Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.entities('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Entities ##'
	for entity in response['entities']
		puts 'text: ' + entity['text']
		puts 'type: ' + entity['type']
		puts 'relevance: ' + entity['relevance']
		print 'sentiment: ' + entity['sentiment']['type'] 
		
		#Make sure score exists (it's not returned for neutral sentiment
		if entity['sentiment'].key?('score')
			print ' (' + entity['sentiment']['score'] + ')'
		end

		puts ''
	end
else
	puts 'Error in entity extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Keyword Extration Example               #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.keywords('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Keywords ##'
	for keyword in response['keywords']
		puts 'text: ' + keyword['text']
		puts 'relevance: ' + keyword['relevance']
		print 'sentiment: ' + keyword['sentiment']['type'] 
		

		#Make sure score exists (it's not returned for neutral sentiment
		if keyword['sentiment'].key?('score')
			print ' (' + keyword['sentiment']['score'] + ')'
		end

		puts ''
	end
else
	puts 'Error in keyword extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Concept Tagging Example                 #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.concepts('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Concepts ##'
	for concept in response['concepts']
		puts 'text: ' + concept['text']
		puts 'relevance: ' + concept['relevance']
		puts ''
	end
else
	puts 'Error in concept tagging call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Sentiment Analysis Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing html: ' + demo_html
puts ''

response = alchemyapi.sentiment('html', demo_html)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Document Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']
	
	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end
else
	puts 'Error in sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Targeted Sentiment Analysis Example    #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.sentiment_targeted('text', demo_text, 'Denver')

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Targeted Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']
	
	#Make sure score exists (it's not returned for neutral sentiment
	if response['docSentiment'].key?('score')
		puts 'score: ' + response['docSentiment']['score']
	end

else
	puts 'Error in targeted sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Text Extraction Example                #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.text('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Extracted Text ##'
	puts 'text: ' + response['text']
	puts ''
else
	puts 'Error in text extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Author Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.author('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Author ##'
	puts 'author: ' + response['author']
else
	puts 'Error in author extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Language Detection Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.language('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Language ##'
	puts 'text: ' + response['language']
	puts 'iso-639-1: ' + response['iso-639-1']
	puts 'native speakers: ' + response['native-speakers']
else
	puts 'Error in language detection call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Title Extraction Example               #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.title('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Title ##'
	puts 'title: ' + response['title']
else
	puts 'Error in title extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Relation Extraction Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.relations('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Relations ##'
	for relation in response['relations']
		if relation.key?('subject')
			puts 'subject: ' + relation['subject']['text']
		end

		if relation.key?('action')
			puts 'action: ' + relation['action']['text']
		end

		if relation.key?('object')
			puts 'object: ' + relation['object']['text']
		end
		puts ''
	end
else
	puts 'Error in relation extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Text Categorization Example            #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.category('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Category ##'
	puts 'text: ' + response['category']
	puts 'score: ' + response['score']
else
	puts 'Error in text categorization call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Feed Detection Example                  #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.feeds('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Feeds ##'
	for feed in response['feeds']
		puts 'feed: ' + feed['feed']
	end
else
	puts 'Error in feed detection call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Microformats Parsing Example            #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.microformats('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Microformats ##'
	for microformat in response['microformats']
		puts 'field: ' + microformat['field']
		puts 'data: ' + microformat['data']
		puts ''
	end
else
	puts 'Error in microformats parsing call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Taxonomy Example            			 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.taxonomy('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Taxonomy ##'
	for taxonomy in response['taxonomy']
		puts 'label: ' + taxonomy['label']
		puts 'score: ' + taxonomy['score']
		if taxonomy.key?('confident')
			puts 'confident: ' + taxonomy['confident']
		end
		puts ''
	end
else
	puts 'Error in taxonomy call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Image Extraction Example            	 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.image('url', demo_url, { 'extractMode'=>'trust-metadata' })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Image Extraction ##'
	if response.key?('image')
		puts 'image: ' + response['image']
	end
	puts ''
else
	puts 'Error in image extraction call: ' + response['statusInfo']
end

puts ''
puts ''


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Combined Example            			 #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.combined('url', demo_url, { 'extract'=>'page-image,keyword,entity' })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Combined Data ##'
	if response.key?('keywords')
		puts 'Keywords:'
		for keyword in response['keywords']
			puts "\ttext: " + keyword['text']
			puts "\trelevance: " + keyword['relevance']
			puts ''
		end
	end
	if response.key?('image')
		puts 'image: ' + response['image']
		puts ''
	end
	if response.key?('entities')
		puts 'Entities:'
		for entity in response['entities']
			puts "\trelevance: " + entity['relevance']
			puts "\ttext: " + entity['text']
			puts "\tcount: " + entity['count']
			puts "\ttype: " + entity['type']
			if entity.key?('disambiguated')
				puts "\tdisambiguated: "
				if entity['disambiguated'].key?('dbpedia')
					puts "\t\tdbpedia: " + entity['disambiguated']['dbpedia']
				end
				if entity['disambiguated'].key?('freebase')
					puts "\t\tfreebase: " + entity['disambiguated']['freebase']
				end
			end
			puts ''
		end
	end
	puts ''
else
	puts 'Error in combined call: ' + response['statusInfo']
end

puts ''
puts ''

