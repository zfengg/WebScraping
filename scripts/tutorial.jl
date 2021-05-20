# a test for web scraping in julia

# library
using HTTP, Gumbo
# get the website via url
r = HTTP.get("https://example.com/") # need the full url including the protocol
homepageZF = HTTP.get("https://fengzhou.me")

# parse the results
r_parsed = parsehtml(String(r.body))
r_parsed.root[1]
body = r_parsed.root[2]
h1 = body[1][1]
h1[1].text

# different status code
example_com = HTTP.head("https://example.com")
example_com.status
example_com_404 = HTTP.head("https://example.com/404", status_exception=false)
getstatuscode_500 = HTTP.head("https://getstatuscode.com/500", status_exception=false)
balloon_com = HTTP.head("http://balloon.com/", redirect=false)
fengzhou_me = HTTP.head("https://fengzhou.me", redirect=false)
relentless_com = HTTP.head("http://relentless.com", redirect=false)

# HTTP headers
headers = example_com.headers
headers[8][2]
for header in headers
    if headers[1] == "Last-Modified"
        println(header[2])
    end
end