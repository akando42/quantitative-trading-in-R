Pass CURL
curl -v https://api.robinhood.com/api-token-auth/ -H "Accept: application/json" -d username=troydo42 --data-urlencode password=LessIsMore42!/990


curl -v https://api.robinhood.com/oauth2/token/ -H "Accept: application/json" -d {"grant_type":"password","scope":"internal","client_id":"c82SH0WZOsabOXGP2sxqcj34FxkvfnWRZBKlBjFS","expires_in":86400,"device_token":"3bc4eeef-f2aa-4fed-aa73-632713d6fdb5","username":"troydo42@gmail.com","password":"LessIsMore42\!990"}
curl -v https://financialmodelingprep.com/api/v3/financials/income-statement/NFLX