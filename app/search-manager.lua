-- Should probably respond to GET only...

-- Shit, I'm getting old...
response = {}
response.ctype = "application/json"


-- This is a good idea and probably be done, but if you need to resort to JSON, do it
if request.method ~= "GET" or not request.url
then
	response.status = 400
	response.content = json.encode{ message = "Bad request" }
else
	response.status = 200
---[[
	-- If q is not in request.url, then you probably also need to 
	-- return bad request...
	if not request.url.q then
		response.status = 400
		response.content = json.encode{ message = "Bad request" }
	end

	-- Try to open the db and do the search
	val = db.exec{
		conn = config.db
	,	string = "SELECT * FROM scholarship WHERE name LIKE :qname"
		-- Get creative with binding...
	,	bindargs = { qname = "%" .. request.url.q.value .. "%" }
	}

	-- Package a response
	response.content = json.encode( val )
--]]
end



