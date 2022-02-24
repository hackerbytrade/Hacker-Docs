import flask
s = 'HTB'

x = s.__class__.mro()[1].__subclasses__()

def searchfunc(name):
  x = s.__class__.mro()[1].__subclasses__()
  for i in range(len(x)):
    fn = x[i].__name__
    if fn.find(name) > -1:
      print(i, fn)

searchfunc('warning')