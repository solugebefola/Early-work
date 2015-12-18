require 'byebug'
class Employee
  attr_reader :salary, :name, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    add_employee_to_boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  def add_employee_to_boss
    return if boss.nil?
    boss.employees << self
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name,title,salary,boss)
    @employees = []
  end

  def bonus(multiplier)
    add_salary * multiplier
  end

  def add_salary
    total_salary = 0
    @employees.each do |employee|
      # debugger
      if employee.is_a?(Manager)
        total_salary += (employee.add_salary + employee.salary)
      else
        total_salary += employee.salary
      end
    end
    total_salary
  end
end

ned = Manager.new("Ned","Founder",1_000_000,nil)
darren = Manager.new("Darren","TA Manager",78_000,ned)
shawna = Employee.new("Shawna","TA",12_000,darren)
david = Employee.new("David","TA",10_000,darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
