return {
	db = "sqlite3://db/carolina.db",
	title = "carolinascholar.com",
	fqdn = "carolinascholar.com",
	static = { "/assets", "/ROBOTS.TXT", "/favicon.ico" },
	routes = {
		["/"] = { model="hello",view="hello" },
		["login"] = { 
			model="login-manager"
		},
		["search"] = { 
			model="search-manager"
		},
	}	
}
