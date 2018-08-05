require'./config/environment'


use Rack::MethodOverride
use CustomerController
use DrinkController
use OrderController
run ApplicationController