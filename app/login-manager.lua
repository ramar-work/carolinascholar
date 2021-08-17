-- Return a login status
response = {}
response.ctype = "application/json"

if request.method ~= "POST" 
then
	response.status = 400
	response.content = '{ "message": "Bad request." }'
else
	response.status = 200
	local t = json.decode( request.body.body.value )
	-- response.content = json.encode( t )

---[[
	-- Check user name and password
	val = db.exec{
		conn = config.db
	,	string = "SELECT * FROM users WHERE username = :name"
	,	bindargs = { name = t.username }
	}

	if val.count < 1
	then
		response.status = 401
		response.content = json.encode{ message = "Unauthorized." }
		return
	end

	-- Can dump the stuff and bring it back
	response.content = json.encode( val )

	-- What we really want is a login token and an expiry date.
	-- Return the token to the client, and on each request
	-- check that expiry date has not been reached
--]]
end
