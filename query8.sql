UPDATE Employee SET Salary =      IF(Role = 'Delivery' AND Salary > 50000, Salary - 5000,         IF(Role = 'Manager' AND Salary < 50000, Salary + 5000, Salary)); 
