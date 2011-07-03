express = require 'express'
redis = require 'redis'
bcrypt = require 'bcrypt'

db = redis.createClient()
app = express.createServer()

app.use express.bodyParser()

app.get '/', (req, resp) -> 
  resp.end 'Welcome to RAuth'

# Log In
app.post '/:app/authenticate', (req, resp) ->
  db.sismember "#{req.params.app}:accounts", req.body.account, (err, result) ->
    if result == 1 
      db.hget "#{req.params.app}:accounts:#{req.body.account}", "password_hash", (err, hash) ->
        resp.end if bcrypt.compare_sync(req.body.password, hash) then 'OK' else 'FAIL'
    else
      resp.end 'FAIL'

# Sign Up 
app.post '/:app/:account', (req, resp) ->
  db.sismember "apps", req.params.app, (err, result) ->
    if result == 1 and req.body.password == req.body.confirm
      salt = bcrypt.gen_salt_sync(10)
      account = 
        email: req.body.email
        password_hash: bcrypt.encrypt_sync(req.body.password, salt)
      db.multi()
        .sadd("#{req.params.app}:accounts", req.params.account)
        .hmset("#{req.params.app}:accounts:#{req.params.account}", account)
        .exec (err, replies) ->
          #console.log replies
          resp.end 'OK'
               
app.listen 3000

console.log 'Server is Listening on 3000...'
