api = require('fermata').api url: 'http://localhost:3000'
require '../app'

describe 'app', ->
  it 'GET /', ->
    api.get (err, results) ->
      expect(results).toEqual 'Welcome to RAuth'
      asyncSpecDone()
    asyncSpecWait()

  # Sign Up
  it 'POST /:app/:account', ->
    api['jackdocs']['jackhq3'].post email: 'my@email.com', password: 'password', confirm: 'password', (err, result) ->
      expect(result).toEqual 'OK'
      asyncSpecDone()
    asyncSpecWait()
  
  # Log In - Success
  it 'POST /:app/authenticate', ->
    api.jackdocs.authenticate.post account: 'jackhq', password: 'password', (err, result) ->
      expect(result).toEqual 'OK'
      asyncSpecDone()
    asyncSpecWait()
    
  # Log In - Fail
  it 'POST /:app/authenticate', ->
    api.jackdocs.authenticate.post account: 'jackhq', password: 'password2', (err, result) ->
      expect(result).toEqual 'FAIL'
      asyncSpecDone()
    asyncSpecWait()
  
    