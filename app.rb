# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/employee_repository"

csv_file   = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(csv_file)
meals_controller = MealsController.new(meal_repository)

csv_customer = File.join(__dir__, 'data/customers.csv')
customer_repository = CustomerRepository.new(csv_customer)
customers_controller = CustomersController.new(customer_repository)

csv_employee = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(csv_employee)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
