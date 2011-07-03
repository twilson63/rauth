# require.paths.unshift('./node_modules');
# redis = require 'redis'
# db = redis.createClient()
# 
# db.hget 'jackdocs:accounts:jackhq', 'password', (err, result) ->
#   console.log result
#   process.exit(0)
# db.sismember 'apps', 'jackdocs', (err, result) ->
#   console.log result
#   process.exit(0)

# db.hmset 'jackdocs:accounts:foo', awesome: 'sauce', (err, result) ->
#   console.log result
#   process.exit(0) 
# db.sadd 'apps', 'awesome', (err, result) -> 
#   console.log result
#   process.end()
#db.keys '*', (err, result) -> console.log result