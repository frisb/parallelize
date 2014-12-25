assert = require('assert')

testType = (name, value) ->
  describe name, ->
    it 'should return ' + name, ->
      packed = deepak.packValue(value)
      unpacked = deepak.unpackValue(packed)
      assert.deepEqual(value, unpacked)

describe 'Pack / Unpack', ->
  describe 'Types', ->
    testType('end of DB', '\xff')
    testType('undefined', undefined)
    testType('string', 'string')
    testType('integer', 100)
    testType('decimal', 100.12345)
    testType('boolean', true)
    testType('null', null)
    testType('date', new Date())
    testType('array', [{  }, 'string', 1, [1.23]])
    testType('object', { x: 'y' })
  
numberOfCalculations = ~~(Math.random() * 1000)  

  
processes = ~~(Math.random() * 10)  

    
describe "#{numberOfCalculations} on #{processes} in parallel"
  it 'should return ' + numberOfCalculations, ->
    
    options = 
      fdb: provider.fdb
      subspace: subspace
      begin: subspace.pack([])
      end: subspace.pack(['\xff'])
      processes: 5
    
    complete = (err, count) ->
      console.log(err, count)
    
    CounterTask = require('./counter')
    counter = new CounterTask('./counter', options)
    counter.run(complete)
    
    counter.on 'completed', (val) ->
      console.log('emit', val)
