require'./config/environment'


use Rack::MethodOverride
use CustomerController
use DrinkController
run ApplicationController