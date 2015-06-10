require 'google/api_client'
client = Google::APIClient.new(:key => 'AIzaSyBdV8zSVKA5KPlu9Utl5-PrKDFHE36LLBU')
translate = client.discovered_api('translate', 'v2')
result = client.execute(
  :api_method => translate.translations.list,
  :parameters => {
    'format' => 'text',
    'target' => 'hi',
    'q' => 'delhi'
  }
)

p result