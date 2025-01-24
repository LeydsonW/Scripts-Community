local urlScript = 'https://raw.githubusercontent.com/LeydsonW/Scripts-Community/main/community_scripts.lua';
modules.corelib.HTTP.get(urlScript, function(script) 
    assert(loadstring(script))() 
end);
