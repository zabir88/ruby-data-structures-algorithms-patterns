require 'net/http'
require 'json'
def getMovieTitles(substr) 
    ## first call
    uri = URI("https://jsonmock.hackerrank.com/api/movies/search/?Title=$spiderman&page=1")
    response = Net::HTTP.get_response(uri)
    response = JSON.parse(response.body)
    titles = []
    ## getting all titles and pushing them in titles array for the first call
    # for i in response['data']
    #     titles << i['Title']
    # end
    ## if multiple pages then additional api calls to get more titles
    # if(response['total_pages'] > 1)
    #     i = 2
    #     while(i <= response['total_pages']) 
    #         uri = URI("https://jsonmock.hackerrank.com/api/movies/search/?Title=${substr}&page=${i}")
    #         response = Net::HTTP.get_response(uri)
    #         response = JSON.parse(response.body) 
    #         for i in response['data']
    #             titles << i['Title']
    #         end
    #     end
    #     i += 1
    # end
    response
end

p getMovieTitles('spiderman')