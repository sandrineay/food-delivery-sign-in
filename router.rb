# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    employee = @sessions_controller.sign_in
    while @running
      if employee.manager?
        choice = display_manager_menu
        execute_manager_actions(choice)
      else
        choice = display_delivery_menu
        execute_delivery_actions(choice)
      end
    end
  end

  private

  def display_manager_menu
    puts "What do you want to do next?"
    puts "1. List all the meals"
    puts "2. Add a meal"
    puts "3. List all the customers"
    puts "4. Add a customer"
    puts "5. Exit the program"
    puts "6. Sign out"
    gets.chomp.to_i
  end

  def execute_manager_actions(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @running = false
    when 6 then run
    end
  end

  def display_delivery_menu
    puts "What do you want to do next?"
    puts "1. List my orders"
    puts "2. Mark an order as delivered"
    puts "3. Exit the program"
    puts "4. Sign out"
    gets.chomp.to_i
  end

  def execute_delivery_actions(choice)
    case choice
    when 1 then puts "TO DO list orders"
    when 2 then puts "TO DO mark order as delivered"
    when 3 then @running = false
    when 4 then run
    end
  end
end

























