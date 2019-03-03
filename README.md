# FiveM---Universal-Whitelist
This is a white-list system for FiveM FX Servers, allowing both SQL white-listing and Standard white-listing.


Use the friendly config.lua to alter settings.

Installation:

1. Extract ZIP.
2. Move 'whitelist' folder into resources.
3. Include the following line in your server.cfg... start whitelist
4. Configure config.lua to your liking.
5. Restart your server and you're good to go!

SQL Installation:

1. Download MySQL Async: https://forum.fivem.net/t/release-mysql-async-library-3-0-8/21881
2. Include in resources folder
3. Start in server.cfg
4. Include the convar in server.cfg ABOVE the start line... 
set mysql_connection_string "server=ip;uid=user;password=pass;database=dbname"


See LICENSE file for the licensing of this product. Please do not claim this to be your own, but feel free to learn from it and use it to adapt your knowledge.
