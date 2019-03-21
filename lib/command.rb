require_relative 'invalid_command'

module Command

  def place(x, y, dir, robot_name)

    validate(x = (x.to_i if /\A\d+\Z/.match(x)),
             y = (y.to_i if /\A\d+\Z/.match(y)),
             dir)

    @robots[robot_name] = [x, y, dir]
  end

  def move(robot_name)
    x, y, dir = @robots[robot_name]

    new_x = x + @directions[dir.to_sym][2]
    new_y = y + @directions[dir.to_sym][3]

    validate(new_x, new_y, dir)
    
    @robots[robot_name] = [new_x, new_y, dir]
  end

  def left(robot_name)
    
    dir = @robots[robot_name][2]

    @robots[robot_name][2] = @directions[dir.to_sym][0]
  end

  def right(robot_name)

    dir = @robots[robot_name][2]

    @robots[robot_name][2] = @directions[dir.to_sym][1]
  end

  def report(robot_name)
   
    @robots.each do |name, position|
	    puts "#{name.upcase}: #{position[0]},#{position[1]},#{position[2]}"
	  end
  end
end