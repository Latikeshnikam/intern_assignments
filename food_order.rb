#!/usr/bin/ruby2.5

$restaurents = ["Dominoz","Eatsome","Biryani House"]

$dish = {"Dominoz" => [{"pizza":100},{"Burger":80},{"French Fries":50}],"Eatsome" => [{"Mixed veg":120},{"Pulav":100},{"Dal":80}],"Biryani House"=>[{"Veg Biryani":100},{"Non veg Biryani":150}]}

$dish_available = {"Dominoz" => [{"pizza" =>"yes"},{"Burger" => "yes"},{"French Fries":"no"}],"Eatsome" => [{"Mixed Veg" => "yes"},{"Pulav" => "yes"},{"Dal":"no"}],"Biryani House" => [{"Veg Biryani":"no"},{"Non Veg Diryani":"yes"}]}

class FoodOrder

	@@order_id = 0
	def initialize()
		@customer_name = ""
		@restaurent_name = ""
		@amount = 0
       		@dishname = ""
  	        @order_status = "Not Delivered"
                @quantity = 0
                @@order_id = @@order_id + 1

  	end


  	def self.order_id_update
		@@order_id
  	end



  	def check_dish_availability(dish_no)

    		check_arr = $dish_available[@restaurent_name]
    		check = check_arr[dish_no.to_i - 1]
    		check = check.values
    		check = check[0]

    		if check == "no"
      			return 1
    		else
      			return 0
    		end

  	end



  	def show_restaurents
		count = 0
    		puts "Available Restaurents are : "
    		for i in 0..2 do
			count = count + 1
      			puts "#{count}. #{$restaurents[i]} "
		end

    		puts "Select one restaurent : "

    		selected_restaurent = gets

    		return selected_restaurent
       	end



  	def get_dishname

    		d_name = @restaurent_name

    		dishes = $dish[d_name]

    		count = 0
    		dishes.each do |x|

      			count = count + 1
      			y = x.keys
      			name = y[0]
      			y = x.values
      			price = y[0]

      		puts "#{count}. Dish Name : #{name} , Price : #{price}"
	        end



    		puts "Select a Dish"
    		d = gets

   	 	check = check_dish_availability(d)

    		if check == 1
      			puts
      			puts "Sorry Selected Dish is Not available !!!"

      			puts "Try Again"
      			d = get_dishname()
    		end

    		return d

  	end



  def get_cost

    cost = @price.to_i * @quantity.to_i

    return cost

  end



  def accept_order()

    puts "Enter your Name : "
    @customer_name = gets

    selected_restaurent = show_restaurents()

    index = selected_restaurent.to_i - 1

    @restaurent_name = $restaurents[index]


    d = get_dishname()

    c = $dish[@restaurent_name]
    dish_temp = c[d.to_i - 1]
    dish_name = dish_temp.keys
    @dishname = dish_name[0]
    price_temp = dish_temp.values
    @price = price_temp[0]

    puts "Enter Quantity of Dish : "
    @quantity = gets



    @amount = get_cost()

    puts "\n\n"
    puts "Order Summary : "

    puts "Customer Name : #{@customer_name}"
    puts "Selected Restaurent : #{@restaurent_name}"
    puts "Selected Dish : #{@dishname}"
    puts "Quantity : #{@quantity}"
    puts "Total Amount to Pay : #{@amount}"
    puts "Order Status : #{@order_status}"

    #$sales = $sales.merge(Order.order_id_update => @order_status)

    puts "Whether order was delivered : (y/n) : "
    status = gets.chomp

    if status == 'Y' or status == 'y'

      @order_status = "Delivered"
      puts "Thank You for ordering !!!"

    else

      @order_status = "Pending"
      puts "Please Wait for Some Time"

    end

  end

end



loop do

  order = FoodOrder.new()

  order.accept_order()

  puts
  puts "Do you want to order more : (y/n)"
  choice = gets.chomp

  if choice == 'n' or choice == 'N'
    break
  end

end
