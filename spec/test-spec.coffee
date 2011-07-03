#require.paths.unshift('./node_modules');
#bcrypt = require('bcrypt')
#salt = bcrypt.gen_salt_sync(10)
#hash = bcrypt.encrypt_sync('password', salt)
#hash = '$2a$10$nUOOt0ssfj8HGK5.zl9X3.LGykM5mGxefceFa4FpBuOSCAX4ohxCi'
#console.log bcrypt.compare_sync('password', hash)
#console.log salt
#console.log hash

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