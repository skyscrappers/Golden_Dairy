import mysql.connector
import random
import datetime
con=mysql.connector.connect(host="localhost",user="root",passwd="Aditya",database="golden_dairy",charset="utf8")
if con.is_connected():
    print("Successful")
else:
    print("Failed")
mycursor = con.cursor()
mycursor.execute("select count(Customer_ID), Type from product_in_cart join Product on product_in_cart.Product_ID = Product.ID Group by Type;")
res = mycursor.fetchall()
def login():
    uid=input("Enter your user id: ")
    mycursor.execute("select password, Name from customers where customer_id = %s", (uid,))
    try:
        for row in mycursor:
            name=row[1]
            actual_passwd = row[0]
            passwd=input("Enter your password: ")
        if(actual_passwd==passwd):
            return customerpage(uid,name)
        else:
            print("Invalid password")
            return
    except:
        print("Invalid customer id")
        return 
    # for row in mycursor:
    #     name=row[1]
    #     return customerpage(uid,name)
def customerpage(uid,name):
    while(True):
        c = int(input(f"Welcome {name}! What would you like to do today?\n1. Check profile information\n2. Check cart\n3. View products\n4. Add products to cart\n5. Place order\n6. Check previous orders\n7. Get more product information\n8. Logout\n"))
        if(c==1):
            mycursor.execute("select * from customers where id=%s",(uid,))
            l=mycursor.fetchall()
            for row in l:
                print(f"Name:{row[0]}\nID:{row[1]}\nPassword:{row[2]}\nAddress:{row[3]}\nEmail:{row[4]}\nContact_No:{row[5]}")
        elif(c==2):
            mycursor.execute("SELECT Product.Name, Product.ID, product.price, product.type, product.quantity, product_in_cart.Quantity  FROM Customers  INNER JOIN product_in_cart  ON Customers.customer_id = product_in_cart.Customer_ID  INNER JOIN Product  ON Product.ID = product_in_cart.Product_ID where customers.customer_id=%s",(uid,))
            l=mycursor.fetchall()
            print("{:<30} {:<10} {:<10} {:<20} {:<10} {:<20}".format('Name','ID','Price','Type','Quantity',"Number of items"))
            sum=0
            for row in l:
                print("{:<30} {:<10} {:<10} {:<20} {:<10} {:<20}".format(row[0],row[1],row[2],row[3],row[4],row[5]))
                sum+=row[2]*row[5]
            print("The total cost of the order is:",sum)
        elif(c==3):
            productlist()
        elif(c==4):
            pid=int(input("Enter the product id of the product you want to order: "))
            quant=int(input("Enter the number of items you want to order: "))
            mycursor.execute("select * from product")
            lst = mycursor.fetchall()
            id=len(lst)
            if(pid<=id):
                mycursor.execute("select * from product_in_cart where product_id=%s and Customer_ID=%s;",(pid,uid))
                cartcheck=mycursor.fetchall()
                if(len(cartcheck)!=0):
                    mycursor.execute("update product_in_cart set quantity=quantity+%s where product_id =%s and customer_id=%s;",(quant,pid,uid))
                else:
                    mycursor.execute("insert into product_in_cart values(%s,%s,%s)",(pid,uid,quant))
                con.commit()
                print("Product added")
        elif(c==5):
            mycursor.execute("select product_id, quantity from product_in_cart where customer_id = %s",(uid,))
            cart=mycursor.fetchall()
            mycursor.execute("select id, price, availability from product")
            prod=mycursor.fetchall()
            sum=0
            check=1
            mycursor.execute("select * from orders")
            lst = mycursor.fetchall()
            id=len(lst)+1
            if(len(cart)!=0):
                for i in cart:
                    if(i[1]<=prod[i[0]][2]):
                        sum+=prod[i[0]][1]*i[1]
                    else:
                        print("Product ",i[0]," is out of stock")
                        check=0
                if(check):
                    print("The total cost of your order is ",sum)
                    confirm=str(input("Confirm order?(yes/no) "))
                    if(confirm=="yes"):
                        mycursor.execute("select * from employee where role='Delivery'")
                        elist=mycursor.fetchall()
                        eid=elist[random.randint(0,len(elist))][0]
                        paymode=input("Enter your mode of payment for the order (Cash/Credit Card/Debit Card/Net Banking/UPI): ")
                        current_datetime = datetime.datetime.now()
                        formatted_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
                        mycursor.execute("insert into orders values(%s,%s,%s,%s,%s,%s)",(id,paymode,eid,uid,formatted_datetime,sum))
                        con.commit()
                        for i in cart:
                            mycursor.execute("INSERT INTO New_order VALUES(%s,%s,%s)",(id,i[0],i[1]))
                            mycursor.execute("update product set availability=availability - %s where id = %s",(i[1],i[0]))
                            con.commit()
                        mycursor.execute("delete from product_in_cart where customer_id=%s",(uid,))
                        con.commit()
                        print("Order confirmed")
            else:
                print("Looks like you haven't added anything to the cart yet")
        elif(c==6):
            mycursor.execute("select orders.order_id,orders.cost,product.name,product.id,product.price,product.Type,product.Quantity,new_order.Quantity as Number from orders inner join new_order on orders.order_id=new_order.orderid inner join product on product.id=new_order.productid where Customer_ID=%s;",(uid,))
            l=mycursor.fetchall()
            mycursor.execute("select distinct(orderid) from new_order inner join orders on new_order.OrderID=orders.order_id where orders.customer_id = %s;",(uid,))
            d=mycursor.fetchall()
            if(len(d)!=0):
                for i in d:
                    print(f"Order {i[0]}")
                    print("{:<30} {:<10} {:<10} {:<20} {:<10} {:<20}".format('Name','ID','Price','Type','Quantity',"Number of items"))
                    for j in l:
                        if(i[0]==j[0]):
                            print("{:<30} {:<10} {:<10} {:<20} {:<10} {:<20}".format(j[2],j[3],j[4],j[5],j[6],j[7]))
                    print("\n")
            else:
                print("Looks like you haven't ordered anything in the past.")
        elif(c==7):
            moreproductinfo()
        elif(c==8):
            return 
def signup():
    name=str(input("Enter your name: "))
    passwd=str(input("Enter your password: "))
    addr=str(input("Enter your address: "))
    email=input("Enter your email id: ")
    phone=input("Enter your phone number: ")
    mycursor.execute("select * from customers")
    lst = mycursor.fetchall()
    id=len(lst)+1
    mycursor.execute("insert into customers(Name, customer_id, password, Address,Email,Contact_No) values (%s,%s,%s,%s,%s,%s)",(name,id,passwd,addr,email,phone))
    con.commit()
    print("Signup successful. Your customer id is ",id)
def admin_login():
    uid=input("Enter your admin id: ")
    mycursor.execute("select password, Name from admin where ID = %s", (uid,))
    try:
        for row in mycursor:
            name=row[1]
            actual_passwd = row[0]
            # print(actual_passwd)
        passwd=input("Enter your password: ")
        if(actual_passwd==passwd):
            return adminpage(uid,name)
        else:
            print("Invalid password")
            return 
    except:
        print("Invalid admin id")
        return 
    # for row in mycursor:
    #     name=row[1]
    # return adminpage(uid,name)
def adminpage(uid,name):
    while(True):
        c = int(input(f"Welcome {name}! What would you like to do today?\n1. Check sales info \n2. Check employees data\n3. Most selling product\n4. Check supplier data\n5. Add a product\n6. Add an employee\n7. Add a supplier\n8. Product catalogue\n9. More product information\n10. Check analysis\n11. Update employee role\n12. Give order to production facility\n13. Logout\n"))
        if (c==1):
            date1=input("This will show the value of total sales between a time period\nEnter the starting date and time (in form of YYYY-MM-DD hh:mm:ss): ")
            date2 = input("Enter the ending date and time (in form of YYYY-MM-DD hh:mm:ss): ")
            mycursor.execute("select sum(Cost) AS 'Total Revenue' from Orders where Date_Time_of_Purchase between %s and %s;",(date1,date2))
            # mycursor.execute("select sum(Cost) AS 'Total Revenue' from Orders where Date_Time_of_Purchase between %s and %s;",('2021-01-01 00:00:00','2021-12-31 23:59:59'))
            sales=mycursor.fetchall()
            if(sales!=None):
                print("The total sales are: ",sales[0][0],"\n")
            else: 
                print(0)    
        elif(c==2):
            id=int(input("Enter the id of the employee you want to see information about: "))
            mycursor.execute("Select * from employee where employee.id = %s",(id,))
            l=mycursor.fetchall()
            for row in l:
                print(f"Id: {row[0]} \nName: {row[1]} \nAddress: {row[2]} \nEmail: {row[3]} \nContact No: {row[4]} \nSalary: {row[5]}\nRole: {row[6]}")
        elif (c==3):
            mycursor.execute("select Product.Name, Product.ID, Product.Price, T.order_frequency, Product.Quantity  from Product inner join (select productid, count(ProductID) as order_frequency from New_Order group by(productid) order by (order_frequency) DESC limit 1) as T where ProductID = Product.ID; ")
            l=mycursor.fetchall()
            print("{:<30} {:<10} {:<10} {:<20} {:<10}".format('Name','ID','Price','Order frequency','Quantity'))        
            for row in l:
                print("{:<30} {:<10} {:<10} {:<20} {:<10}".format(row[0],row[1],row[2],row[3],row[4]))
        elif (c==4):
            id=int(input("Enter the id of the supplier you want to see information about: "))
            mycursor.execute("Select * from supplier where supplier.id = %s",(id,))
            l=mycursor.fetchall()
            for row in l:
                print(f"Id: {row[0]} \nName: {row[1]} \nAddress: {row[2]} \nEmail: {row[3]} \nContact No: {row[4]} \nType of Supply: {row[5]}")
        elif(c==5):
            pname=input("Enter product name: ")
            type=input("Enter product type: ")
            price=input("Enter the product price: ")
            rate=input("Enter the initial rating: ")
            protein=input("Enter the product protein value: ")
            en=input("Enter the product energy value: ")
            fat = input("Enter the product fat value: ")
            carb= input("Enter the product carbohydrate value: ")
            quantity=input("Enter the product quantity (in g/ml)")
            av= input("Enter the amount of products available: ")
            mycursor.execute("select * from product")
            lst = mycursor.fetchall()
            id=len(lst)+1
            mycursor.execute("insert into product values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(pname,id,type,price,rate,protein,en,fat,carb,quantity,av))
            con.commit()
            print("Product adding successful. Product id is ",id)
        elif(c==6):
            ename=str(input("Enter employee's name: "))
            addr=str(input("Enter employee's address: "))
            email=input("Enter employee's email id: ")
            phone=input("Enter employee's phone number: ")
            salary=str(input("Enter employee's password: "))
            role=input("Enter the role of the employee: ")
            mycursor.execute("select * from employee")
            lst = mycursor.fetchall()
            id=len(lst)+1
            mycursor.execute("insert into employee(Name, id, Address,Email,Contact_No,salary,role) values (%s,%s,%s,%s,%s,%s,%s)",(ename,id,addr,email,phone,salary,role))
            con.commit()
            print("Signup successful. The new employee's id is ",id)
        elif(c==7):
            sname=str(input("Enter supplier's name: "))
            addr=str(input("Enter supplier's address: "))
            email=input("Enter supplier's email id: ")
            phone=input("Enter supplier's phone number: ")
            mycursor.execute("select * from supplier")
            type=input("Enter the type of supply: ")
            lst = mycursor.fetchall()
            id=len(lst)+1
            mycursor.execute("insert into supplier(Name, id, Address,Email,Contact_No,Type_of_Supply) values (%s,%s,%s,%s,%s,%s)",(sname,id,addr,email,phone,type))
        elif(c==8):
            productlist()
        elif(c==9):
            moreproductinfo()
        elif(c==10):
            checkanalysis()
        elif(c==11):
            eid=int(input("Enter the ID of the employee whose role you want to change: "))
            newrole=input("Enter the new role of the employee: ")
            mycursor.execute("Update employee set employee.role=%s where employee.id=%s",(newrole,eid))
            con.commit()
            print("Updated employee role")
        elif(c==12):
            pid=int(input("Enter the id of the product you want to give order for: "))
            mycursor.execute("Update product set availability=availability + 100 where product.id=%s",(pid,))
            con.commit()
        elif(c==13):
            return 
def productlist():
    print("Choose among the following categories")
    mycursor.execute("select distinct(type) from product;")
    l=mycursor.fetchall()
    for i in range(len(l)):
        print(f"{i+1}. {l[i][0]}")
    c=int(input())-1
    if(c<=len(l)):
        mycursor.execute("select Name, ID, Price, Rating, Quantity from Product where type = %s;",l[c])
    print("{:<30} {:<10} {:<10} {:<10} {:<10}".format('Name','ID','Price','Rating','Quantity'))
    for row in mycursor:
        print("{:<30} {:<10} {:<10} {:<10} {:<10}".format(row[0],row[1],row[2],row[3],row[4]))
def moreproductinfo():
    c=int(input("Enter the product id of the product you want to see more information about: "))
    mycursor.execute("Select * from product where id=%s",(c,))
    l=mycursor.fetchall()
    print("{:<30} {:<10} {:<30} {:<10} {:<10} {:<10} {:<10} {:<10} {:<15} {:<10}".format('Name','ID','Type','Price','Rating','Protein','Energy','Fat','Carbohydrate','Quantity'))
    if(len(l)!=0):
        for row in l:
            print("{:<30} {:<10} {:<30} {:<10} {:<10} {:<10} {:<10} {:<10} {:<15} {:<10}".format(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8],row[9]))
        print("\n")
    else:
        print("No such product exists")
def checkanalysis():
    c=int(input("Enter the type of analysis you wish to perform:\n1. Sales based on payment modes\n2. Employees based on roles\n3. Products based on rating and type\n4. Customers on how many orders they have given in a year\n5. Number of customers giving particular number of orders in a year\n6. Return\n"))
    if(c==1):
        mycursor.execute("select coalesce(year(Date_Time_of_Purchase),'Total') as year, coalesce(Payment_Mode,'Total') as Payment_Mode, sum(Cost) from orders group by year, Payment_Mode with rollup;")
        l=mycursor.fetchall()
        print("{:<30} {:<30} {:<30}".format('year','Payment mode','Cost'))
        for row in l:
            if(row[0]!=None):
                print("{:<30} {:<30} {:<30}".format(row[0],row[1],row[2]))
            else:
                print("{:<30} {:<30} {:<30}".format("Total",row[1],row[2]))
    elif(c==2):
        mycursor.execute("Select coalesce(Role,'Average') as Role, AVG(Salary) AS Average_Salary from Employee GROUP BY Role with ROLLUP; ")
        l=mycursor.fetchall()
        print("{:<30} {:<30}".format("Role","Average Salary"))
        for row in l:
            print("{:<30} {:<30}".format(row[0],row[1]))
    elif(c==3):
        mycursor.execute("select coalesce(Type,'Average')as Type,AVG(Rating) as Average_Rating, AVG(Price) AS Average_Price, AVG(Protein) AS Average_Protein, AVG(Energy) AS Average_Energy, AVG(Carbohydrate) AS Average_Carbohydrate, AVG(Fat) AS Average_Fat, AVG(Quantity) AS Total_Quantity from Product Group By Type, Rating with ROLLUP;")
        l=mycursor.fetchall()
        print("{:<25} {:<25} {:<15} {:<25} {:<25} {:<25} {:<20} {:<20}".format("Type","Average Rating","Average Price","Average Protein","Average Energy","Average Carbohydrate","Average fat","Average Quantity"))
        for row in l:
            print("{:<25} {:<25} {:<15} {:<25} {:<25} {:<25} {:<20} {:<20}".format(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7]))
    elif(c==4):
        mycursor.execute("select coalesce(Customer_Id,'Total') as Customer_ID, coalesce(year(Date_Time_of_purchase),'Total') as Year, count(order_id) from orders group by Year, Customer_ID with rollup;")
        l=mycursor.fetchall()
        print("{:<20} {:<20} {:<20}".format('Customer ID','Year','Number of Orders'))
        for row in l:
            if (row[1]!=None):
                print("{:<20} {:<20} {:<20}".format(row[0],row[1],row[2]))
            else:
                print("{:<20} {:<20} {:<20}".format(row[0],"Total",row[2]))
    elif(c==5):
        mycursor.execute("select Order_ID, count(Customer_ID), Year from (select count(Order_id) as Order_ID, customer_id, year(Date_Time_of_Purchase) as Year from orders group by customer_id, Year ) as T group by Year, Order_ID with rollup;")
        l=mycursor.fetchall()
        print("{:<20} {:<20} {:<20}".format("Number of orders","Number of customers","Year"))
        for row in l:
            if(row[0]!=None):
                print("{:<20} {:<20} {:<20}".format(row[0],row[1],row[2]))            
    elif(c==6):
        return
def employee_login():
    uid=input("Enter your employee id: ")
    mycursor.execute("select Name,role from employee where id = %s", (uid,))
    ename=mycursor.fetchall()
    try:
        if(ename[0][1]=="Delivery"):
            delivery_page(uid,ename[0][0])
        else:
            employee_page(uid,ename[0][0])
    except:
        print("Invalid employee id")
        return 
def employee_page(eid,name):
    while(True):
        c=int(input(f"Welcome {name}! What would you like to do today?\n1. Check profile information\n2. Logout\n"))
        if(c==1):
            mycursor.execute("select * from employee where id=%s",(eid,))
            l=mycursor.fetchall()
            for row in l:
                print(f"ID: {row[0]}\nName: {row[1]}\nAddress: {row[2]}\nEmail: {row[3]}\nContact_No: {row[4]}\nSalary: {row[5]}\nRole: {row[6]}\n")
        elif(c==2):
            return
def delivery_page(eid,name):
    while(True):
        c=int(input(f"Welcome {name}! What would you like to do today?\n1. Check profile information\n2. Check orders delivered\n3. Logout\n"))
        if(c==1):
            mycursor.execute("select * from employee where id=%s",(eid,))
            l=mycursor.fetchall()
            for row in l:
                print(f"ID: {row[0]}\nName: {row[1]}\nAddress: {row[2]}\nEmail: {row[3]}\nContact_No: {row[4]}\nSalary: {row[5]}\nRole: {row[6]}\n")
        elif(c==2): 
            mycursor.execute("select * from orders where employee_id=%s",(eid,))
            l=mycursor.fetchall()
            print("{:<10} {:<20} {:<10} {:<30} {:<10}".format('Order ID','Payment Mode','Cost','Date','Customer_ID'))
            for i in l:
                # print(i)
                print("{:<10} {:<20} {:<10} {:<30} {:<10}".format(i[0],i[1],i[5],str(i[4]),i[3]))
        elif(c==3):
            return
while(True):
    print("Welcome to Golden Dairy:")
    ac=int(input("1. Customer login/sign up\n2. Admin login\n3. Product catalogue\n4. Get more product information\n5. Employee login\n6. Exit\n"))
    if(ac==1):
        c=int(input("1. Login\n2. Sign up\n3. Back\n"))
        if (c==1):
            login()
        elif(c==2):
            signup()
    elif(ac==2):
        admin_login()
    elif (ac==3):
        productlist()
    elif(ac==4):
        moreproductinfo()
    elif(ac==5):
        employee_login()
    elif (ac==6):
        break